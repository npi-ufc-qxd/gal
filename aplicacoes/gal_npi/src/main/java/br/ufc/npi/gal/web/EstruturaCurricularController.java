package br.ufc.npi.gal.web;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.npi.gal.model.Curso;
import br.ufc.npi.gal.model.EstruturaCurricular;
import br.ufc.npi.gal.service.CursoService;
import br.ufc.npi.gal.service.EstruturaCurricularService;

@Controller
@RequestMapping("estrutura")
public class EstruturaCurricularController {

	@Inject
	private EstruturaCurricularService estruturaCurricularService;
	@Inject
	private CursoService cursoService;
	
	
	@RequestMapping(value = "/listar")
	public String listar(ModelMap modelMap) {
		modelMap.addAttribute("estruturas", this.estruturaCurricularService.find(EstruturaCurricular.class));
		return "estrutura/listar";
	}

	@RequestMapping(value="/id/editar")
	public String editar(@PathVariable("id") Integer id, ModelMap modelMap){
		EstruturaCurricular estruturaCurricular = this.estruturaCurricularService.find(EstruturaCurricular.class, id);
		
		if(estruturaCurricular == null){
			return "estrutura/listar";
		}
		modelMap.addAttribute("estruturas", estruturaCurricular);
		return "estrutura/editar";
	}
	
	@RequestMapping(value="/editar", method=RequestMethod.POST)
	public String atualizar(@Valid EstruturaCurricular estrutura,BindingResult result, RedirectAttributes redirectAttributes){
		if(result.hasErrors()){
			return "estrutura/editar";
		}
		
		if(estruturaCurricularService.getOutraEstruturaCurricularByAnoSemestre(estrutura.getId(), estrutura.getAnoSemestre()) != null){
			result.rejectValue("anoSemestre", "Repeat.estrutura.anoSemestre","Ano e Semestre já cadastrado no Curso");
		}
		estruturaCurricularService.update(estrutura);
		redirectAttributes.addFlashAttribute("info","Estrutura Curricular atualizada com sucesso");
		return "redirect:/estrutura/listar";
	}
	
	@RequestMapping(value="/{id}/excluir")
	public String excluir(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes){
		EstruturaCurricular estruturaCurricular = estruturaCurricularService.find(EstruturaCurricular.class, id);
		
		if(estruturaCurricular != null){
			this.estruturaCurricularService.delete(estruturaCurricular);
			redirectAttributes.addFlashAttribute("info","Estrutura Curricular removida com sucesso");
		}
		return "estrutura/listar";
	}
	
	@RequestMapping(value="/{id}/adicionar")
	public String adicionar(@PathVariable("id") Integer id,ModelMap modelMap){
		
		modelMap.addAttribute("estruturas", new EstruturaCurricular());
		modelMap.addAttribute("curso",this.cursoService.find(Curso.class,id));
		return "estrutura/adicionar";
	}
	
	@RequestMapping(value="/{id}/adicionar", method = RequestMethod.POST)
	public String adicionar(@Valid EstruturaCurricular estrutura, @PathVariable("id") Integer id,BindingResult result,
			RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			return "estrutura/adicionar";
		}
		
		if (estrutura.getAnoSemestre().trim().isEmpty()) {
			result.rejectValue("anoSemestre", "Repeat.estruturas.anoSemestre",
					"Campo obrigatório.");
			return "estrutura/adicionar";
		}
		
//		if(estruturaCurricularService.getOutraEstruturaCurricularByAnoSemestre(id, estrutura.getAnoSemestre().toUpperCase())!=null){
//			result.rejectValue("anoSemestre", "Repeat.estruturas.anoSemestre","Ano e Semestre já existe para curso");
//			return "estrutura/adicionar";
//		}
		
		Curso curso = this.cursoService.find(Curso.class,id);
		estrutura.setCurso(curso);
		estrutura.setId(null);
		System.out.println(curso.getNome());
		
		estruturaCurricularService.save(estrutura);
		
		redirectAttributes.addFlashAttribute("info",
				"Estrutura adicionada com sucesso.");
		return "redirect:/curso/listar";
	}
}
