package br.ufc.npi.gal.repository;


import java.util.List;
import br.ufc.npi.gal.model.ComponenteCurricular;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface ComponenteCurricularRepository extends GenericRepository<ComponenteCurricular> {
	
	public abstract ComponenteCurricular getComponenteCurricularByNome(String nome);
	
	public abstract ComponenteCurricular getComponenteCurricularByCodigo(String codigo);
	
	public abstract ComponenteCurricular getOutraComponenteCurricularByNome(Integer id, String nome);
	
	public abstract ComponenteCurricular getOutraComponenteCurricularByCodigo(Integer id, String codigo);
	
	public abstract List<ComponenteCurricular> getTodosComponenteCurricular();
}
