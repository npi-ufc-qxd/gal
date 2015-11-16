package br.ufc.npi.gal.repository.jpa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;

import br.ufc.npi.gal.model.Exemplar;
import br.ufc.npi.gal.model.ExemplarConflitante;
import br.ufc.npi.gal.repository.ExemplarConflitanteRepository;
import br.ufc.quixada.npi.enumeration.QueryType;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class ExemplarConflitanteRepositoryImpl extends JpaGenericRepositoryImpl<ExemplarConflitante> implements ExemplarConflitanteRepository{

	@Override
	public ExemplarConflitante getExemplarConflitanteByCodigo(
			String codigoExemplar) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("codigo", codigoExemplar);
		List<ExemplarConflitante> result = find(QueryType.JPQL, "from ExemplarConflitante where cod_ef = :codigo", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

}
