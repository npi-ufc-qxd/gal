package br.ufc.npi.gal.web;

import javax.inject.Inject;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.npi.gal.model.Fornecedor;
import br.ufc.npi.gal.service.FornecedorService;

@Controller
public class ComprarController {

	@Inject
	private FornecedorService fornecedorService;
	
	private static final String PATH_FORNECEDOR_ADICIONAR = "fornecedor/adicionar";
	
	/* MUDAR QUANDO FOR FEITA A PAGINA DE LISTAR OS FORNECEDORES */
	private static final String PATH_REDIRECT_FORNECEDOR_LISTAR = "redirect:/";
	
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
}
