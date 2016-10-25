package br.ufc.npi.gal.repository;

import br.ufc.npi.gal.model.Cotacao;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface CotacaoRepository extends GenericRepository<Cotacao>{

	public abstract Cotacao getCotacaoById(Integer id);
}
