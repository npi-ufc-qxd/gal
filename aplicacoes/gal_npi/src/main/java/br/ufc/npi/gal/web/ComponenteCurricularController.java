package br.ufc.npi.gal.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.npi.gal.model.DetalheMetaCalculada;
import br.ufc.npi.gal.model.ComponenteCurricular;
import br.ufc.npi.gal.model.IntegracaoCurricular;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.npi.gal.service.CalculoMetaService;
import br.ufc.npi.gal.service.ComponenteCurricularService;
import br.ufc.npi.gal.service.MetaCalculada;
import br.ufc.npi.gal.service.ResultadoCalculo;
import br.ufc.npi.gal.service.TituloService;
import br.ufc.quixada.npi.service.GenericService;

@Controller
@RequestMapping("componente")
public class ComponenteCurricularController {

	@Inject
	private ComponenteCurricularService componenteCurricularService;
	
	@Inject
	private TituloService tituloService;
	
	@Inject
	private CalculoMetaService calculoService;

	@Inject
	private GenericService<Bibliografia> bibliografiaService;
	
	@RequestMapping(value = "/listar")
	public String listar(ModelMap modelMap, HttpSession session) {
		modelMap.addAttribute("componentes", this.componenteCurricularService.find(ComponenteCurricular.class));
		return "componente/listar";
	}

	@RequestMapping(value = "/{id}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable("id") Integer id, ModelMap modelMap) {

		ComponenteCurricular componente = this.componenteCurricularService.find(ComponenteCurricular.class, id);

		if (componente == null) {
			return "redirect:/componente/listar";

		}
		modelMap.addAttribute("componente", componente);
		return "componente/editar";
	}

	@RequestMapping(value = "/editar", method = RequestMethod.POST)
	public String atualizar(@Valid ComponenteCurricular componente, BindingResult result,
			RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return "componente/editar";
		}

		if (componenteCurricularService.getOutraComponenteCurricularByCodigo(componente.getId(),
				componente.getCodigo()) != null) {
			result.rejectValue("codigo", "Repeat.componente.codigo",
					"Já existe um componente curricular com esse código");
			return "componente/editar";
		}
		if (componenteCurricularService.getOutraComponenteCurricularByNome(componente.getId(),
				componente.getNome().toUpperCase()) != null) {
			result.rejectValue("nome", "Repeat.componente.nome",
					"Já existe um componente curricular com esse nome");
			return "componente/editar";
		}

