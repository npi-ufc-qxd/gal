package br.ufc.npi.gal.auditoria;

import org.hibernate.envers.RevisionListener;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class InformacoeRevisaoTitulo implements RevisionListener{

	@Override
	public void newRevision(Object revisionEntity) {
		// TODO Auto-generated method stub
		RevisionAuditoriaTitulo revison = (RevisionAuditoriaTitulo) revisionEntity;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		revison.setUsername(auth.getName());
	}
	
	public long getTimesTemp(){
		
		return 0;
	}
}
