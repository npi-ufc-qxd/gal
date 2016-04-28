package br.ufc.npi.gal.auditoria;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;

import br.ufc.npi.gal.model.Titulo;
import br.ufc.quixada.npi.enumeration.QueryType;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class TituloAuditoriaRepositorioImpl extends JpaGenericRepositoryImpl<TituloAuditoria> implements TituloAuditoriaRepositorio{

	@Override
	public List<TituloAuditoria> getTituloAuditoriaById(Integer id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		
		List<TituloAuditoria> result = find(QueryType.JPQL, "from TituloAuditoria where id = :id", params);
		
		if(result != null && !result.isEmpty())
			return result;
		
		return null;
	}

	@Override
	public List<TituloAuditoria> getTituloAuditoriaByrevType(Integer revtype, Integer id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("revtype", revtype);
		params.put("id", id);
		
		List<TituloAuditoria> result = find(QueryType.JPQL, "from TituloAuditoria where id = :id and revtype = :revtype", params);
		
		if(result != null && !result.isEmpty())
			return result;
		
		return null;
	}

}
