package br.ufc.npi.gal.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import br.ufc.npi.gal.model.Item;
import br.ufc.npi.gal.repository.ItemRepository;
import br.ufc.npi.gal.service.ItemService;
import br.ufc.quixada.npi.service.impl.GenericServiceImpl;

@Named
public class ItemServiceImpl extends GenericServiceImpl<Item> implements ItemService {

	@Inject
	private ItemRepository itemRepository;

	@Override
	public Item getItemById(Integer id) {
		return this.itemRepository.getItemById(id);
	}

	
}
