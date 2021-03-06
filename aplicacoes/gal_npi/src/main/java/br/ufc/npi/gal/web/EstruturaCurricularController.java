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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.npi.gal.model.Curso;
import br.ufc.npi.gal.model.EstruturaCurricular;
import br.ufc.npi.gal.service.CursoService;
import br.ufc.npi.gal.service.EstruturaCurricularService;
import br.ufc.npi.gal.service.impl.ParserEstruturaCurricularServiceImpl;

@Controller
public class EstruturaCurricularController {

	@Inject
	private EstruturaCurricularService estruturaCurricularService;
	@Inject
	private CursoService cursoService;
	@Inject
	private ParserEstruturaCurricularServiceImpl parserEstruturaCurricular;

	@RequestMapping(value = "curso/estrutura/listar")
	public String listar(ModelMap modelMap) throws IOException {
		modelMap.addAttribute("estrutura", this.estruturaCurricularService.find(EstruturaCurricular.class));
		return "estrutura/listar";
	}

	@RequestMapping(value = { "curso/{codigo}/estrutura/{id}/editar", "/{id}/editar" }, method = RequestMethod.GET)
	public String editar(@PathVariable("id") Integer id, ModelMap modelMap) {
		EstruturaCurricular estruturaCurricular = this.estruturaCurricularService.find(EstruturaCurricular.class, id);
		if (estruturaCurricular == null) {
			return "curso/listar";
		}
		modelMap.addAttribute("curso", estruturaCurricular.getCurso());
		modelMap.addAttribute("estruturaCurricular", estruturaCurricular);
		return "curso/estrutura/editar";
	}

	@RequestMapping(value = { "curso/{codigo}/estrutura/{id}/editar", "/{id}/editar" }, method = RequestMethod.POST)
	public String atualizar(@Valid EstruturaCurricular estrutura, BindingResult result,
			RedirectAttributes redirectAttributes, @PathVariable("id") Integer id,
			@PathVariable("codigo") Integer codigo, ModelMap modelMap) {
		Curso curso = cursoService.getCursoByCodigo(codigo);

		modelMap.addAttribute("curso", curso);

		EstruturaCurricular oldEstrutura = estruturaCurricularService
				.getOutraEstruturaCurricularByCodigo(estrutura.getId(), estrutura.getCodigo());

		if (result.hasErrors()) {
			return "curso/estrutura/editar";
		}

		estrutura.setCurso(oldEstrutura.getCurso());
		estrutura.setCurriculos(oldEstrutura.getCurriculos());
		estrutura.setCurso(curso);
		estruturaCurricularService.update(estrutura);
		redirectAttributes.addFlashAttribute("info", "Estrutura Curricular atualizada com sucesso");
		return "redirect:/curso/" + curso.getCodigo() + "/visualizar";
	}

	@RequestMapping(value = "curso/{codigo}/estrutura/{id}/excluir")
	public String excluir(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		EstruturaCurricular estruturaCurricular = estruturaCurricularService.find(EstruturaCurricular.class, id);

		if (estruturaCurricular != null) {
			this.estruturaCurricularService.delete(estruturaCurricular);

		}
		redirectAttributes.addFlashAttribute("info", "Estrutura Curricular removida com sucesso");
		return "redirect:/curso/" + estruturaCurricular.getCurso().getCodigo() + "/visualizar";
	}

	@RequestMapping(value = "curso/{codigo}/estrutura/adicionar", method = RequestMethod.GET)
	public String adicionar(@PathVariable("codigo") Integer codigo, ModelMap modelMap) {

		Curso curso = this.cursoService.getCursoByCodigo(codigo);
		modelMap.addAttribute("curso", curso);
		modelMap.addAttribute("estruturaCurricular", new EstruturaCurricular());
		return "curso/estrutura/adicionar";
	}

