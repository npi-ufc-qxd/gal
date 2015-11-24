package br.ufc.npi.gal.web;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.npi.gal.model.AcervoDocumento;
import br.ufc.npi.gal.model.ExemplarConflitante;
import br.ufc.npi.gal.service.AcervoDocumentoService;
import br.ufc.npi.gal.service.AcervoService;
import br.ufc.npi.gal.service.UsuarioServiceGal;

@Controller
@RequestMapping("acervo")
public class AcervoController {

	@Inject
	private AcervoService acervoService;

	@Inject
	private UsuarioServiceGal usuarioService;

	@Inject
	private AcervoDocumentoService acervoDocumentoService;

	@RequestMapping(value = "/atualizar_acervo", method = RequestMethod.GET)
	public String atualizarAcervo(ModelMap modelMap, HttpSession session) {
		List<AcervoDocumento> atualizacoesRealizadas = acervoDocumentoService.find(AcervoDocumento.class);
		modelMap.addAttribute("atualizacoesRealizadas", atualizacoesRealizadas);
		modelMap.addAttribute("atualizacaoAcervo", new AcervoDocumento());
		return "acervo/atualizar";
	}

	@RequestMapping(value = "/resolver_conflitos", method = RequestMethod.GET)
	public String resolverConflitos(ModelMap modelMap) {

		modelMap.addAttribute("exemplares", acervoService.find(ExemplarConflitante.class));
		return "acervo/conflitos";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadDoArquivoXls(ModelMap modelMap,
			@ModelAttribute("atualizacaoAcervo") AcervoDocumento atualizacaoAcervo,
			@RequestParam("file") MultipartFile request, BindingResult result, RedirectAttributes redirectAttributes) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Boolean erros = false;
		if (atualizacaoAcervo.getInicioPeridoDelta() == null) {
			result.rejectValue("inicioPeridoDelta", "Repeat.AcervoDocumento.inicioPeridoDelta",
					"Inicio do delta não foi determinado");
			erros = true;
		}
		if (atualizacaoAcervo.getFinalPeridoDelta() == null) {
			result.rejectValue("finalPeridoDelta", "Repeat.AcervoDocumento.finalPeridoDelta",
					"Final do delta não foi determinado");
			erros = true;
		}
		if (request.isEmpty()) {
			result.rejectValue("arquivo", "Repeat.AcervoDocumento.arquivo", "Arquivo enviado inexistente");
			erros = true;
		} else if (!TestFormato(request)) {
			result.rejectValue("arquivo", "Repeat.AcervoDocumento.arquivo",
					"formato do arquivo incorreto, por favor selecionar um arquivo xls");
			erros = true;
		}
		if (erros) {/*
					 * List<AcervoDocumento> atualizacoesRealizadas =
					 * acervoDocumentoService
					 * .atualizacoesPorUsuario(usuarioService.getUsuarioByLogin(
					 * auth .getName()));
					 * modelMap.addAttribute("atualizacoesRealizadas",
					 * atualizacoesRealizadas);
					 * modelMap.addAttribute("atualizacaoAcervo", new
					 * AcervoDocumento()); return
					 * "redirect:/acervo/atualizar_acervo";
					 */
			return "acervo/atualizar";
		}
		try {
			atualizacaoAcervo.setArquivo(request.getBytes());
			acervoService.processarArquivo(request);
		} catch (IOException e) {
			System.err.println("Erro ao processar arquivo: " + e.getStackTrace());
			// avisar ao usuario do erro
		}
		atualizacaoAcervo.setUsuario(usuarioService.getUsuarioByLogin(auth.getName()));
		atualizacaoAcervo.setExtensao(request.getContentType());
		acervoService.registrarAtualizacao(atualizacaoAcervo);

		redirectAttributes.addFlashAttribute("info", "Atualização realizada com sucesso.");

		return "redirect:/acervo/resolver_conflitos";

	}

	@RequestMapping(value = "/{id}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable("id") Integer id, ModelMap modelMap) {

		ExemplarConflitante exemplar = this.acervoService.find(ExemplarConflitante.class, id);

		if (exemplar == null) {
			return "/acervo/conflitos";
		}
		modelMap.addAttribute("exemplar", exemplar);
		return "acervo/editar";
	}

	@RequestMapping(value = "/editar", method = RequestMethod.POST)
	public String atualizar(ModelMap modelMap, @Valid ExemplarConflitante exemplar, BindingResult result,
			RedirectAttributes redirectAttributes) {
		if (acervoService.submeterExemplarConflitante(exemplar)) {
			redirectAttributes.addFlashAttribute("info", "Conflito resolvido com sucesso.");
			return "redirect:/acervo/resolver_conflitos";
		} else {
			modelMap.addAttribute("exemplar", exemplar);
			return "/acervo/editar";
		}

	}

	private boolean TestFormato(MultipartFile request) {
		String nome = request.getOriginalFilename();
		String extencao = (String) nome.subSequence(nome.length() - 4, nome.length());
		if (extencao.equals(".xls")) {
			return true;
		}
		return false;
	}

	@RequestMapping(value = "/download/{idArquivo}", method = RequestMethod.GET)
	public void getArquivo(@PathVariable("idArquivo") int idArquivo, HttpServletResponse response,
			HttpSession session) {
		try {
			AcervoDocumento documento = this.acervoDocumentoService.find(AcervoDocumento.class, idArquivo);

			if (documento != null) {
				InputStream is = new ByteArrayInputStream(documento.getArquivo());
				response.setContentType(documento.getExtensao());
				response.setHeader("Content-Disposition", "attachment; filename=Delta - "
						+ documento.getInicioPeridoDelta() + " à " + documento.getFinalPeridoDelta());
				IOUtils.copy(is, response.getOutputStream());
				response.flushBuffer();
			}
		} catch (IOException ex) {
		}
	}
}
