package br.ufc.npi.gal.auditoria;

import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

public class RevisaoTituloRepositorio extends JpaGenericRepositoryImpl<RevisionAuditoriaTitulo>{
	public RevisionAuditoriaTitulo getTituloAuditoriaById(Integer id){
//		AuditQuery query = reader.createQuery().forRevisionsOfEntity(Person.class, false, true);
//        // query.add(AuditEntity.property("name").like("Romain%"));
//        List<Object[]> list = query.getResultList();
//		return result;

		return null;
	}
}
