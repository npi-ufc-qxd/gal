package br.ufc.npi.gal.web;

import java.util.List;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.npi.gal.model.Disciplina;
import br.ufc.npi.gal.model.EstruturaCurricular;
import br.ufc.npi.gal.model.IntegracaoCurricular;
import br.ufc.npi.gal.service.DisciplinaService;
import br.ufc.npi.gal.service.EstruturaCurricularService;
import br.ufc.npi.gal.service.IntegracaoCurricularService;

@Controller
@RequestMapping("integracao")
public class IntegracaoCurricularController {
	
	@Inject
	private IntegracaoCurricularService integracaoService;
	
	@Inject
	private DisciplinaService disciplinaService;
	
	@Inject
	private EstruturaCurricularService estruturaService;
	
	@RequestMapping(value = "/{idDisciplina}/{idCurriculo}/excluir", method = RequestMethod.GET)
	public String excluir(RedirectAttributes redirectAttributes,@PathVariable("idDisciplina") Integer idDisciplina, @PathVariable("idCurriculo") Integer idCurriculo) {
		IntegracaoCurricular integracao = integracaoService.getIntegracaoByIdDisciplinaIdCurriculo(idDisciplina, idCurriculo);
		int codigoCurso = integracao.getEstruturaCurricular().getCurso().getCodigo();
		if (integracao != null) {
			this.integracaoService.delete(integracao);
			redirectAttributes.addFlashAttribute("info", "Integração Curricular removida com sucesso.");
		}
		
		return "redirect:/curso/" + codigoCurso + "/visualizar";
	}
	
	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public String adicionar(String disciplina, Integer quantidadeAlunos, Integer semestreOferta, Integer estruturaCurricular, final RedirectAttributes redirectAttributes) {
		
		EstruturaCurricular estruturaBD = estruturaService.find(EstruturaCurricular.class, estruturaCurricular);
		
		if(semestreOferta == null || semestreOferta <= 0 || semestreOferta > 10){
			redirectAttributes.addFlashAttribute("error",
					"Semestre de oferta inválido");
			return "redirect:/curso/" + estruturaBD.getCurso().getCodigo() + "/visualizar";
		}
		
		IntegracaoCurricular integracao =  new IntegracaoCurricular();
		Disciplina disciplinaBD = disciplinaService.getDisciplinaByCodigo(disciplina);
		
		List<IntegracaoCurricular> integracaoList = estruturaBD.getCurriculos();		
		
		if(disciplinaBD == null){
			redirectAttributes.addFlashAttribute("error", "Código da disciplina não existe");
			return "redirect:/curso/" + estruturaBD.getCurso().getCodigo() + "/visualizar";
		}
		
		for (IntegracaoCurricular integracaoCurricular : integracaoList) {
			if(integracaoCurricular.getDisciplina().equals(disciplinaBD)){
				redirectAttributes.addFlashAttribute("error", "Essa disciplina já está vinculada");
				return "redirect:/curso/" + estruturaBD.getCurso().getCodigo() + "/visualizar";
			}
		}		
		
		integracao.setDisciplina(disciplinaBD);
		integracao.setEstruturaCurricular(estruturaBD);
		
		integracao.setQuantidadeAlunos(quantidadeAlunos);
		integracao.setSemestreOferta(semestreOferta);
		
		integracaoService.save(integracao);
		
		redirectAttributes.addFlashAttribute("info", "Integracao Curricular adicionada com sucesso.");
		return "redirect:/curso/" + estruturaBD.getCurso().getCodigo() + "/visualizar";
	}

	@RequestMapping(value = "/{idCurriculo}/adicionar")
	public String adicionar(ModelMap modelMap, @PathVariable("idCurriculo") Integer idCurriculo, final RedirectAttributes redirectAttributes) {
		
		modelMap.addAttribute("idCurriculo", idCurriculo);
		modelMap.addAttribute("disciplinas", disciplinaService.getTodasDisciplinasOrderByCodigo());
		modelMap.addAttribute("integracao", new IntegracaoCurricular());
		
		return "integracao/adicionar";
	}
	
	@RequestMapping(value = "/{idDisciplina}/{idCurriculo}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable("idDisciplina") Integer idDisciplina,@PathVariable("idCurriculo") Integer idCurriculo, ModelMap modelMap) {

		IntegracaoCurricular integracao = this.integracaoService.getIntegracaoByIdDisciplinaIdCurriculo(idDisciplina, idCurriculo);

		if (integracao == null) {
			return "redirect:/curso/listar";

		}
		modelMap.addAttribute("integracao", integracao);
		return "integracao/editar";
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.POST)
	public String atualizar(@Valid IntegracaoCurricular integracao, BindingResult result,
			RedirectAttributes redirectAttributes) {
		EstruturaCurricular estrutura = this.estruturaService.find(EstruturaCurricular.class,
				integracao.getEstruturaCurricular().getId());
		
		if (integracao.getSemestreOferta() == null || integracao.getSemestreOferta() <= 0
				|| integracao.getSemestreOferta() > 10) {
			redirectAttributes.addFlashAttribute("error", "Semestre de oferta inválido");
			return "redirect:/curso/" + estrutura.getCurso().getCodigo() + "/visualizar";
		}

		integracaoService.update(integracao);
		redirectAttributes.addFlashAttribute("info",
				"Integração atualizada com sucesso.");
		return "redirect:/curso/" + estrutura.getCurso().getCodigo() + "/visualizar";

	}
	
	
}
