package br.ufc.npi.gal.repository.jpa;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Named;

import br.ufc.npi.gal.model.Item;
import br.ufc.npi.gal.repository.ItemRepository;
import br.ufc.quixada.npi.enumeration.QueryType;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class ItemRepositoryImpl extends JpaGenericRepositoryImpl<Item> implements ItemRepository{

	@Override
	public Item getItemById(Integer id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		List<Item> result = find(QueryType.JPQL, "from Item where id = :id", params);
		if(result != null && !result.isEmpty()){
			return result.get(0);
		}
		return null;
	}

	@Override
	public Item getItemByCompraAndTitulo(Integer compraId, Integer tituloId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("compraId", compraId);
		params.put("tituloId", tituloId);
		List<Item> result = find(QueryType.JPQL, "from Item where compra.id = :compraId and titulo.id = :tituloId", params);
		if(result != null && !result.isEmpty()){
			return result.get(0);
		}
		return null;
	}

}
