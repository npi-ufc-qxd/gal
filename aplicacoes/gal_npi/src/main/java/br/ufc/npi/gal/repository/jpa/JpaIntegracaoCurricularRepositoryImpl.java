package br.ufc.npi.gal.repository.jpa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;

import br.ufc.npi.gal.model.IntegracaoCurricular;
import br.ufc.npi.gal.repository.IntegracaoCurricularRepository;
import br.ufc.quixada.npi.enumeration.QueryType;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class JpaIntegracaoCurricularRepositoryImpl extends JpaGenericRepositoryImpl<IntegracaoCurricular> implements IntegracaoCurricularRepository{

	@Override
	public IntegracaoCurricular getIntegracao(Integer idComponente, Integer idCurriculo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id_componente", idComponente);
		params.put("id_curriculo", idCurriculo);
		List<IntegracaoCurricular> result = find(QueryType.JPQL, "from IntegracaoCurricular where id_componente = :id_componente and id_curriculo = :id_curriculo", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
}