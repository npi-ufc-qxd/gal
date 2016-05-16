package br.ufc.npi.gal.repository;

import java.util.List;

import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.npi.gal.model.RevisionAuditoria;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface RevisionAuditoriaRepository extends GenericRepository<RevisionAuditoria>{
	public abstract List<RevisionAuditoria> getRevisionsAuditoriaTituloById(Integer id);
	public abstract List<RevisionAuditoria> getRevisionsAuditoriaByBibliografia(Bibliografia bibliografia);
	public abstract List<RevisionAuditoria> mudancasEmUmaBibliografia(List<Bibliografia> listaAuditoriaBibliografia, List<RevisionAuditoria> revisions);
}