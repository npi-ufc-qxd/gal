package br.ufc.npi.gal.model;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;

import junit.framework.Assert;

import org.junit.Test;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

import br.ufc.npi.gal.model.ComponenteCurricular;

public class DisciplinaTeste {

	private Validator createValidator() {
		LocalValidatorFactoryBean localValidatorFactoryBean = new LocalValidatorFactoryBean();
		localValidatorFactoryBean.afterPropertiesSet();
		return localValidatorFactoryBean;
	}

	@Test
	public void testeNomeVazio() {
		ComponenteCurricular componenteCurricular = new ComponenteCurricular();
		componenteCurricular.setNome("");
		componenteCurricular.setCodigo("QXD002");
		
		Validator validator = createValidator();
		Set<ConstraintViolation<ComponenteCurricular>> constraintViolations = validator
				.validate(componenteCurricular);
		
		Assert.assertEquals(1, constraintViolations.size());
		ConstraintViolation<ComponenteCurricular> violacao = constraintViolations.iterator()
				.next();
		Assert.assertEquals(violacao.getMessage(), "Campo obrigatório");
		Assert.assertEquals(violacao.getPropertyPath().toString(), "nome");
	
	}
	
	@Test
	public void testeNomeNulo() {
		ComponenteCurricular componenteCurricular = new ComponenteCurricular();
		componenteCurricular.setNome(null);
		componenteCurricular.setCodigo("QXD002");
		
		Validator validator = createValidator();
		Set<ConstraintViolation<ComponenteCurricular>> constraintViolations = validator
				.validate(componenteCurricular);
		
		Assert.assertEquals(1, constraintViolations.size());
		ConstraintViolation<ComponenteCurricular> violacao = constraintViolations.iterator()
				.next();
		
		Assert.assertEquals(violacao.getPropertyPath().toString(), "nome");
	
	}
		
	@Test
	public void testeNomeComSeisEspacosNaoDeveriaPassar() {
		ComponenteCurricular componenteCurricular = new ComponenteCurricular();
		componenteCurricular.setNome("      ");
		componenteCurricular.setCodigo("QXD002");
		
		Validator validator = createValidator();
		Set<ConstraintViolation<ComponenteCurricular>> constraintViolations = validator
				.validate(componenteCurricular);
		
		Assert.assertEquals(1, constraintViolations.size());
		
	
	}
	
	@Test
	public void testeNomeComCincoCaracteres() {
		ComponenteCurricular componenteCurricular = new ComponenteCurricular();
		componenteCurricular.setNome("Geren");
		componenteCurricular.setCodigo("QXD002");
		
		Validator validator = createValidator();
		Set<ConstraintViolation<ComponenteCurricular>> constraintViolations = validator
				.validate(componenteCurricular);
		
		Assert.assertEquals(1, constraintViolations.size());
		ConstraintViolation<ComponenteCurricular> violacao = constraintViolations.iterator()
				.next();
		Assert.assertEquals(violacao.getMessage(), "O nome deve ter no mínimo 6 caracteres");
		Assert.assertEquals(violacao.getPropertyPath().toString(), "nome");
	
	}
	
	@Test
	public void testeNomeComCaractereEspecial() {
		ComponenteCurricular componenteCurricular = new ComponenteCurricular();
		componenteCurricular.setNome("Gerenci@ de Projetos");
		componenteCurricular.setCodigo("QXD002");
		
		Validator validator = createValidator();
		Set<ConstraintViolation<ComponenteCurricular>> constraintViolations = validator
				.validate(componenteCurricular);
		
		Assert.assertEquals(1, constraintViolations.size());
		ConstraintViolation<ComponenteCurricular> violation = constraintViolations.iterator()
				.next();
		Assert.assertEquals(violation.getMessage(), "O campo Nome não pode possuir caracteres especiais ou números.");

	}
	
