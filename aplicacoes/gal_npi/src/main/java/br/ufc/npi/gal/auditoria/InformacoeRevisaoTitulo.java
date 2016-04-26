package br.ufc.npi.gal.auditoria;

import org.hibernate.envers.RevisionListener;

public class InformacoeRevisaoTitulo implements RevisionListener{

	@Override
	public void newRevision(Object revisionEntity) {
		// TODO Auto-generated method stub
		AuditoriaTitulo revison = (AuditoriaTitulo) revisionEntity;
		revison.setUsername("teste");
	}

}
