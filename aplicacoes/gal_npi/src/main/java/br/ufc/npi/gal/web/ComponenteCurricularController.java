package br.ufc.npi.gal.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import br.ufc.npi.gal.model.ComponenteCurricular;
import br.ufc.npi.gal.model.DetalheMetaCalculada;
import br.ufc.npi.gal.model.IntegracaoCurricular;
import br.ufc.npi.gal.model.RevisionAuditoria;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.npi.gal.service.CalculoMetaService;
import br.ufc.npi.gal.service.ComponenteCurricularService;
import br.ufc.npi.gal.service.IntegracaoCurricularService;
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
	@Inject
	private IntegracaoCurricularService integracaoCurricularService;

	private static final String COMPLEMENTAR = "Complementar";
	private static final String BASICA = "Básica";

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
	public String atualizar(@Valid @ModelAttribute("componente") ComponenteCurricular componente, BindingResult result,
			RedirectAttributes redirectAttributes) {
		boolean errors = false;

		if (result.hasErrors()) {
			return "componente/editar";
		}

		if (componenteCurricularService.getOutraComponenteCurricularByCodigo(componente.getId(),
				componente.getCodigo()) != null) {
			result.rejectValue("codigo", "Repeat.componente.codigo",
					"Já existe um componente curricular com esse código");
			errors = true;
		}

		if (componenteCurricularService.getOutraComponenteCurricularByNome(componente.getId(),
				componente.getNome().toUpperCase()) != null) {
			result.rejectValue("nome", "Repeat.componente.nome", "Já existe um componente curricular com esse nome");
			errors = true;
		}

		if (analiseComponente(componente, result, redirectAttributes, errors)) {
			return "componente/editar";
		}

		componente.setNome(componente.getNome().toUpperCase());
		componenteCurricularService.update(componente);
		redirectAttributes.addFlashAttribute("info", "Componente curricular atualizado com sucesso.");
		return "redirect:/componente/" + componente.getId() + "/visualizar";

	}

	@RequestMapping(value = "/{id}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		ComponenteCurricular componente = componenteCurricularService.find(ComponenteCurricular.class, id);

		if (integracaoCurricularService.getIntegracaoByIdComponente(id) == null) {
			if (componente != null) {
				this.componenteCurricularService.delete(componente);
				redirectAttributes.addFlashAttribute("info", "Componente curricular removido com sucesso.");
			}
		} else {
			redirectAttributes.addFlashAttribute("error", "O Componente Curricular (" + componente.getNome()
					+ ") faz parte de Estruturas Curriculares de alguns cursos. Por favor, resolva estas dependências para tentar excluir este componente curricular.");
		}

		return "redirect:/componente/listar";
	}

	@RequestMapping(value = "/adicionar")
	public String adicionar(ModelMap modelMap) {
		modelMap.addAttribute("componente", new ComponenteCurricular());
		return "componente/adicionar";
	}

	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public String adicionar(@Valid @ModelAttribute("componente") ComponenteCurricular componente, BindingResult result,
			RedirectAttributes redirectAttributes) {
		boolean errors = false;
		if (result.hasErrors()) {
			return "componente/adicionar";
		}

		if (componenteCurricularService.getComponenteCurricularByNome(componente.getNome().toUpperCase()) != null) {
			result.rejectValue("nome", "Repeat.componente.nome", "Já existe um componente curricular com esse nome");
			errors = true;
		}

		if (componenteCurricularService.getComponenteCurricularByCodigo(componente.getCodigo()) != null) {
			result.rejectValue("codigo", "Repeat.componente.codigo",
					"Já existe um componente curricular com esse código");
			errors = true;
		}

		if (analiseComponente(componente, result, redirectAttributes, errors)) {
			return "componente/adicionar";
		}

		componente.setNome(componente.getNome().toUpperCase());
		componenteCurricularService.save(componente);
		redirectAttributes.addFlashAttribute("info", "Componente curricular adicionado com sucesso.");
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
	public String vincular(@RequestParam("basica") String basica, @RequestParam("complementar") String complementar, @RequestParam("idComponente") Integer idComponente,
			RedirectAttributes redirectAttributes) {

		String[] basicaArray = basica.split(",");
		String[] complementarArray = complementar.split(",");

		ComponenteCurricular componente = this.componenteCurricularService.find(ComponenteCurricular.class,idComponente);
		List<Bibliografia> listaBibliografiaBasica = componente.getBibliografiasPorTipo(BASICA);
		List<Bibliografia> listaBibliografiaComplementar = componente.getBibliografiasPorTipo(COMPLEMENTAR);
		
		atualizarBibliografiaBasica(basicaArray, complementarArray, listaBibliografiaBasica, componente);
		atualizarBibliografiaComplementar(complementarArray, basicaArray, listaBibliografiaComplementar, componente);
		redirectAttributes.addFlashAttribute("info", "Vinculações realizadas com sucesso.");
		return "redirect:/componente/" + componente.getId() + "/visualizar";
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
			for (ResultadoCalculo resultadoCalculo : resultados) {
				if (resultadoCalculo.getTitulo().getId().equals(b.getTitulo().getId())) {
					for (MetaCalculada metaCalculada : resultadoCalculo.getMetasCalculadas()) {
						for (DetalheMetaCalculada detalheMetaCalculada : metaCalculada.getDetalhePar()) {
							if (detalheMetaCalculada.getComponente().equals(componente.getNome())) {
								metasCalculadasPorTitulo.get(resultadoCalculo.getTitulo().getNome()).add(metaCalculada);
								break;
							}
						}
						for (DetalheMetaCalculada detalheMetaCalculada : metaCalculada.getDetalheImpar()) {
							if (detalheMetaCalculada.getComponente().equals(componente.getNome())) {
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
	
	public void atualizarBibliografiaBasica(String[] listaIdTituloBasica, 
			String[] listaIdTituloComplementar, List<Bibliografia> bibliografiasAseremModificadas, ComponenteCurricular componente){
		atualizarOuCriarBibliografia(listaIdTituloBasica, listaIdTituloComplementar, bibliografiasAseremModificadas, componente, BASICA);
	}
	
	public void atualizarBibliografiaComplementar(String[] listaIdTituloComplementar, 
			String[] listaIdTituloBasica,List<Bibliografia> bibliografiasAseremModificadas, 
			ComponenteCurricular componente){
		atualizarOuCriarBibliografia(listaIdTituloComplementar, listaIdTituloBasica, bibliografiasAseremModificadas, componente, COMPLEMENTAR);
	}

	public void atualizarOuCriarBibliografia(String[] listaIdTitulo,
			String[] listaIdTituloAtualizados, List<Bibliografia> bibliografiasAseremModificadas, 
			ComponenteCurricular componente,
			String tipoBibliografia) {
		
		List<Integer> convertedId = new ArrayList<Integer>();
		for (String idTexto : listaIdTitulo) {
			if(!idTexto.isEmpty()){
				Integer id = Integer.valueOf(idTexto);
				convertedId.add(id);
				int a;
			}
		}
		
		Set<Integer> informados = new HashSet<Integer>(convertedId);
		
		Set<Integer> atuais = new HashSet<Integer>();
		for (Bibliografia bibliografia : bibliografiasAseremModificadas) {
			atuais.add(bibliografia.getTitulo().getId());
		}
		
		Set<Integer> novos = new HashSet<Integer>(informados);
		novos.removeAll(atuais);
		
		Set<Integer> removidos = new HashSet<Integer>(atuais);
		removidos.removeAll(informados);
		
		Set<Integer> atualizar = new HashSet<Integer>(informados);
		atualizar.retainAll(atuais);
		
		atualizarBibliografia(convertedId, atualizar, bibliografiasAseremModificadas, tipoBibliografia);
		addBibliografia(convertedId, novos, componente, tipoBibliografia);
		removerBibliografia(bibliografiasAseremModificadas, removidos, tipoBibliografia,listaIdTituloAtualizados);
	}
	public void atualizarBibliografia(List<Integer> convertedId,
			Set<Integer> atualizar,List<Bibliografia> bibliografiasAseremModificadas,
			String tipoBibliografia){
		for(int i = 0; i < convertedId.size(); i++) {
			Integer id = convertedId.get(i);
			if(atualizar.contains(id)){
				for(Bibliografia b : bibliografiasAseremModificadas){
					if(id.equals( b.getTitulo().getId())){
						b.setTipoBibliografia(tipoBibliografia);
						b.setPrioridade(i);
						bibliografiaService.update(b);
					}
				}
			}
		}
	}
	public void addBibliografia(List<Integer> convertedId,
			Set<Integer> novos,ComponenteCurricular componente,
			String tipoBibliografia){
		for(int i = 0; i < convertedId.size(); i++) {
			Integer id = convertedId.get(i);
			if(novos.contains(id)){
				Bibliografia aux = new Bibliografia();
				aux.setComponenteCurricular(componente);
				aux.setTitulo(tituloService.find(Titulo.class, id));
				aux.setTipoBibliografia(tipoBibliografia);
				aux.setPrioridade(i);
				bibliografiaService.update(aux);
			} 
		}
	}
	public void removerBibliografia(List<Bibliografia> bibliografiasAseremModificadas,
			Set<Integer> removidos, String tipoBibliografia,
			String[] listaIdTituloAtualizados){
		
		if(tipoBibliografia.equals(COMPLEMENTAR)){
			List<Integer> listaIdAtualizadosBasica = new ArrayList<Integer>();
			for(String idAtualizados : listaIdTituloAtualizados){
				if(!idAtualizados.isEmpty()){
					Integer id = Integer.valueOf(idAtualizados);
					listaIdAtualizadosBasica.add(id);
				}
			}
			Set<Integer> idsAtualizadosEmBasica =  new HashSet<Integer>(listaIdAtualizadosBasica);
			removidos.removeAll(idsAtualizadosEmBasica);
		}else{
			for(Integer id : removidos){
				for(Bibliografia b : bibliografiasAseremModificadas){
					if(b.getTitulo().getId() == id){
						bibliografiaService.delete(b);
					}
				}
			}
		}
		

	}
	@RequestMapping(value = "/{idComponente}/copiar", method = RequestMethod.GET)
	public String copiar(@PathVariable("idComponente") int idComponente, ModelMap modelMap) {
		
		ComponenteCurricular componenteOrigem = componenteCurricularService.find(ComponenteCurricular.class, idComponente);
		
		if (componenteOrigem == null) {
			return "redirect:/disciplina/listar";

		}
		List<Titulo> basica = componenteOrigem.getTitulosBibliografiasBasicas();
		List<Titulo> complementar = componenteOrigem.getTitulosBibliografiasComplementares();
		
		modelMap.addAttribute("componente", new ComponenteCurricular());
		modelMap.addAttribute("bibliografia_basica", basica);
		modelMap.addAttribute("bibliografia_complementar", complementar);
		modelMap.addAttribute("id_componente_origem", componenteOrigem.getId());
		
		return "componente/copiar";
	}
		
	@RequestMapping(value = "/copiar", method = RequestMethod.POST)
	public String copiar(@ModelAttribute("componente") ComponenteCurricular componente,
			@RequestParam("id_componente_origem") int idComponenteOrigem, 
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
		
		ComponenteCurricular componenteOrigem = componenteCurricularService.find(ComponenteCurricular.class, idComponenteOrigem);
		
		componente.setNome(componente.getNome().toUpperCase());
		componenteCurricularService.save(componente);
		
		List<Titulo> basica = componenteOrigem.getTitulosBibliografiasBasicas();
		List<Titulo> complementar = componenteOrigem.getTitulosBibliografiasComplementares();
		
		criarBibliografias(basica, componente, ComponenteCurricular.BASICA);
		criarBibliografias(complementar, componente, ComponenteCurricular.COMPLEMENTAR);
		
		
		return "redirect:/componente/"+componente.getId()+"/visualizar";
	}
	
	private void criarBibliografias(List<Titulo> titulos, ComponenteCurricular componente, String tipo) {
		

		if(titulos.size() > 0) {
			for(Titulo titulo : titulos) {
				Bibliografia bibliografia = new Bibliografia();
				bibliografia.setComponenteCurricular(componente);
				bibliografia.setTitulo(tituloService.find(Titulo.class, titulo.getId()));
				bibliografia.setTipoBibliografia(tipo);
				bibliografiaService.save(bibliografia);
				}
			}
	}

	private boolean analiseComponente(ComponenteCurricular componente, BindingResult result,
			RedirectAttributes redirectAttributes, boolean errors) {

		if (componente.getCodigo().trim().isEmpty()) {
			result.rejectValue("codigo", "Repeat.componente.codigo", "Campo obrigatório.");
			errors = true;
		}

		if (componente.getCodigo().length() < 5 || componente.getCodigo().length() > 12) {
			result.rejectValue("codigo", "Repeat.componente.codigo",
					"O código do Componente Curricular deve ter entre 5 e 12 caracteres");
			errors = true;
		}

		if (componente.getChPratica() == null) {
			result.rejectValue("chPratica", "Repeat.componente.chPratica", "Campo obrigatório.");
			errors = true;
		}

		if (componente.getChTeorica() == null) {
			result.rejectValue("chTeorica", "Repeat.componente.chTeorica", "Campo obrigatório.");
			errors = true;
		}

		Pattern estruturaCodigo = Pattern.compile("[^A-Za-z0-9 ]");
		Matcher matcher = estruturaCodigo.matcher(componente.getCodigo());
		if (matcher.find()) {
			result.rejectValue("codigo", "Repeat.componente.codigo",
					"O campo código do Componente Curricular não pode possuir caracteres especiais.");
			errors = true;
		}

		if (componente.getNome().trim().isEmpty()) {
			result.rejectValue("nome", "Repeat.componente.nome", "Campo obrigatório.");
			errors = true;
		}

		return errors;
	}
	
	@RequestMapping(value = "/{id}/historicoMudancas", method = RequestMethod.GET)
	public String historicoMudancas(@PathVariable("id") Integer id, ModelMap modelMap){
		ComponenteCurricular componente = this.componenteCurricularService.find(ComponenteCurricular.class, id);

		if(componente != null){
			List<Bibliografia> bibliografias = componente.getBibliografias();
			
			List<List<RevisionAuditoria>> revisionsAuditoriaBibliografias = this.componenteCurricularService.getAuditoriasBibliografias(bibliografias,componente);
			
			if(!revisionsAuditoriaBibliografias.isEmpty())
				modelMap.addAttribute("revisionsAuditoriaBibliografias", revisionsAuditoriaBibliografias);
			else
				modelMap.addAttribute("error", "Não há histórico de mundanças nesse componente curricular");
		}else{
			modelMap.addAttribute("error", "Não há histórico de mundanças nesse componente curricular");
		}

		return "componente/historicoMudancas";
	}

}