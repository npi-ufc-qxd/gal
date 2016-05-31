package br.ufc.npi.gal.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.npi.gal.model.RevisionAuditoria;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.npi.gal.repository.RevisionAuditoriaRepository;
import br.ufc.npi.gal.service.RevisionAuditoriaService;
import br.ufc.quixada.npi.service.impl.GenericServiceImpl;

@Named
public class RevisionAuditoriaServiceImpl extends GenericServiceImpl<RevisionAuditoria> implements RevisionAuditoriaService{
	
	@Inject
	private RevisionAuditoriaRepository revisionAuditoriaRespository;
	
	@Override
	public List<RevisionAuditoria> getIdsRevisionsAuditoriaDoTitulo(Integer id) {
		return this.revisionAuditoriaRespository.getIdsRevisionsAuditoriaDoTitulo(id);
	}

	@Override
	public List<RevisionAuditoria> getAlteracoes(List<Titulo> titulosAudt, List<RevisionAuditoria> revisions) {
		return this.revisionAuditoriaRespository.getAlteracoes(titulosAudt, revisions);
	}
	
	public List<RevisionAuditoria> getRevisionsAuditoriaByBibliografia(Bibliografia bibliografia){
		return this.revisionAuditoriaRespository.getRevisionsAuditoriaByBibliografia(bibliografia);
	}

}
