package br.ufc.npi.gal.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.cache.annotation.CacheEvict;

import br.ufc.npi.gal.model.Meta;
import br.ufc.npi.gal.repository.MetaRepository;
import br.ufc.npi.gal.service.MetaService;
import br.ufc.quixada.npi.service.impl.GenericServiceImpl;

@Named
public class MetaServiceImpl extends GenericServiceImpl<Meta> implements
		MetaService {

	@Inject
	private MetaRepository metaRepository;
	
	@Override
	public List<Meta> getMeta() {
		return metaRepository.getMeta();
	}
	
	@Override
	@CacheEvict(value="metas", allEntries = true)
	public void update(Meta entity) {
		super.update(entity);
	}
	
}