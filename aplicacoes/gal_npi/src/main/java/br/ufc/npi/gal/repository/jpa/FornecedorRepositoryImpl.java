package br.ufc.npi.gal.repository.jpa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;

import br.ufc.npi.gal.model.Fornecedor;
import br.ufc.npi.gal.repository.FornecedorRepository;
import br.ufc.quixada.npi.enumeration.QueryType;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class FornecedorRepositoryImpl extends JpaGenericRepositoryImpl<Fornecedor> implements FornecedorRepository{

	@Override
	public Fornecedor getFornecedorById(Integer id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		List<Fornecedor> result = find(QueryType.JPQL, "from Fornecedor where id = :id", params);
		if(result != null && !result.isEmpty()){
			return result.get(0);
		}
		return null;
	}

	@Override
	public Fornecedor getFornecedorByCnpj(String cnpj) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cnpj", cnpj);
		List<Fornecedor> result = find(QueryType.JPQL, "from Fornecedor where cnpj = :cnpj", params);
		if(result != null && !result.isEmpty()){
			return result.get(0);
		}
		return null;
	}

}
