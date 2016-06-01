package br.ufc.npi.gal.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.hibernate.annotations.Cache;
import org.springframework.cache.annotation.CacheEvict;

import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.npi.gal.model.ComponenteCurricular;
import br.ufc.npi.gal.model.RevisionAuditoria;
import br.ufc.npi.gal.repository.ComponenteCurricularRepository;
import br.ufc.npi.gal.repository.RevisionAuditoriaRepository;
import br.ufc.npi.gal.service.ComponenteCurricularService;
import br.ufc.quixada.npi.service.impl.GenericServiceImpl;


@Named
public class ComponenteCurricularServiceImpl extends GenericServiceImpl<ComponenteCurricular> implements ComponenteCurricularService {
	
	@Inject
	private ComponenteCurricularRepository componenteCurricularRepository;
	
	@Inject
	private RevisionAuditoriaRepository revisionRepository;
	
	@Override
	public ComponenteCurricular getComponenteCurricularByNome(String nome) {
		return componenteCurricularRepository.getComponenteCurricularByNome(nome);
	}

	@Override
	public ComponenteCurricular getComponenteCurricularByCodigo(String codigo) {
		return componenteCurricularRepository.getComponenteCurricularByCodigo(codigo);
	}

	@Override
	public ComponenteCurricular getOutraComponenteCurricularByNome(Integer id, String nome) {
		return componenteCurricularRepository.getOutraComponenteCurricularByNome(id, nome);
	}

	@Override
	public ComponenteCurricular getOutraComponenteCurricularByCodigo(Integer id, String codigo) {
		return componenteCurricularRepository.getOutraComponenteCurricularByCodigo(id, codigo);
	}
	
	@Override
	public List<ComponenteCurricular> getTodosComponenteCurricular() {
		return componenteCurricularRepository.getTodosComponenteCurricular();
	}

	@Override
	public List<Bibliografia> getAuditoriasDeUmaBibliografia(Bibliografia bibliografia){
		return componenteCurricularRepository.getAuditoriasBibliografia(bibliografia);
	}
	
	@Override
	public List<List<RevisionAuditoria>> getAuditoriasBibliografias(List<Bibliografia> bibliografias,ComponenteCurricular componente){
		List<Bibliografia> listaAlditoriaDeUmaBibliografia = new ArrayList<Bibliografia>();
		List<RevisionAuditoria> auditoriaBibliografia = new ArrayList<RevisionAuditoria>();
		List<List<RevisionAuditoria>> audioriaComponente = new ArrayList<List<RevisionAuditoria>>();
		
		if(!bibliografias.isEmpty()){
			for(Bibliografia b : bibliografias){
				listaAlditoriaDeUmaBibliografia = componenteCurricularRepository.getAuditoriasBibliografia(b);
				List<RevisionAuditoria> revisions = this.revisionRepository.getRevisionsAuditoriaByBibliografia(b);
				auditoriaBibliografia = this.revisionRepository.mudancasEmUmaBibliografia(listaAlditoriaDeUmaBibliografia,revisions);
				if(!auditoriaBibliografia.isEmpty())
					audioriaComponente.add(auditoriaBibliografia);
			}
		}
		getAuditoriaBibliografiasRemovida(componente, audioriaComponente);
		
		return audioriaComponente;
	}
	
	public void getAuditoriaBibliografiasRemovida(ComponenteCurricular componente, List<List<RevisionAuditoria>> auditoriasComponente){
		List<Bibliografia> listaAlditoriaBibliografia = new ArrayList<Bibliografia>();
		List<RevisionAuditoria> auditoriaBibliografia = new ArrayList<RevisionAuditoria>();
		listaAlditoriaBibliografia = componenteCurricularRepository.getAuditoriaDeUmaBibliografiasRemovidas(componente);
		for(Bibliografia b : listaAlditoriaBibliografia){
			RevisionAuditoria revision = this.revisionRepository.getRevisionAuditoriaBibliografiaRemovida(b);
			auditoriaBibliografia.add(revision);	
		}
		if(!auditoriaBibliografia.isEmpty())
			auditoriasComponente.add(auditoriaBibliografia);
	}	
	
	@Override
	@CacheEvict(value="metas", allEntries = true)
	public void update(ComponenteCurricular entity) {
		super.update(entity);
	}
	
	@Override
	@CacheEvict(value= "metas", allEntries = true)
	public void delete(ComponenteCurricular entity) {
		super.delete(entity);
	}
	
	@Override
	@CacheEvict(value="metas", allEntries = true)
	public void save(ComponenteCurricular entity) {
		super.save(entity);
	}
	
	@Override
	@CacheEvict(value="metas", allEntries = true)
	public ComponenteCurricular find(Class<ComponenteCurricular> entityClass, Object id) {
		return super.find(entityClass, id);
	}
	
	
}