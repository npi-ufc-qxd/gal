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
import org.hibernate.envers.RevisionType;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;
import org.hibernate.envers.query.criteria.AuditCriterion;

import br.ufc.npi.gal.auditoria.RevisionAuditoriaTitulo;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.npi.gal.repository.TituloRespository;
import br.ufc.quixada.npi.enumeration.QueryType;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class TituloRespositoryImpl extends JpaGenericRepositoryImpl<Titulo> implements TituloRespository {
	@PersistenceContext
	EntityManager manager;

	@Override
	public Titulo getTituloByNome(String nome) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nome", nome);
		List<Titulo> result = find(QueryType.JPQL, "from Titulo where nome = :nome", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public Titulo getTituloByIsbn(String isbn) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("isbn", isbn);
		List<Titulo> result = find(QueryType.JPQL, "from Titulo where isbn = :isbn", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public Titulo getOutroTituloByNome(Integer id, String nome) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("nome", nome);
		params.put("id", id);
		List<Titulo> result = find(QueryType.JPQL, "from Titulo where id != :id and nome = :nome", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public Titulo getOutroTituloByIsbn(Integer id, String isbn) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("isbn", isbn);
		params.put("id", id);
		List<Titulo> result = find(QueryType.JPQL, "from Titulo where id != :id and isbn = :isbn", params);
		if(result != null && !result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}

	@Override
	public List<Titulo> getTitulosAuditoriaById(Integer id) {
		AuditReader reader = AuditReaderFactory.get(manager);

		List<Number> alteracoes = reader.getRevisions(Titulo.class, id);
		List<Titulo> tituloAuditoria = new ArrayList<Titulo>();
		Titulo t;
		AuditQuery query = reader.createQuery()
				.forRevisionsOfEntity(Titulo.class, false, true).add(AuditEntity.id().eq(id))
				.add(AuditEntity.revisionType().eq(RevisionType.MOD));

	    List<Object[]> list = query.getResultList();
	    List<Object> lt = null;
	    for(Number revisionNumber : alteracoes){
	    	AuditQuery query2 = reader.createQuery().forEntitiesAtRevision(Titulo.class, revisionNumber).add(AuditEntity.revisionType().eq(RevisionType.MOD));
	    	//query2.getResultList().toArray()[0];
	    }
		for(Object[] n : list){
			t = (Titulo) n[0];
			tituloAuditoria.add(t);
		}

		return tituloAuditoria;
	}

	@Override
	public List<RevisionAuditoriaTitulo> getRevisionsAuditoriaTituloById(Integer id) {
		AuditReader reader = AuditReaderFactory.get(manager);

		List<Number> alteracoes = reader.getRevisions(Titulo.class, id);
		List<RevisionAuditoriaTitulo> revisions = new ArrayList<RevisionAuditoriaTitulo>();
		RevisionAuditoriaTitulo r;
		
		for(Number n : alteracoes){
			r = (RevisionAuditoriaTitulo) reader.findRevision(RevisionAuditoriaTitulo.class, n);
			revisions.add(r);
		}
		
		return revisions;
	}


}
