package br.ufc.npi.gal.repository;

import br.ufc.npi.gal.model.IntegracaoCurricular;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface IntegracaoCurricularRepository extends GenericRepository<IntegracaoCurricular> {

	IntegracaoCurricular getIntegracao(Integer idDisciplina, Integer idCurriculo);
}