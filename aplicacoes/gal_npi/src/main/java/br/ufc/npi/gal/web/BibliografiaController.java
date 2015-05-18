package br.ufc.npi.gal.web;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.quixada.npi.service.GenericService;

@Controller
@RequestMapping("bibliografia")
public class BibliografiaController {
	
	@Inject
	private GenericService<Bibliografia> bibliografiaService;
	
	@RequestMapping(value = "/listar")
	public String listar(ModelMap modelMap) {
		modelMap.addAttribute("bibliografia", this.bibliografiaService.find(Bibliografia.class));
		return "bibliografia/listar";

	}
	
	@RequestMapping(value = "/vincularBibliografia")
	public String vincularBibliografia(ModelMap modelMap) {
		modelMap.addAttribute("bibliografia", this.bibliografiaService.find(Bibliografia.class));
		return "bibliografia/vincularBibliografia";
	}

}
