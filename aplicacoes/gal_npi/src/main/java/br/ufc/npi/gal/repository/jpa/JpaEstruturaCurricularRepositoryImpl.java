package br.ufc.npi.gal.repository.jpa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;

import br.ufc.npi.gal.model.EstruturaCurricular;
import br.ufc.npi.gal.repository.EstruturaCurricularRepository;
import br.ufc.quixada.npi.enumeration.QueryType;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class JpaEstruturaCurricularRepositoryImpl extends JpaGenericRepositoryImpl<EstruturaCurricular> implements EstruturaCurricularRepository{

	@Override
	public EstruturaCurricular getOutraEstruturaCurricularByCodigo(Integer id, String codigo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("codigo", codigo);
		params.put("id_curso", id);
		List<EstruturaCurricular> result = find(QueryType.JPQL,"from EstruturaCurricular where id_curso = :id_curso and codigo = :codigo", params);
		if(result != null && !result.isEmpty()){
			return result.get(0);
		}
		return null;
	}
}
