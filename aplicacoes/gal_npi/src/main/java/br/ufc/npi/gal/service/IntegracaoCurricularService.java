package br.ufc.npi.gal.service;

import br.ufc.npi.gal.model.IntegracaoCurricular;
import br.ufc.quixada.npi.service.GenericService;

public interface IntegracaoCurricularService extends GenericService<IntegracaoCurricular> {

	IntegracaoCurricular getIntegracaoByIdComponenteCurricularIdCurriculo(Integer idDisciplina, Integer idCurriculo);
}