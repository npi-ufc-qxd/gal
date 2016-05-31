package br.ufc.npi.gal.auditoria;

import java.util.Date;

import org.hibernate.envers.RevisionListener;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import br.ufc.npi.gal.model.RevisionAuditoria;

public class InformacoeRevisao implements RevisionListener{

	@Override
	public void newRevision(Object revisionEntity) {
		RevisionAuditoria revision = (RevisionAuditoria) revisionEntity;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		revision.setUsername(auth.getName());
		revision.setMudanca(null);
		revision.setData(new Date(System.currentTimeMillis()));
	}
}
