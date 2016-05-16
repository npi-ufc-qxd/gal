package br.ufc.npi.gal.repository.jpa;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;

import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.npi.gal.model.ComponenteCurricular;
import br.ufc.npi.gal.repository.ComponenteCurricularRepository;
import br.ufc.quixada.npi.enumeration.QueryType;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class JpaComponenteCurricularRepository extends JpaGenericRepositoryImpl<ComponenteCurricular> implements ComponenteCurricularRepository {
	
	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public ComponenteCurricular getComponenteCurricularByNome(String nome) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nome", nome);
		List<ComponenteCurricular> result = find(QueryType.JPQL, "from ComponenteCurricular where nome = :nome", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public ComponenteCurricular getComponenteCurricularByCodigo(String codigo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("codigo", codigo);
		List<ComponenteCurricular> result = find(QueryType.JPQL, "from ComponenteCurricular where codigo = :codigo", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public ComponenteCurricular getOutraComponenteCurricularByNome(Integer id, String nome) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nome", nome);
		params.put("id", id);
		List<ComponenteCurricular> result = find(QueryType.JPQL, "from ComponenteCurricular where id != :id and nome = :nome", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public ComponenteCurricular getOutraComponenteCurricularByCodigo(Integer id, String codigo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("codigo", codigo);
		params.put("id", id);
		List<ComponenteCurricular> result = find(QueryType.JPQL, "from ComponenteCurricular where id != :id and codigo = :codigo", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	public List<ComponenteCurricular> getTodosComponenteCurricular(){
		List<ComponenteCurricular> result = find(QueryType.JPQL, "from ComponenteCurricular order by nome asc", null);
		if(result != null && !result.isEmpty()) {
			return result;
		}
		return null;
	}
		
	@Override
	public List<Bibliografia> getBibliografiasAuditoria(Bibliografia biblografia){
		AuditReader reader = AuditReaderFactory.get(manager);
		
		List<Bibliografia> alteracosBibliografia = new ArrayList<Bibliografia>();
		
		AuditQuery query = reader.createQuery().forRevisionsOfEntity(Bibliografia.class, false, true);
		query.add(AuditEntity.id().eq(biblografia));
		
		List<Object[]> objeto = query.getResultList();
		
		for(int i = 0; i < objeto.size(); i++){
			Object o[] = objeto.get(i);
			alteracosBibliografia.add((Bibliografia)o[0]);	
		}
		
		return alteracosBibliografia;
	}
	
}
