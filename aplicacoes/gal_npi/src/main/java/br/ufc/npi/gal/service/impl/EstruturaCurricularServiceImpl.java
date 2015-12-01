package br.ufc.npi.gal.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import br.ufc.npi.gal.model.EstruturaCurricular;
import br.ufc.npi.gal.repository.EstruturaCurricularRepository;
import br.ufc.npi.gal.service.EstruturaCurricularService;
import br.ufc.quixada.npi.service.impl.GenericServiceImpl;


@Named
public class EstruturaCurricularServiceImpl extends GenericServiceImpl<EstruturaCurricular> implements EstruturaCurricularService{

	@Inject
	private EstruturaCurricularRepository estruturaRepository;
	@Override
	public EstruturaCurricular getOutraEstruturaCurricularByCodigo(
			Integer id, String codigo) {
		
		return estruturaRepository.getOutraEstruturaCurricularByCodigo(id, codigo);
	}
	
}
