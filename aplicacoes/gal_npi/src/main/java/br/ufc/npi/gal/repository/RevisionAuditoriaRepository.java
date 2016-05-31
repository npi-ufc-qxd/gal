package br.ufc.npi.gal.repository;

import java.util.List;

import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.npi.gal.model.RevisionAuditoria;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface RevisionAuditoriaRepository extends GenericRepository<RevisionAuditoria>{
	public abstract List<RevisionAuditoria> getIdsRevisionsAuditoriaDoTitulo(Integer id);
	
	public abstract List<RevisionAuditoria> getRevisionsAuditoriaByBibliografia(Bibliografia bibliografia);
	
	public abstract List<RevisionAuditoria> getRevisionAuditoriaDeUmaBibliografia(List<Bibliografia> listaAuditoriaBibliografia, List<RevisionAuditoria> revisions);
	
	public abstract RevisionAuditoria getRevisionAuditoriaBibliografiaRemovida(Bibliografia bibliografia);
	
	public abstract List<RevisionAuditoria> getAlteracoes(List<Titulo> titulosAudt, List<RevisionAuditoria> revisions);
}
