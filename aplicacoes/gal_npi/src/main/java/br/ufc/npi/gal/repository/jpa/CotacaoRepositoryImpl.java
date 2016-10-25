package br.ufc.npi.gal.repository.jpa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;

import br.ufc.npi.gal.model.Cotacao;
import br.ufc.npi.gal.repository.CotacaoRepository;
import br.ufc.quixada.npi.enumeration.QueryType;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class CotacaoRepositoryImpl extends JpaGenericRepositoryImpl<Cotacao> implements CotacaoRepository{

	@Override
	public Cotacao getCotacaoById(Integer id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		List<Cotacao> result = find(QueryType.JPQL, "from Cotacao where id = :id", params);
		if(result != null && !result.isEmpty()){
			return result.get(0);
		}
		return null;
	}

}
