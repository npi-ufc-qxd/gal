package br.ufc.npi.gal.service;

import java.util.List;

import br.ufc.npi.gal.model.Compra;
import br.ufc.quixada.npi.service.GenericService;

public interface CompraService extends GenericService<Compra>{

	public abstract Compra getCompraById(Integer id);
	
	public abstract List<Compra> findOrderByCriadaEm();
}
