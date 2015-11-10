package br.ufc.npi.gal.service;

import static org.junit.Assert.assertEquals;

import java.io.IOException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.Assert.*;
import javax.inject.Inject;

import br.ufc.npi.gal.repository.jpa.JpaCursoRepository;
import br.ufc.npi.gal.repository.jpa.JpaEstruturaCurricularRepositoryImpl;
import br.ufc.npi.gal.service.impl.ParserEstruturaCurricularServiceImpl;
import junit.framework.Assert;

public class ParserEstruturaCurricularTest {
	
	@Inject
	private JpaCursoRepository jpa;
	
	@Test
	public void validacaoDocumento() {
	//	Assert.assertEquals(402, jpa.getCursoByCodigo(402).getCodigo(), 0.0001);
	}
}