		componente.setNome(componente.getNome().toUpperCase());
		componenteCurricularService.update(componente);
		redirectAttributes.addFlashAttribute("info",
				"Componente curricular atualizado com sucesso.");
		return "redirect:/componente/listar";

	}

	@RequestMapping(value = "/{id}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable("id") Integer id,
			RedirectAttributes redirectAttributes) {
		ComponenteCurricular componente = componenteCurricularService.find(ComponenteCurricular.class, id);
		if (componente != null) {
			this.componenteCurricularService.delete(componente);
			redirectAttributes.addFlashAttribute("info",
					"Componente curricular removido com sucesso.");
		}
		return "redirect:/componente/listar";
	}

	@RequestMapping(value = "/adicionar")
	public String adicionar(ModelMap modelMap) {
		modelMap.addAttribute("componente", new ComponenteCurricular());
		return "componente/adicionar";
	}

	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public String adicionar(@ModelAttribute("componente") ComponenteCurricular componente, BindingResult result,
			RedirectAttributes redirectAttributes) {
		boolean errors = false;
		if (result.hasErrors()) {
			return "componente/adicionar";
		}
		
		if (componente.getCodigo().trim().isEmpty()) {
			result.rejectValue("codigo", "Repeat.componente.codigo",
					"Campo obrigatório.");
			errors = true;
		}

		if (componenteCurricularService.getComponenteCurricularByCodigo(componente.getCodigo()) != null) {
			result.rejectValue("codigo", "Repeat.componente.codigo",
					"Já existe um componente curricular com esse código");
			errors = true;
		}
		if (componente.getNome().trim().isEmpty()) {
			result.rejectValue("nome", "Repeat.componente.nome",
					"Campo obrigatório.");
			errors = true;
		}
		if (componenteCurricularService.getComponenteCurricularByNome(componente.getNome()
				.toUpperCase()) != null) {
			result.rejectValue("nome", "Repeat.componente.nome",
					"Já existe um componente curricular com esse nome");
			errors = true;
		}
		
		if (componente.getChPratica() == null) {
			result.rejectValue("chPratica", "Repeat.componente.chPratica",
					"Campo obrigatório.");
			errors = true;
		}
		
		if (componente.getChTeorica() == null) {
			result.rejectValue("chTeorica", "Repeat.componente.chTeorica",
					"Campo obrigatório.");
			errors = true;
		}
		
		if(errors == true){
			return "componente/adicionar";
		}

		componente.setNome(componente.getNome().toUpperCase());
		componenteCurricularService.save(componente);
		redirectAttributes.addFlashAttribute("info",
				"Componente curricular adicionado com sucesso.");
		return "redirect:/componente/listar";
	}

	@RequestMapping(value = "/{id}/vincular", method = RequestMethod.GET)
	public String vincular(@PathVariable("id") Integer id, ModelMap modelMap) {
		
		ComponenteCurricular componente = this.componenteCurricularService.find(ComponenteCurricular.class, id);
		
		if (componente == null) {
			return "redirect:/componente/listar";

		}
		
		List<Titulo> basica = componente.getTitulosBibliografiasBasicas();
		List<Titulo> complementar = componente.getTitulosBibliografiasComplementares();
		List<Titulo> titulos = this.tituloService.find(Titulo.class);
		
		for (Titulo titulo : basica) {
			titulos.remove(titulo);
		}
		
		for (Titulo titulo : complementar) {
			titulos.remove(titulo);
		}
		
		modelMap.addAttribute("titulo", titulos);
		modelMap.addAttribute("basica", basica);
		modelMap.addAttribute("complementar", complementar);
		modelMap.addAttribute("componente", componente);
		return "componente/vincularBibliografia";
	}
	
	@RequestMapping(value = "/vincular", method = RequestMethod.POST)
	public String vincular(@RequestParam("basica") String basica, @RequestParam("complementar") String complementar, @RequestParam("idComponente") Integer idComponente) {
		String[] basicaArray = basica.split(",");
		
		String[] complementarArray = complementar.split(",");


		ComponenteCurricular componente = this.componenteCurricularService.find(ComponenteCurricular.class,idComponente);
		List<Bibliografia> bibliografiaLista = componente.getBibliografias();
		
		bibliografiaLista = atualizarOuCriarBibliografia(basicaArray, bibliografiaLista, componente, ComponenteCurricular.BASICA);
		bibliografiaLista = atualizarOuCriarBibliografia(complementarArray, bibliografiaLista, componente, ComponenteCurricular.COMPLEMENTAR);
		for (int i = 0; i < bibliografiaLista.size(); i++) {
			bibliografiaService.delete(bibliografiaLista.get(i));
		}
		return "/componente/listar";
	}
	
	@RequestMapping(value = "/{id}/visualizar", method = RequestMethod.GET)
	public String visualizar(@PathVariable("id") Integer id, ModelMap modelMap) {
		
		ComponenteCurricular componente = this.componenteCurricularService.find(ComponenteCurricular.class, id);
		
		if (componente == null)
			return "redirect:/componente/listar";
		
		List<Titulo> basica = componente.getTitulosBibliografiasBasicas();
		List<Titulo> complementar = componente.getTitulosBibliografiasComplementares();
		
		List<Bibliografia> bibliografias = componente.getBibliografias();
		
		List<IntegracaoCurricular> curriculos = componente.getCurriculos();
		
		HashMap<String, List<MetaCalculada>> metasCalculadasPorTitulo = new HashMap<String, List<MetaCalculada>>();
		
		List<ResultadoCalculo> resultados = calculoService.gerarCalculo();
		
		for (Bibliografia b : bibliografias) {
			metasCalculadasPorTitulo.put(b.getTitulo().getNome(), new ArrayList<MetaCalculada>());
			for(ResultadoCalculo resultadoCalculo : resultados){
				if(resultadoCalculo.getTitulo().getId().equals(b.getTitulo().getId())){
					for(MetaCalculada metaCalculada : resultadoCalculo.getMetasCalculadas()){
						for(DetalheMetaCalculada detalheMetaCalculada: metaCalculada.getDetalhePar()){
							if(detalheMetaCalculada.getComponenteCurricular().equals(componente.getNome())){
								metasCalculadasPorTitulo.get(resultadoCalculo.getTitulo().getNome()).add(metaCalculada);
								break;
							}
						}
						for(DetalheMetaCalculada detalheMetaCalculada: metaCalculada.getDetalheImpar()){
							if(detalheMetaCalculada.getComponenteCurricular().equals(componente.getNome())){
								metasCalculadasPorTitulo.get(resultadoCalculo.getTitulo().getNome()).add(metaCalculada);
								break;
							}
						}
					}
				}
			}
		}
		
		modelMap.addAttribute("bibliografia_basica", basica);
		modelMap.addAttribute("bibliografia_complementar", complementar);
		modelMap.addAttribute("metasCalculadas", metasCalculadasPorTitulo);
		modelMap.addAttribute("curriculos", curriculos);
		modelMap.addAttribute("componente", componente);
		
		return "componente/visualizar";
	}


	public List<Bibliografia> atualizarOuCriarBibliografia (String[] listaIdTitulo, List<Bibliografia> bibliografiasAseremModificadas, ComponenteCurricular componente, String tipoBibliografia){
		int id_titulo;
		
		if(!listaIdTitulo[0].isEmpty()){
		for (int i = 0; i < listaIdTitulo.length; i++) {
			id_titulo = Integer.parseInt(listaIdTitulo[i]);
			for (int j = 0; j < bibliografiasAseremModificadas.size(); j++) {
				if (bibliografiasAseremModificadas.get(j).getTitulo().getId() == id_titulo) {
					if (!bibliografiasAseremModificadas.get(j).getTipoBibliografia().equals(tipoBibliografia)) {
						bibliografiasAseremModificadas.get(j).setTipoBibliografia(tipoBibliografia);
						bibliografiaService.update(bibliografiasAseremModificadas.get(j));
						bibliografiasAseremModificadas.remove(bibliografiasAseremModificadas.get(j));
						listaIdTitulo[i]=null;
						j=bibliografiasAseremModificadas.size()+1;
						
					}else{
						bibliografiasAseremModificadas.remove(bibliografiasAseremModificadas.get(j));
						listaIdTitulo[i]=null;
					}
					
				} 
			}
			if (listaIdTitulo[i]!=null){
				Bibliografia biblio = new Bibliografia();
				biblio.setComponenteCurricular(componente);
				biblio.setTitulo(tituloService.find(Titulo.class, id_titulo));
				biblio.setTipoBibliografia(tipoBibliografia);
				bibliografiaService.save(biblio);
			} 
		}
		}
		return bibliografiasAseremModificadas;
	}
	
	@RequestMapping(value = "/{idComponente}/copiar", method = RequestMethod.GET)
	public String copiar(@PathVariable("idComponente") int idComponente, ModelMap modelMap) {
		
		ComponenteCurricular componenteOrigem = componenteCurricularService.find(ComponenteCurricular.class, idComponente);
		ComponenteCurricular componenteDestino = new ComponenteCurricular();
		
		if (componenteOrigem == null) {
			return "redirect:/disciplina/listar";
		}

		componenteDestino.setTipo(componenteOrigem.getTipo());
		componenteDestino.setChPratica(componenteOrigem.getChPratica());
		componenteDestino.setChTeorica(componenteOrigem.getChTeorica());
		
		modelMap.addAttribute("componente", componenteDestino);
		modelMap.addAttribute("bibliografia_basica", componenteOrigem.getTitulosBibliografiasBasicas());
		modelMap.addAttribute("bibliografia_complementar", componenteOrigem.getTitulosBibliografiasComplementares());
		
		return "componente/copiar";
	}
		
	@RequestMapping(value = "/copiar", method = RequestMethod.POST)
	public String copiar(@ModelAttribute("componente") ComponenteCurricular componente,
			BindingResult result, RedirectAttributes redirectAttributes) {
		
		boolean errors = false;
		
		if (result.hasErrors()) {
			return "redirect:/componente/copiar";
		}
		
		if (componente.getCodigo().trim().isEmpty()) {
			result.rejectValue("codigo", "Repeat.componente.codigo",
					"Campo obrigatório.");
			errors = true;
		}

		if (componenteCurricularService.getComponenteCurricularByCodigo(componente.getCodigo()) != null) {
			result.rejectValue("codigo", "Repeat.componente.codigo",
					"Já existe um componente curricular com esse código");
			errors = true;
		}
		if (componente.getNome().trim().isEmpty()) {
			result.rejectValue("nome", "Repeat.componente.nome",
					"Campo obrigatório.");
			errors = true;
		}
		if (componenteCurricularService.getComponenteCurricularByNome(componente.getNome()) != null) {
			result.rejectValue("nome", "Repeat.componente.nome",
					"Já existe um componente curricular com esse nome");
			errors = true;
		}
		
		if (componente.getChPratica() == null) {
			result.rejectValue("chPratica", "Repeat.componente.chPratica",
					"Campo obrigatório.");
			errors = true;
		}
		
		if (componente.getChTeorica() == null) {
			result.rejectValue("chTeorica", "Repeat.componente.chTeorica",
					"Campo obrigatório.");
			errors = true;
		}
		
		if(errors){
			return "/componente/copiar";
		}
		
		componente.setNome(componente.getNome().toUpperCase());
		componenteCurricularService.save(componente);
		
		return "redirect:/componente/"+componente.getId()+"/visualizar";
	}

}