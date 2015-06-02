package br.ufc.npi.gal.repository.jpa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;

import br.ufc.npi.gal.model.Exemplar;
import br.ufc.npi.gal.repository.ExemplarRepository;
import br.ufc.quixada.npi.enumeration.QueryType;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;


@Named
public class ExemplarRepositoryImpl extends JpaGenericRepositoryImpl<Exemplar> implements ExemplarRepository{

	@Override
	public Exemplar getExemplarByCodigo(String codigoExemplar) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("codigo", codigoExemplar);
		List<Exemplar> result = find(QueryType.JPQL, "from Exemplar where cod_e = :codigo", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}


}
