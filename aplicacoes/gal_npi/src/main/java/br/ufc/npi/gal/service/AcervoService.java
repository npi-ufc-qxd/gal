package br.ufc.npi.gal.service;

import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import br.ufc.npi.gal.exception.ArquivoNaoSuportadoException;
import br.ufc.npi.gal.model.AcervoDocumento;
import br.ufc.npi.gal.model.ExemplarConflitante;
import br.ufc.quixada.npi.service.GenericService;


public interface AcervoService extends GenericService<ExemplarConflitante> {
	
	public abstract void processarArquivo(MultipartFile multipartFile) throws ArquivoNaoSuportadoException;
	
	public boolean submeterExemplarConflitante(ExemplarConflitante exemplar);
	
	public void registrarAtualizacao(AcervoDocumento acervoDocumento);
	
}
