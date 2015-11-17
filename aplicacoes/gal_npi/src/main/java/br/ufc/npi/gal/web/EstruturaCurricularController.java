package br.ufc.npi.gal.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.npi.gal.model.AcervoDocumento;
import br.ufc.npi.gal.model.Curso;
import br.ufc.npi.gal.model.EstruturaCurricular;
import br.ufc.npi.gal.service.CursoService;
import br.ufc.npi.gal.service.EstruturaCurricularService;
import br.ufc.npi.gal.service.impl.ParserEstruturaCurricularServiceImpl;

@Controller
@RequestMapping("estrutura")
public class EstruturaCurricularController {

	@Inject
	private EstruturaCurricularService estruturaCurricularService;
	@Inject
	private CursoService cursoService;
	@Inject
	private ParserEstruturaCurricularServiceImpl parserEstruturaCurricular;

	@RequestMapping(value = "/listar")
	public String listar(ModelMap modelMap) throws IOException {
		modelMap.addAttribute("estrutura", this.estruturaCurricularService.find(EstruturaCurricular.class));
		return "estrutura/listar";
	}

	@RequestMapping(value = "/{id}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable("id") Integer id, ModelMap modelMap) {
		EstruturaCurricular estruturaCurricular = this.estruturaCurricularService.find(EstruturaCurricular.class, id);
		if (estruturaCurricular == null) {
			return "curso/listar";
		}
		modelMap.addAttribute("curso", estruturaCurricular.getCurso());
		modelMap.addAttribute("estruturaCurricular", estruturaCurricular);
		return "estrutura/editar";
	}
	
	@RequestMapping(value = "/{id}/editar", method = RequestMethod.POST)
	public String atualizar(@Valid EstruturaCurricular estrutura, BindingResult result,
			RedirectAttributes redirectAttributes, @PathVariable("id") Integer id, ModelMap modelMap) {
		Curso curso = cursoService.find(Curso.class, id);
		modelMap.addAttribute("curso", curso);

		if (result.hasErrors()) {
			return "estrutura/editar";
		}

		estrutura.setCurso(curso);

		estruturaCurricularService.update(estrutura);
		redirectAttributes.addFlashAttribute("info", "Estrutura Curricular atualizada com sucesso");
		return "redirect:/curso/listar";
	}

	@RequestMapping(value = "/{id}/excluir")
	public String excluir(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		EstruturaCurricular estruturaCurricular = estruturaCurricularService.find(EstruturaCurricular.class, id);

		if (estruturaCurricular != null) {
			this.estruturaCurricularService.delete(estruturaCurricular);

		}
		redirectAttributes.addFlashAttribute("info", "Estrutura Curricular removida com sucesso");
		return "redirect:/curso/listar";
	}

	@RequestMapping(value = "/{id}/adicionar", method = RequestMethod.GET)
	public String adicionar(@PathVariable("id") Integer id, ModelMap modelMap) {

		Curso curso = this.cursoService.find(Curso.class, id);
		modelMap.addAttribute("curso", curso);
		modelMap.addAttribute("estruturaCurricular", new EstruturaCurricular());
		return "estrutura/adicionar";
	}

	@RequestMapping(value = "/{id}/importar/", method = RequestMethod.POST)
	public String uploadEstruturaCurricular(@PathVariable("id") Integer id, @ModelAttribute("curriculo") EstruturaCurricular estruturaCurricular,
			@RequestParam("file") MultipartFile request, BindingResult result, RedirectAttributes redirectAttributes) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		List<String> infoCurriculo = new ArrayList<String>();
		boolean erros = false;		
		if (request.isEmpty()) {
			result.rejectValue("arquivo", "Repeat.AcervoDocumento.arquivo",
					"Arquivo enviado inexistente");
			erros = true;
		} else if (!TestFormato(request)) {
			result.rejectValue("arquivo", "Repeat.AcervoDocumento.arquivo",
					"Formato de arquivo incorreto, por favor selecionar um arquivo html");
			erros = true;
		}
		if (erros) {
			return "acervo/atualizar";
		}
		try {
			infoCurriculo = parserEstruturaCurricular.processarArquivo(request, id);
		} catch (Exception e) {
			System.err.println("Erro ao processar arquivo: "
					+ e.getStackTrace());
		}
		parserEstruturaCurricular.registrarNovaEstruturaCurricular(infoCurriculo, cursoService.getCursoById(id));
		return null;
	}

	private boolean TestFormato(MultipartFile request) {
		String nome = request.getOriginalFilename();
		String extencao = (String) nome.subSequence(nome.length() - 5, nome.length());
		if (extencao.equals(".html")) {
			return true;
		}
		return false;
	}

	@RequestMapping(value = "/{id}/adicionar", method = RequestMethod.POST)
	public String adicionar(@Valid EstruturaCurricular estruturaCurricular, BindingResult result,
			@PathVariable("id") Integer id, RedirectAttributes redirectAttributes, ModelMap modelMap) {
		Curso curso = this.cursoService.find(Curso.class, id);
		modelMap.addAttribute("curso", curso);
		if (result.hasErrors()) {
			return "estrutura/adicionar";
		}

		if (estruturaCurricular.getAnoSemestre().trim().isEmpty()) {
			result.rejectValue("anoSemestre", "Repeat.estrutura.anoSemestre", "Campo obrigatório.");
			return "estrutura/adicionar";
		}

		if (estruturaCurricularService.getOutraEstruturaCurricularByAnoSemestre(id,
				estruturaCurricular.getAnoSemestre()) != null) {
			result.rejectValue("anoSemestre", "Repeat.estruturas.anoSemestre", "Ano e Semestre já existe para curso");
			return "estrutura/adicionar";
		}

		estruturaCurricular.setCurso(curso);
		estruturaCurricular.setId(null);

		estruturaCurricularService.save(estruturaCurricular);

		redirectAttributes.addFlashAttribute("info", "Estrutura Curricular adicionada com sucesso.");
		return "redirect:/curso/listar";
	}
}
