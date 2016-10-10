package br.ufc.npi.gal.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import br.ufc.npi.gal.model.Fornecedor;
import br.ufc.npi.gal.repository.FornecedorRepository;
import br.ufc.npi.gal.service.FornecedorService;
import br.ufc.quixada.npi.service.impl.GenericServiceImpl;

@Named
public class FornecedorServiceImpl extends GenericServiceImpl<Fornecedor> implements FornecedorService {

	@Inject
	private FornecedorRepository fornecedorRepository;
	
	@Override
	public Fornecedor getFornecedorById(Integer id) {
		return fornecedorRepository.getFornecedorById(id);
	}

	@Override
	public Fornecedor getFornecedorByCnpj(String cnpj) {
		return fornecedorRepository.getFornecedorByCnpj(cnpj);
	}

	
}
