package br.ufc.npi.gal.auditoria;

import org.hibernate.envers.RevisionListener;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import br.ufc.npi.gal.model.RevisionAuditoriaTitulo;

public class InformacoeRevisaoTitulo implements RevisionListener{

	@Override
	public void newRevision(Object revisionEntity) {
		RevisionAuditoriaTitulo revison = (RevisionAuditoriaTitulo) revisionEntity;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		revison.setUsername(auth.getName());
	}
}
