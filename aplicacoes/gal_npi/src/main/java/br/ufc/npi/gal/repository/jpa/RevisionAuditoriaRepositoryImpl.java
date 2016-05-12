package br.ufc.npi.gal.repository.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;

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
}
