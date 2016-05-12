package br.ufc.npi.gal.repository;

import java.util.List;

import br.ufc.npi.gal.model.RevisionAuditoria;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface RevisionAuditoriaRepository extends GenericRepository<RevisionAuditoria>{
	public abstract List<RevisionAuditoria> getRevisionsAuditoriaTituloById(Integer id);
}
