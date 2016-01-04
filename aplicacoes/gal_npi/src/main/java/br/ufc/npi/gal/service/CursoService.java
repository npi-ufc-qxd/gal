package br.ufc.npi.gal.service;

import java.util.List;

import br.ufc.npi.gal.model.Curso;
import br.ufc.quixada.npi.service.GenericService;

public interface CursoService extends GenericService<Curso> {
    
	public abstract Curso getCursoBySigla(String sigla);
	
	public abstract Curso getCursoById(Integer id);
	
	public abstract Curso getCursoByCodigo(Integer codigo);
	
	public abstract Curso getOutroCursoBySigla(Integer id, String sigla);
	
	public abstract Curso getOutroCursoByCodigo(Integer id, Integer codigo);

	public abstract List<Curso> getTodosCursos();
}