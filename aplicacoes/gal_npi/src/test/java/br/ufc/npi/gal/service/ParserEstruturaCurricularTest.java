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
		assertEquals(true, myParser.validacaoDocumento("https://si3.ufc.br/sigaa/graduacao/curriculo/lista.jsf"));
	}
	
	public static void main(String[] args) throws IOException {
		ParserEstruturaCurricularServiceImpl myParser = new ParserEstruturaCurricularServiceImpl();
		myParser.processarArquivo("https://si3.ufc.br/sigaa/graduacao/curriculo/lista.jsf");
	}
}
