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

import br.ufc.npi.gal.model.ComponenteCurricular;
import br.ufc.npi.gal.model.EstruturaCurricular;
import br.ufc.npi.gal.model.IntegracaoCurricular;
import br.ufc.npi.gal.service.ComponenteCurricularService;
import br.ufc.npi.gal.service.EstruturaCurricularService;
import br.ufc.npi.gal.service.IntegracaoCurricularService;

@Controller
@RequestMapping("integracao")
public class IntegracaoCurricularController {
	
	@Inject
	private IntegracaoCurricularService integracaoService;
	
	@Inject
	private ComponenteCurricularService componenteCurricularService;
	
	@Inject
	private EstruturaCurricularService estruturaService;
	
	@RequestMapping(value = "/{idComponente}/{idCurriculo}/excluir", method = RequestMethod.GET)
	public String excluir(RedirectAttributes redirectAttributes,@PathVariable("idComponente") Integer idComponente, @PathVariable("idCurriculo") Integer idCurriculo) {
		IntegracaoCurricular integracao = integracaoService.getIntegracaoByIdComponenteCurricularIdCurriculo(idComponente, idCurriculo);
		int codigoCurso = integracao.getEstruturaCurricular().getCurso().getCodigo();
		if (integracao != null) {
			this.integracaoService.delete(integracao);
			redirectAttributes.addFlashAttribute("info", "Componente curricular removido do currículo com sucesso.");
		}
		
		return "redirect:/curso/" + codigoCurso + "/visualizar";
	}
	
	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public String adicionar(String componente, Integer quantidadeAlunos, Integer semestreOferta, Integer estruturaCurricular, final RedirectAttributes redirectAttributes) {

		
		EstruturaCurricular estruturaBD = estruturaService.find(EstruturaCurricular.class, estruturaCurricular);

		if(semestreOferta == null || semestreOferta <= 0 || semestreOferta > 10){

			redirectAttributes.addFlashAttribute("error",
					"Semestre de oferta inválido");
			return "redirect:/curso/" + estruturaBD.getCurso().getCodigo() + "/visualizar";
		}
		
		IntegracaoCurricular integracao =  new IntegracaoCurricular();
		ComponenteCurricular componenteBD = componenteCurricularService.getComponenteCurricularByCodigo(componente);
		
		List<IntegracaoCurricular> integracaoList = estruturaBD.getCurriculos();		
		
		if(componenteBD == null){
			redirectAttributes.addFlashAttribute("error", "Código do componente curricular não existe");
			return "redirect:/curso/" + estruturaBD.getCurso().getCodigo() + "/visualizar";
		}
		
		for (IntegracaoCurricular integracaoCurricular : integracaoList) {
			if(integracaoCurricular.getComponente().equals(componenteBD)){
				redirectAttributes.addFlashAttribute("error", "Esse componente curricular já está vinculado");
				return "redirect:/curso/" + estruturaBD.getCurso().getCodigo() + "/visualizar";
			}
		}		
		
		integracao.setComponente(componenteBD);
		integracao.setEstruturaCurricular(estruturaBD);
		

		integracao.setQuantidadeAlunos(quantidadeAlunos);
		integracao.setSemestreOferta(semestreOferta);
		
		integracaoService.save(integracao);
		
		redirectAttributes.addFlashAttribute("info", "Componente curricular adicionado ao currículo com sucesso.");
		return "redirect:/curso/" + estruturaBD.getCurso().getCodigo() + "/visualizar";
	}

	@RequestMapping(value = "/{idCurriculo}/adicionar")
	public String adicionar(ModelMap modelMap, @PathVariable("idCurriculo") Integer idCurriculo, final RedirectAttributes redirectAttributes) {
		
		EstruturaCurricular estrutura = this.estruturaService.find(EstruturaCurricular.class, idCurriculo);
		
		modelMap.addAttribute("idCurriculo", idCurriculo);
		modelMap.addAttribute("componentes", componenteCurricularService.find(ComponenteCurricular.class));
		modelMap.addAttribute("integracao", new IntegracaoCurricular());
		modelMap.addAttribute("semestreMax", estrutura.getPrazoConclusaoMedio());
		
		return "integracao/adicionar";
	}
	
	@RequestMapping(value = "/{idComponente}/{idCurriculo}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable("idComponente") Integer idComponente,@PathVariable("idCurriculo") Integer idCurriculo, ModelMap modelMap, RedirectAttributes redirectAttributes) {

		EstruturaCurricular estrutura = this.estruturaService.find(EstruturaCurricular.class, idCurriculo);
		IntegracaoCurricular integracao = this.integracaoService.getIntegracaoByIdComponenteCurricularIdCurriculo(idComponente, idCurriculo);

		if (integracao == null) {
			redirectAttributes.addFlashAttribute("error", "Esta integração curricular não existe");
			return "redirect:/curso/listar";
		}
		
		modelMap.addAttribute("semestreMax", estrutura.getPrazoConclusaoMedio());
		modelMap.addAttribute("integracao", integracao);
		return "integracao/editar";
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.POST)
	public String atualizar(@Valid IntegracaoCurricular integracao, BindingResult result,
			RedirectAttributes redirectAttributes) {
		EstruturaCurricular estrutura = this.estruturaService.find(EstruturaCurricular.class,
				integracao.getEstruturaCurricular().getId());

		integracaoService.update(integracao);
		redirectAttributes.addFlashAttribute("info", "Integração atualizada com sucesso.");
		return "redirect:/curso/" + estrutura.getCurso().getCodigo() + "/visualizar";
	}
	
	
}
