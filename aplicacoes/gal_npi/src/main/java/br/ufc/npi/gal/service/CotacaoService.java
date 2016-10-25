package br.ufc.npi.gal.service;

import br.ufc.npi.gal.model.Cotacao;
import br.ufc.quixada.npi.service.GenericService;

public interface CotacaoService extends GenericService<Cotacao>{

	public abstract Cotacao getCotacaoById(Integer id);
}
