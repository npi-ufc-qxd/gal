package br.ufc.npi.gal.service;

import static org.junit.Assert.assertEquals;

import java.io.IOException;

import org.junit.Test;
import static org.junit.Assert.*;

import br.ufc.npi.gal.service.impl.ParserEstruturaCurricularServiceImpl;

public class ParserEstruturaCurricularTest {

	@Test
	public void validacaoDocumento() {
		ParserEstruturaCurricularServiceImpl myParser = new ParserEstruturaCurricularServiceImpl();
	}
	
	public static void main(String[] args) throws IOException {
		ParserEstruturaCurricularServiceImpl myParser = new ParserEstruturaCurricularServiceImpl();
		myParser.processarArquivo("/home/leuson.silva/git/gal/Docs_Suporte/estrutura-curricular-es.html");
	}
}
