package br.ufc.npi.gal.web;

import java.util.Date;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.npi.gal.model.Compra;
import br.ufc.npi.gal.model.Cotacao;
import br.ufc.npi.gal.model.Fornecedor;
import br.ufc.npi.gal.model.Item;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.npi.gal.service.CalculoMetaService;
import br.ufc.npi.gal.service.CompraService;
import br.ufc.npi.gal.service.CotacaoService;
import br.ufc.npi.gal.service.FornecedorService;
import br.ufc.npi.gal.service.ItemService;
import br.ufc.npi.gal.service.TituloService;
import br.ufc.npi.gal.validation.CotacaoValidator;

@Controller
public class ComprarController {

	@Inject
	private FornecedorService fornecedorService;
	@Inject
	private TituloService tituloService;
	@Inject
	private CotacaoService cotacaoService;
	@Inject
	private CompraService compraService;
	@Inject
	private ItemService itemService;
	@Inject
	private CalculoMetaService calculoMetaService;
	
	@Inject
	private CotacaoValidator cotacaoValidator;
	
	private static final String PATH_FORNECEDOR_ADICIONAR = "fornecedor/adicionar";
	private static final String PATH_FORNECEDOR_LISTAR = "fornecedor/listar";
	private static final String PATH_FORNECEDOR_EDITAR = "fornecedor/editar";
	private static final String PATH_REDIRECT_FORNECEDOR_LISTAR = "redirect:/fornecedor/listar";
	
	private static final String PATH_COTACAO_ADICIONAR = "cotacao/adicionar";
	private static final String PATH_REDIRECT_COTACAO_LISTAR = "redirect:/cotacao/listar";
	private static final String PATH_COTACAO_LISTAR = "cotacao/listar";
	private static final String PATH_COTACAO_EDITAR = "cotacao/editar";
	
	private static final String PATH_COMPRA_LISTAR = "compra/listar";
	private static final String PATH_REDIRECT_COMPRA_LISTAR = "redirect:/compra/listar";
	private static final String PATH_COMPRA_PAINEL = "compra/painel";

	

	
	//FORNECEDOR
	@RequestMapping(value = "/fornecedor/adicionar", method = RequestMethod.GET)
	public String adicionarFornecedor(Model model) {
		model.addAttribute("fornecedor", new Fornecedor());
		return PATH_FORNECEDOR_ADICIONAR;
	}
	
	@RequestMapping(value = "/fornecedor/adicionar", method = RequestMethod.POST)
	public String adicionarFornecedor(@Valid Fornecedor fornecedor,  BindingResult result, final RedirectAttributes redirectAttributes) {
		
		if(result.hasErrors()){
			return PATH_FORNECEDOR_ADICIONAR;
		}
		
		if(fornecedorService.getFornecedorByCnpj(fornecedor.getCnpj())!=null){
			result.rejectValue("cnpj", "Repeat.fornecedor.cnpj", "Já existe um fornecedor com esse cnpj");
			return PATH_FORNECEDOR_ADICIONAR;
		}
		
		fornecedorService.save(fornecedor);
		redirectAttributes.addFlashAttribute("info", "Fornecedor adicionado com sucesso.");
		return PATH_REDIRECT_FORNECEDOR_LISTAR;
	}
	
	@RequestMapping(value = "/fornecedor/listar", method = RequestMethod.GET)
	public String listarFornecedores(ModelMap modelMap) {
		modelMap.addAttribute("fornecedores", this.fornecedorService.find(Fornecedor.class));
		return PATH_FORNECEDOR_LISTAR;

	}
	
	@RequestMapping(value = "/fornecedor/{id}/excluir", method = RequestMethod.GET)
	public String excluirFornecedor(@PathVariable("id") Integer id,
			RedirectAttributes redirectAttributes) {
		Fornecedor fornecedor  = fornecedorService.find(Fornecedor.class, id);
		if(fornecedor!=null){
			
			if(!fornecedor.getCotacoes().isEmpty()){
				redirectAttributes.addFlashAttribute("info", "O fornecedor não pode ser excluído pois há cotações cadastras para ele.");
				return PATH_REDIRECT_FORNECEDOR_LISTAR;
			}
			
			fornecedorService.delete(fornecedor);
			redirectAttributes.addFlashAttribute("info", "Fornecedor excluído com sucesso.");
		} else {
			redirectAttributes.addFlashAttribute("error", "Fornecedor não existente.");
		}
		return PATH_REDIRECT_FORNECEDOR_LISTAR;
	}
	
	@RequestMapping(value = "fornecedor/{id}/editar", method = RequestMethod.GET)
	public String editarFornecedor(@PathVariable("id") Integer id, ModelMap modelMap){
		Fornecedor fornecedor = this.fornecedorService.find(Fornecedor.class,id);
		
		modelMap.addAttribute("fornecedor", fornecedor);
		return PATH_FORNECEDOR_EDITAR;
	}
	
	@RequestMapping(value = "fornecedor/editar", method = RequestMethod.POST)
	public String atualizarFornecedor(@Valid Fornecedor fornecedor, BindingResult results, RedirectAttributes redirectAttributes){
		fornecedorService.update(fornecedor);
		
		if(results.hasErrors()){
			return PATH_FORNECEDOR_EDITAR;
		}
			
		redirectAttributes.addFlashAttribute("info", "Fornecedor atualizado com sucesso.");
		return PATH_REDIRECT_FORNECEDOR_LISTAR;
	}

	//COTAÇÃO
	@RequestMapping(value = "/cotacao/adicionar", method = RequestMethod.GET)
	public String adicionarCotacao(Model model) {
		model.addAttribute("cotacao", new Cotacao());
		model.addAttribute("fornecedores", fornecedorService.find(Fornecedor.class));
		model.addAttribute("titulos", tituloService.find(Titulo.class));
		return PATH_COTACAO_ADICIONAR;
	}
	
