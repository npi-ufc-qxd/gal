package br.ufc.npi.gal.repository;

import java.util.List;

import br.ufc.npi.gal.model.Compra;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface CompraRepository extends GenericRepository<Compra>{

	public abstract Compra getCompraById(Integer id);
	
	public abstract List<Compra> findOrderByCriadaEm();
}
