package br.ufc.npi.gal.service;

import java.io.IOException;

public interface ParserEstruturaCurricularService {
	
	public abstract void processarArquivo(String urlEstruturaCurrcicular) throws IOException;
	
}
