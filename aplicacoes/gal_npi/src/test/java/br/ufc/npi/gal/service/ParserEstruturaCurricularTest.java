package br.ufc.npi.gal.service;

import static org.junit.Assert.assertEquals;

import java.io.IOException;

import org.junit.Test;
import static org.junit.Assert.*;

import br.ufc.npi.gal.repository.jpa.JpaCursoRepository;
import br.ufc.npi.gal.repository.jpa.JpaEstruturaCurricularRepositoryImpl;
import br.ufc.npi.gal.service.impl.ParserEstruturaCurricularServiceImpl;
import junit.framework.Assert;

public class ParserEstruturaCurricularTest {

	@Test
	public void validacaoDocumento() {
		JpaCursoRepository jpa = new JpaCursoRepository();
		Assert.assertEquals("ENGENHARIA DE SOFTWARE", jpa.getCursoByNome("ENGENHARIA DE SOFTWARE").getNome());
	}
}
