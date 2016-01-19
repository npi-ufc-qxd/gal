
package br.ufc.npi.gal.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import br.ufc.npi.gal.model.Curso;
import br.ufc.npi.gal.model.EstruturaCurricular;

public interface ParserEstruturaCurricularService {

	public abstract List<String> processarArquivo(Integer id) throws IOException;
	public abstract EstruturaCurricular registrarNovaEstruturaCurricular(List<String> estrutura, Curso curso);
	public abstract boolean verificaConformidadeDocumeto(MultipartFile multipartFile, Integer id) throws IOException;
	
}