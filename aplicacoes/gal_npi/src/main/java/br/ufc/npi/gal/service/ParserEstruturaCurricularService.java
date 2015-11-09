package br.ufc.npi.gal.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface ParserEstruturaCurricularService {
	
	public abstract void processarArquivoHTML(String urlEstruturaCurrcicular) throws IOException;

	public abstract void processarArquivo(MultipartFile multipartFile) throws IOException;
	
}