	@RequestMapping(value = "curso/{codigo}/estrutura/adicionar", method = RequestMethod.POST)
	public String adicionar(@Valid EstruturaCurricular estruturaCurricular, BindingResult result,
			@PathVariable("codigo") Integer codigo, RedirectAttributes redirectAttributes, ModelMap modelMap) {
		Curso curso = this.cursoService.getCursoByCodigo(codigo);
		modelMap.addAttribute("curso", curso);

		if (result.hasErrors()) {
			return "curso/estrutura/adicionar";
		}
		
		if (estruturaCurricular.getCodigo().trim().isEmpty()) {
			result.rejectValue("codigo", "Repeat.estrutura.codigo", "Campo obrigatório.");
			return "curso/estrutura/adicionar";
		}

		if (estruturaCurricularService.getOutraEstruturaCurricularByCodigo(curso.getCodigo(),
				estruturaCurricular.getCodigo()) != null) {
			result.rejectValue("codigo", "Repeat.estruturas.codigo", "Ano e Semestre já existe para curso");
			return "curso/estrutura/adicionar";
		}

		estruturaCurricular.setCurso(curso);
		estruturaCurricular.setId(null);

		estruturaCurricularService.save(estruturaCurricular);

		redirectAttributes.addFlashAttribute("info", "Estrutura Curricular adicionada com sucesso.");
		return "redirect:/curso/" + curso.getCodigo() + "/visualizar";
	}
	
	@RequestMapping(value = "")
	public String uploadArquivo(ModelMap modelMap, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return "acervo/atualizar";
	}

	@RequestMapping(value = "curso/{idCurso}/estrutura/importar", method = RequestMethod.POST)
	public String uploadEstruturaCurricular(@PathVariable("idCurso") Integer idCurso,
			@RequestParam("file") MultipartFile request, RedirectAttributes redirectAttributes) {

		List<String> infoCurriculo = new ArrayList<String>();
	
		if (request == null || request.getSize() <= 0) {
			redirectAttributes.addFlashAttribute("error", "Arquivo obrigatório");
			return "redirect:/curso/" + idCurso + "/visualizar";
		}
		
		if(!request.getOriginalFilename().substring(request.getOriginalFilename().indexOf('.')).equals(".html")){
			redirectAttributes.addFlashAttribute("error", "Formato inválido de arquivo. Por favor selecione um arquivo HTML");
			return "redirect:/curso/" + idCurso + "/visualizar";
		}

		try {
			if (parserEstruturaCurricular.verificaConformidadeDocumeto(request, idCurso) == false) {
				redirectAttributes.addFlashAttribute("error",
						"O documento enviado não apresenta uma estrutura curricular do Curso de "
								+ cursoService.getCursoByCodigo(idCurso).getNome());
				return "redirect:/curso/" + idCurso + "/visualizar";
			}
		} catch (IOException e1) {
			e1.printStackTrace();
			redirectAttributes.addFlashAttribute("error",
					"Não foi possível o upload das informações. Por favor tente novamente");
			return "redirect:/curso/" + idCurso + "/visualizar";
		}

		try {
			infoCurriculo = parserEstruturaCurricular.processarArquivo(idCurso);
		} catch (Exception e) {
			System.err.println("Erro ao processar arquivo: " + e.getMessage());
			return "redirect:/curso/" + idCurso + "/visualizar";
		}

		Curso curso = cursoService.getCursoByCodigo(idCurso);
		
		if (estruturaCurricularService.getOutraEstruturaCurricularByCodigoSemestre(curso.getId(),
				infoCurriculo.get(0)) == null) {
			parserEstruturaCurricular.registrarNovaEstruturaCurricular(infoCurriculo, curso);
			redirectAttributes.addFlashAttribute("info", "Estrutura cadastrada com sucesso");
		} else {
			redirectAttributes.addFlashAttribute("error", "Estrutura já cadastrada");
		}

		return "redirect:/curso/" + idCurso + "/visualizar";
	}
	
	@RequestMapping(value="curso/{idCurso}/estrutura/{id}/relatorioGeral", method = RequestMethod.GET)
	public String relatorioGeralEstruturaCurricular (@PathVariable("id") Integer id, ModelMap modelMap){
		EstruturaCurricular estruturaCurricular = estruturaCurricularService.find(EstruturaCurricular.class, id);
		if(estruturaCurricular == null){
			return "redirect:/disciplina/listar";
		}
		modelMap.addAttribute("estrutura", estruturaCurricular);
		return "curso/estrutura/relatorioGeral";
	}

}
