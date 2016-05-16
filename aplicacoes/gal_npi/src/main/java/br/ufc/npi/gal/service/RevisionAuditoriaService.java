package br.ufc.npi.gal.service;

import java.util.List;

import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.npi.gal.model.RevisionAuditoria;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.quixada.npi.service.GenericService;

public interface RevisionAuditoriaService extends GenericService<RevisionAuditoria> {
	
	public abstract List<RevisionAuditoria> getRevisionsAuditoriaTituloById(Integer id);
	
	public abstract List<RevisionAuditoria> getAlteracoes(List<Titulo> titulosAudt,List<RevisionAuditoria> revisions);
	
	public abstract List<RevisionAuditoria> getRevisionsAuditoriaByBibliografia(Bibliografia bibliografia);
	
}
