package br.ufc.npi.gal.repository.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;

import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.npi.gal.model.RevisionAuditoria;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.npi.gal.repository.RevisionAuditoriaRepository;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class RevisionAuditoriaRepositoryImpl extends JpaGenericRepositoryImpl<RevisionAuditoria> implements RevisionAuditoriaRepository{
	@PersistenceContext
	private EntityManager manager;

	@Override
	public List<RevisionAuditoria> getRevisionsAuditoriaTituloById(Integer id) {
		AuditReader reader = AuditReaderFactory.get(manager);

		List<Number> alteracoes = reader.getRevisions(Titulo.class, id);
		List<RevisionAuditoria> revisions = new ArrayList<RevisionAuditoria>();
		RevisionAuditoria r;
		
		for(Number n : alteracoes){
			r = (RevisionAuditoria) reader.findRevision(RevisionAuditoria.class, n);
			revisions.add(r);
		}
		
		return revisions;
	}
	
	public List<RevisionAuditoria> getRevisionsAuditoriaByBibliografia(Bibliografia bibliografia){
		AuditReader reader = AuditReaderFactory.get(manager);
		
		AuditQuery query = reader.createQuery().forRevisionsOfEntity(Bibliografia.class, false, true);
		query.addProjection(AuditEntity.revisionNumber());
		query.add(AuditEntity.id().eq(bibliografia));
		
		List<Number> alteracoesBibliografia =(List<Number>) query.getResultList();
		
		List<RevisionAuditoria> revisions = new ArrayList<RevisionAuditoria>();
		RevisionAuditoria r;
		
		for(Number n : alteracoesBibliografia){
			r = (RevisionAuditoria) reader.findRevision(RevisionAuditoria.class, n);
			revisions.add(r);
		}
		
		return revisions;
	}

	public List<RevisionAuditoria> mudancasEmUmaBibliografia(List<Bibliografia> listaAuditoriaBibliografia, List<RevisionAuditoria> revisions){
		StringBuilder alteracoes = new StringBuilder();
		List<RevisionAuditoria> alteracoesRevision = new ArrayList<RevisionAuditoria>();
		
		if(!listaAuditoriaBibliografia.isEmpty() && listaAuditoriaBibliografia.size() > 1){
			for(int i = 0; i < listaAuditoriaBibliografia.size() - 1; i++){
				
				if(listaAuditoriaBibliografia.get(i+1).getPrioridade() == listaAuditoriaBibliografia.get(i).getPrioridade()){
					alteracoes.append("Pioridade mudou de ");
					alteracoes.append(listaAuditoriaBibliografia.get(i).getPrioridade());
					alteracoes.append(" para ");
					alteracoes.append(listaAuditoriaBibliografia.get(i+1).getPrioridade());
					alteracoes.append(" ");
				}
				if(listaAuditoriaBibliografia.get(i+1).getTipoBibliografia().equals(listaAuditoriaBibliografia.get(i).getTipoBibliografia())){
					alteracoes.append("Bibliografia mudou de ");
					alteracoes.append(listaAuditoriaBibliografia.get(i).getTipoBibliografia());
					alteracoes.append(" para ");
					alteracoes.append(listaAuditoriaBibliografia.get(i+1).getTipoBibliografia());
				}
				revisions.get(i+1).conversao();
				revisions.get(i+1).setMudanca(alteracoes.toString());
				alteracoesRevision.add(revisions.get(i+1));
			}
		}
		return alteracoesRevision;
	}
	
}
