package br.ufc.npi.gal.repository;

import br.ufc.npi.gal.model.Item;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface ItemRepository extends GenericRepository<Item> {

	public abstract Item getItemById(Integer id);
}
