package br.ufc.npi.gal.repository.jpa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;

import br.ufc.npi.gal.model.Compra;
import br.ufc.npi.gal.repository.CompraRepository;
import br.ufc.quixada.npi.enumeration.QueryType;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class CompraRepositoryImpl extends JpaGenericRepositoryImpl<Compra> implements CompraRepository{

	@Override
	public Compra getCompraById(Integer id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		List<Compra> result = find(QueryType.JPQL, "from Compra where id = :id", params);
		if(result != null && !result.isEmpty()){
			return result.get(0);
		}
		return null;
	}

	@Override
	public List<Compra> findOrderByCriadaEm() {
		List<Compra> result = find(QueryType.JPQL, "from Compra order by criadaEm asc", null);
		if(result != null && !result.isEmpty()){
			return result;
		}
		return null;
	}

}
