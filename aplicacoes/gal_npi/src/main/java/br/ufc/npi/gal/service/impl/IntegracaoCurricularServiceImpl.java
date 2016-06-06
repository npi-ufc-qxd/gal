package br.ufc.npi.gal.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.cache.annotation.CacheEvict;

import br.ufc.npi.gal.model.IntegracaoCurricular;
import br.ufc.npi.gal.repository.IntegracaoCurricularRepository;
import br.ufc.npi.gal.service.IntegracaoCurricularService;
import br.ufc.quixada.npi.service.impl.GenericServiceImpl;

@Named
public class IntegracaoCurricularServiceImpl extends GenericServiceImpl<IntegracaoCurricular> implements IntegracaoCurricularService {
	
	@Inject
	private IntegracaoCurricularRepository integracaoCurricularRepository;
	
	@Override
	public IntegracaoCurricular getIntegracaoByIdComponenteCurricularIdCurriculo(Integer idDisciplina, Integer idCurriculo) {
		return integracaoCurricularRepository.getIntegracao(idDisciplina, idCurriculo);
	}

	@Override
	public IntegracaoCurricular getIntegracaoByIdComponente(Integer idComponente) {
		return integracaoCurricularRepository.getIntegracaoIdComponente(idComponente);
	}
	
	@Override
	@CacheEvict(value="metas", allEntries = true)
	public void delete(IntegracaoCurricular entity) {
		super.delete(entity);
	}
	
	@Override
	@CacheEvict(value="metas", allEntries = true)
	public void save(IntegracaoCurricular entity) {
		super.save(entity);
	}
	
	@Override
	@CacheEvict(value="metas", allEntries = true)
	public void update(IntegracaoCurricular entity) {
		super.update(entity);
	}
}