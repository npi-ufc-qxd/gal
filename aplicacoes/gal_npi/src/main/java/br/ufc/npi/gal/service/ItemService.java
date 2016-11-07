package br.ufc.npi.gal.service;

import br.ufc.npi.gal.model.Item;
import br.ufc.quixada.npi.service.GenericService;

public interface ItemService extends GenericService<Item>{

	public abstract Item getItemById(Integer id);
	
}
