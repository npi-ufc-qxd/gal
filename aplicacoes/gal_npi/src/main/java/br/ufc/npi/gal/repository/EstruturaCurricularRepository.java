package br.ufc.npi.gal.repository;

import br.ufc.npi.gal.model.EstruturaCurricular;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface EstruturaCurricularRepository extends GenericRepository<EstruturaCurricular> {

	EstruturaCurricular getOutraEstruturaCurricularByCodigo(Integer id,
			String anoSemestre);

	EstruturaCurricular getOutraEstruturaCurricularByCurso(Integer idCurso);

	EstruturaCurricular getOutraEstruturaCurricularByCodigoSemestre(Integer id, String codigo);
	
	
}
