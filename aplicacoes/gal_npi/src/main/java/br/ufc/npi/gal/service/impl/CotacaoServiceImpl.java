package br.ufc.npi.gal.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import br.ufc.npi.gal.model.Cotacao;
import br.ufc.npi.gal.repository.CotacaoRepository;
import br.ufc.npi.gal.service.CotacaoService;
import br.ufc.quixada.npi.service.impl.GenericServiceImpl;

@Named
public class CotacaoServiceImpl extends GenericServiceImpl<Cotacao> implements CotacaoService{

	@Inject
	private CotacaoRepository cotacaoRepository;
	
	@Override
	public Cotacao getCotacaoById(Integer id) {
		return cotacaoRepository.getCotacaoById(id);
	}

}
