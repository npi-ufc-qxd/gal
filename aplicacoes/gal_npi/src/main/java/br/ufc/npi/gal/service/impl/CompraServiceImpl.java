package br.ufc.npi.gal.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import br.ufc.npi.gal.model.Compra;
import br.ufc.npi.gal.repository.CompraRepository;
import br.ufc.npi.gal.service.CompraService;
import br.ufc.quixada.npi.service.impl.GenericServiceImpl;

@Named
public class CompraServiceImpl extends GenericServiceImpl<Compra> implements CompraService {

	@Inject
	private CompraRepository compraRepository;

	@Override
	public Compra getCompraById(Integer id) {
		return compraRepository.getCompraById(id);
	}

	@Override
	public List<Compra> findOrderByCriadaEm() {
		return compraRepository.findOrderByCriadaEm();
	}
	
	
}
