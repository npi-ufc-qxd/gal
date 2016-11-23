package br.ufc.npi.gal.validation;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import br.ufc.npi.gal.model.Cotacao;
import br.ufc.npi.gal.model.Item;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.npi.gal.service.TituloService;

@Named
public class ItemValidator implements Validator {

	
	@Inject
	private TituloService tituloService;
	
	@Override
	public boolean supports(Class<?> classe) {
		return Cotacao.class.isAssignableFrom(classe);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Item item = (Item) target;
		validateNotNull(errors, item.getTitulo().getId(), "titulo.id", "Campo Obrigatório");
		validateNotNull(errors, item.getQuantidade(), "quantidade", "Campo Obrigatório");
		if(!errors.hasErrors()){
			item.setTitulo(tituloService.find(Titulo.class, item.getTitulo().getId()));
			validateNotNull(errors, item.getTitulo(), "titulo.id", "Título não cadastrado");
		}
	}
	
	private void validateNotNull(Errors erros, Object object, String field, String message){
		if (object == null) {
			erros.rejectValue(field, field,message);
		}
	}
}
