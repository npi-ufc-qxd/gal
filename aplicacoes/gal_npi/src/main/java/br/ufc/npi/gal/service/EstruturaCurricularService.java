package br.ufc.npi.gal.service;

import br.ufc.npi.gal.model.EstruturaCurricular;
import br.ufc.quixada.npi.service.GenericService;

public interface EstruturaCurricularService extends GenericService<EstruturaCurricular> {
	

	public abstract EstruturaCurricular getOutraEstruturaCurricularByCurso(Integer idCurso);

	public abstract EstruturaCurricular getOutraEstruturaCurricularByCodigo(Integer id, String codigo);

}
