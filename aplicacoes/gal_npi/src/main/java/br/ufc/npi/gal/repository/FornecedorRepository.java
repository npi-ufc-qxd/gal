package br.ufc.npi.gal.repository;

import br.ufc.npi.gal.model.Fornecedor;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface FornecedorRepository extends GenericRepository<Fornecedor> {

	public abstract Fornecedor getFornecedorById(Integer id);
	
	public abstract Fornecedor getFornecedorByCnpj(String cnpj);
}
