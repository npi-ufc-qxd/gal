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

import br.ufc.npi.gal.auditoria.RevisionAuditoriaTitulo;
import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.npi.gal.model.TipoTitulo;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.npi.gal.service.TituloService;

@Controller
@RequestMapping("titulo")
public class TituloController {

	@Inject
	private TituloService tituloService;
	
	@RequestMapping(value = "/listar", method = RequestMethod.GET)
	public String listar(ModelMap modelMap) {
		modelMap.addAttribute("titulos", this.tituloService.find(Titulo.class));
		return "titulo/listar";

	}

	@RequestMapping(value = "/adicionar", method = RequestMethod.GET)
	public String adicionar(ModelMap modelMap) {
		modelMap.addAttribute("titulo", new Titulo());
		return "titulo/adicionar";
	}

	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public String adicionar(@Valid Titulo titulo, BindingResult result,
			RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			return "titulo/adicionar";
		}

		if (tituloService.getTituloByIsbn(titulo.getIsbn()) != null) {
			result.rejectValue("isbn", "Repeat.titulo.isbn",
					"Já existe um título com esse isbn");
			return "titulo/adicionar";
		}
		if (titulo.getNome().trim().isEmpty()) {
			result.rejectValue("nome", "Repeat.titulo.nome",
					"Campo obrigatório.");
			return "titulo/adicionar";
		}
		if (tituloService.getTituloByNome(titulo.getNome()) != null) {
			result.rejectValue("nome", "Repeat.titulo.nome",
					"Já existe um título com esse nome");
			return "titulo/adicionar";
		}
		if (titulo.getTipo().equals(TipoTitulo.FISICO.getDescricao())){
			titulo.setCadastradoBiblioteca(true);
		}

		tituloService.save(titulo);
		redirectAttributes.addFlashAttribute("info",
				"Título adicionado com sucesso.");
		return "redirect:/titulo/listar";

	}

	@RequestMapping(value = "/{id}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable("id") Integer id, ModelMap modelMap) {
		Titulo titulo = this.tituloService.find(Titulo.class, id);
		
		if (titulo == null) {
			return "redirect:/titulo/listar";
		}

		modelMap.addAttribute("titulo", titulo);
		return "titulo/editar";
	}

	@RequestMapping(value = "/editar", method = RequestMethod.POST)
	public String atualizar(@Valid Titulo titulo, BindingResult result,
			RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			return "titulo/editar";
		}

		if (tituloService
				.getOutroTituloByIsbn(titulo.getId(), titulo.getIsbn()) != null) {
			result.rejectValue("isbn", "Repeat.titulo.isbn",
					"Já existe um título com esse isbn");
			return "titulo/editar";
		}
		if (tituloService
				.getOutroTituloByNome(titulo.getId(), titulo.getNome()) != null) {
			result.rejectValue("nome", "Repeat.titulo.nome",
					"Já existe um título com esse nome");
			return "titulo/editar";
		}
		if (titulo.getTipo().equals(TipoTitulo.FISICO.getDescricao())){
			titulo.setCadastradoBiblioteca(true);
		}

		tituloService.update(titulo);
		redirectAttributes.addFlashAttribute("info",
				"Título atualizado com sucesso.");
		return "redirect:/titulo/listar";

	}

	@RequestMapping(value = "/{id}/excluir", method = RequestMethod.GET)
	public String excluir(@PathVariable("id") Integer id,
			RedirectAttributes redirectAttributes) {
		Titulo titulo = tituloService.find(Titulo.class, id);
		if (titulo != null) {
			if (titulo.getBibliografias().size() == 0) {
				this.tituloService.delete(titulo);
				redirectAttributes.addFlashAttribute("info",
						"Título removido com sucesso.");
			} else {
				StringBuilder nomeDisciplinas = new StringBuilder();
				for (Bibliografia bibliografia : titulo.getBibliografias()) {
					if(nomeDisciplinas.length() == 0) {
						nomeDisciplinas.append(bibliografia.getComponenteCurricular().getNome());
					} else {
						nomeDisciplinas.append(", " + bibliografia.getComponenteCurricular().getNome());
						}
					}
				nomeDisciplinas.append('.');
				redirectAttributes.addFlashAttribute("error", titulo.getNome() +
						" não pode ser excluído, pois está vinculado a bibliografia das seguintes disciplinas: " + nomeDisciplinas);
			}
		}
		return "redirect:/titulo/listar";
	}
	
	@RequestMapping(value = "/{id}/historicoTitulo", method = RequestMethod.GET)
	public String historicoTitulo(@PathVariable("id") Integer id, ModelMap modelMap) {
			List<Titulo> titulosAuditoria = this.tituloService.getTitulosAuditoriaById(id);
			List<RevisionAuditoriaTitulo> revisionsuditoria = this.tituloService.getRevisionsAuditoriaTituloById(id);
			List<RevisionAuditoriaTitulo> mudancas = this.tituloService.getAlteracoes(titulosAuditoria,revisionsuditoria);
			
			modelMap.addAttribute("tituloMudancas", mudancas);
			return "titulo/historicoTitulo";

	}
	
}
