package br.ufc.npi.gal.validation;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.ufc.npi.gal.model.Cotacao;
import br.ufc.npi.gal.model.Fornecedor;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.npi.gal.service.FornecedorService;
import br.ufc.npi.gal.service.TituloService;

@Named
public class CotacaoValidator implements Validator {

	@Inject
	private FornecedorService fornecedorService;
	
	@Inject
	private TituloService tituloService;
	
	@Override
	public boolean supports(Class<?> classe) {
		return Cotacao.class.isAssignableFrom(classe);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Cotacao cotacao = (Cotacao) target;
		validateNotNull(errors, cotacao.getFornecedor().getId(), "fornecedor.id", "Campo Obrigatório");
		validateNotNull(errors, cotacao.getTitulo().getId(), "titulo.id", "Campo Obrigatório");
		validateNotNull(errors, cotacao.getValor(), "valor", "Campo Obrigatório");
		if(!errors.hasErrors()){
			cotacao.setFornecedor(fornecedorService.find(Fornecedor.class, cotacao.getFornecedor().getId()));
			cotacao.setTitulo(tituloService.find(Titulo.class, cotacao.getTitulo().getId()));
			validateNotNull(errors, cotacao.getFornecedor(), "fornecedor.id", "Fornecedor não cadastrado");
			validateNotNull(errors, cotacao.getTitulo(), "titulo.id", "Título não cadastrado");
		}
	}

	private void validateNotNull(Errors erros, Object object, String field, String message){
		if (object == null) {
			erros.rejectValue(field, field,message);
		}
	}
}