	@Test
	public void testeNomeComNumero() {
		ComponenteCurricular componenteCurricular = new ComponenteCurricular();
		componenteCurricular.setNome("Gerenc7a de Projetos");
		componenteCurricular.setCodigo("QXD002");
		
		Validator validator = createValidator();
		Set<ConstraintViolation<ComponenteCurricular>> constraintViolations = validator
				.validate(componenteCurricular);
		
		Assert.assertEquals(1, constraintViolations.size());
		ConstraintViolation<ComponenteCurricular> violation = constraintViolations.iterator()
				.next();
		Assert.assertEquals(violation.getMessage(), "O campo Nome não pode possuir caracteres especiais ou números.");

	}
		

	@Test
	public void testeCodigoVazio(){
		ComponenteCurricular componenteCurricular = new ComponenteCurricular();
		componenteCurricular.setNome("Gerencia de Projetos");
		componenteCurricular.setCodigo("");
		
		Validator validator = createValidator();
		Set<ConstraintViolation<ComponenteCurricular>> constraintViolations = validator
				.validate(componenteCurricular);
		
		Assert.assertEquals(1, constraintViolations.size());
		ConstraintViolation<ComponenteCurricular> violation = constraintViolations.iterator()
				.next();
		Assert.assertEquals(violation.getMessage(), "Campo obrigatório");

	}
	

	@Test
	public void testeCodigoComSeisEspacos() {
		ComponenteCurricular componenteCurricular = new ComponenteCurricular();
		componenteCurricular.setNome("Gerencia");
		componenteCurricular.setCodigo("      ");
		
		Validator validator = createValidator();
		Set<ConstraintViolation<ComponenteCurricular>> constraintViolations = validator
				.validate(componenteCurricular);
		
		Assert.assertEquals(1, constraintViolations.size());
		
	}
	
	@Test
	public void testeCodigoNulo() {
		ComponenteCurricular componenteCurricular = new ComponenteCurricular();
		componenteCurricular.setNome("Gerencia");
		componenteCurricular.setCodigo(null);
		
		Validator validator = createValidator();
		Set<ConstraintViolation<ComponenteCurricular>> constraintViolations = validator
				.validate(componenteCurricular);
		
		Assert.assertEquals(1, constraintViolations.size());
		
	}
	
	@Test
	public void testeCodigoComCaratereEspecial(){
		ComponenteCurricular componenteCurricular = new ComponenteCurricular();
		componenteCurricular.setNome("Gerencia de Projetos");
		componenteCurricular.setCodigo("QXD%02");
		
		Validator validator = createValidator();
		Set<ConstraintViolation<ComponenteCurricular>> constraintViolations = validator
				.validate(componenteCurricular);
		
		Assert.assertEquals(1, constraintViolations.size());
		ConstraintViolation<ComponenteCurricular> violation = constraintViolations.iterator()
				.next();
		Assert.assertEquals(violation.getMessage(), "O campo código não pode possuir caracteres especiais.");

	}
	
	@Test
	public void testeCodigoCom_5_Caracteres(){
		ComponenteCurricular componenteCurricular = new ComponenteCurricular();
		componenteCurricular.setNome("Gerencia de Projetos");
		componenteCurricular.setCodigo("QXD02");
		
		Validator validator = createValidator();
		Set<ConstraintViolation<ComponenteCurricular>> constraintViolations = validator
				.validate(componenteCurricular);
		
		Assert.assertEquals(1, constraintViolations.size());
		ConstraintViolation<ComponenteCurricular> violation = constraintViolations.iterator()
				.next();
		Assert.assertEquals(violation.getMessage(), "O código deve ter entre 6 e 12 caracteres");

	}
	
	@Test
	public void testeCodigoCom_13_Caracteres(){
		ComponenteCurricular componenteCurricular = new ComponenteCurricular();
		componenteCurricular.setNome("Gerencia de Projetos");
		componenteCurricular.setCodigo("QXD1234567890");
		
		Validator validator = createValidator();
		Set<ConstraintViolation<ComponenteCurricular>> constraintViolations = validator
				.validate(componenteCurricular);
		
		Assert.assertEquals(1, constraintViolations.size());
		ConstraintViolation<ComponenteCurricular> violation = constraintViolations.iterator()
				.next();
		Assert.assertEquals(violation.getMessage(), "O código deve ter entre 6 e 12 caracteres");

	}
	
}
