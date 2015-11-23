package br.ufc.npi.gal.web;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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

	@RequestMapping(value = "")
	public String uploadArquivo(ModelMap modelMap, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return "acervo/atualizar";
	}

	@RequestMapping(value = "/{idCurso}/importar", method = RequestMethod.POST)
	public String uploadEstruturaCurricular(@PathVariable("idCurso") Integer idCurso,
			@RequestParam("file") MultipartFile request, RedirectAttributes redirectAttributes) {

		List<String> infoCurriculo = new ArrayList<String>();

		if (request == null || request.getSize() <= 0) {
			redirectAttributes.addFlashAttribute("error", "Arquivo obrigatório");
			return "redirect:/curso/" + idCurso + "/visualizar";
		}

		try {
			infoCurriculo = parserEstruturaCurricular.processarArquivo(request, idCurso);
		} catch (Exception e) {
			System.err.println("Erro ao processar arquivo: " + e.getMessage());
			return "redirect:/curso/" + idCurso + "/visualizar";
		}

		Curso curso = cursoService.getCursoByCodigo(idCurso);
		if (estruturaCurricularService.getOutraEstruturaCurricularByAnoSemestre(curso.getId(),
				infoCurriculo.get(0)) == null) {
			parserEstruturaCurricular.registrarNovaEstruturaCurricular(infoCurriculo, curso);
			redirectAttributes.addFlashAttribute("info", "Estrutura cadastrada com sucesso");
		} else {
			redirectAttributes.addFlashAttribute("error", "Estrutura já cadastrada");
		}

		return "redirect:/curso/" + idCurso + "/visualizar";
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