	@RequestMapping(value = "/cotacao/adicionar", method = RequestMethod.POST)
	public String adicionarCotacao(ModelMap model, @Valid Cotacao cotacao, BindingResult result, final RedirectAttributes redirectAttributes) {
		
		cotacaoValidator.validate(cotacao, result);
		if(result.hasErrors()){
			model.addAttribute("cotacao", cotacao);
			model.addAttribute("fornecedores", fornecedorService.find(Fornecedor.class));
			model.addAttribute("titulos", tituloService.find(Titulo.class));
			return PATH_COTACAO_ADICIONAR;
		}
		
		cotacaoService.save(cotacao);
		redirectAttributes.addFlashAttribute("info", "Cotação adicionada com sucesso.");
		return PATH_REDIRECT_COTACAO_LISTAR;
	}
	
	@RequestMapping(value = "/cotacao/listar", method = RequestMethod.GET)
	public String listarCotacoes(ModelMap modelMap) {
		modelMap.addAttribute("cotacoes", this.cotacaoService.find(Cotacao.class));
		return PATH_COTACAO_LISTAR;
	}

	@RequestMapping(value = "/cotacao/{id}/excluir", method = RequestMethod.GET)
	public String excluirCotacao(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		Cotacao cotacao = cotacaoService.getCotacaoById(id);
		if(cotacao!=null){
			cotacaoService.delete(cotacao);
			redirectAttributes.addFlashAttribute("info", "Cotação excluída com sucesso.");
		} else {
			redirectAttributes.addFlashAttribute("error", "Cotação não existente.");
		}
		return PATH_REDIRECT_COTACAO_LISTAR;
	}
	
	@RequestMapping(value = "cotacao/{id}/editar", method = RequestMethod.GET)
	public String editarCotacao(@PathVariable("id") Integer id, ModelMap modelMap) {
		Cotacao cotacao = this.cotacaoService.find(Cotacao.class, id);
		
		if (cotacao == null) {
			return PATH_REDIRECT_COTACAO_LISTAR;
		}

		modelMap.addAttribute("cotacao", cotacao);
		modelMap.addAttribute("fornecedores", this.fornecedorService.find(Fornecedor.class));
		modelMap.addAttribute("titulos", this.tituloService.find(Titulo.class));
		
		return PATH_COTACAO_EDITAR;
	}
	
	@RequestMapping(value = "cotacao/editar", method = RequestMethod.POST)
	public String atualizarCotacao(@Valid Cotacao cotacao, BindingResult results, RedirectAttributes redirectAttributes) {
		cotacao.setAdicionadoEm(new Date());
		cotacaoService.update(cotacao);
					
		redirectAttributes.addFlashAttribute("info", "Cotação atualizada com sucesso.");
		return PATH_REDIRECT_COTACAO_LISTAR;
	}
	
	//COMPRA
	@RequestMapping(value = "/compra/listar", method = RequestMethod.GET)
	public String listarCompras(ModelMap modelMap) {
		modelMap.addAttribute("resultados", calculoMetaService.gerarCalculo());
		modelMap.addAttribute("compras", this.compraService.findOrderByCriadaEm());
		return PATH_COMPRA_LISTAR;
	}
	
	@RequestMapping(value = "/compra/adicionar", method = RequestMethod.GET)
	public String adicionarCompra(final RedirectAttributes redirectAttributes) {
		Compra compra = new Compra();
		compra.setAtualizadaEm(new Date());
		compra.setCriadaEm(new Date());
		compraService.save(compra);
		redirectAttributes.addFlashAttribute("info", "Carrinho de compras adicionado com sucesso.");
		return "redirect:/compra/"+compra.getId()+"/painel";
	}
	
	@RequestMapping(value = "/compra/{id}/painel", method = RequestMethod.GET)
	public String mostrarPainelCompras(@PathVariable("id") Integer id, ModelMap model, RedirectAttributes redirectAttributes) {
		
		Compra compra = compraService.getCompraById(id);
		if(compra == null) {
			redirectAttributes.addFlashAttribute("error", "Carrinho de compras não existente.");
			return PATH_REDIRECT_COMPRA_LISTAR;
		}
		model.addAttribute("item", new Item());
		model.addAttribute("resultados", calculoMetaService.gerarCalculoWithItensByCompra(id));
		model.addAttribute("compra", compra);
		return PATH_COMPRA_PAINEL;
	}
	
	@RequestMapping(value = "/compra/{idCompra}/item/adicionar", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<String> adicionarItem(@PathVariable("idCompra") Integer idCompra, @RequestParam("quantidade") Integer quantidade, @RequestParam("tituloId") Integer tituloId, final RedirectAttributes redirectAttributes) {
		
		Compra compra = compraService.getCompraById(idCompra);
		if(compra == null){
			return new ResponseEntity<String>("Compra não existente.", HttpStatus.BAD_REQUEST);
		}
		
		Titulo titulo = tituloService.find(Titulo.class, tituloId);
		if(titulo == null){
			return new ResponseEntity<String>("Título não existente.", HttpStatus.BAD_REQUEST);
		}
		
		if(itemService.getItemByCompraAndTitulo(idCompra, tituloId)!=null){
			return new ResponseEntity<String>("Item já cadastrado.", HttpStatus.BAD_REQUEST);
		}
		
		Item item = new Item();
		item.setCompra(compra);
		item.setTitulo(titulo);
		item.setQuantidade(quantidade);
		itemService.save(item);
		
		return new ResponseEntity<String>("Item adicionado com sucesso", HttpStatus.OK);
	}
}
