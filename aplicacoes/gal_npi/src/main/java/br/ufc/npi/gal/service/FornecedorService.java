package br.ufc.npi.gal.service;

import br.ufc.npi.gal.model.Fornecedor;
import br.ufc.quixada.npi.service.GenericService;

public interface FornecedorService extends GenericService<Fornecedor>{

	public abstract Fornecedor getFornecedorById(Integer id);
	
	public abstract Fornecedor getFornecedorByCnpj(String cnpj);
}
