package br.ufc.npi.gal.repository;


import java.util.List;
import br.ufc.npi.gal.model.Disciplina;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface DisciplinaRepository extends GenericRepository<Disciplina> {
	
	public abstract Disciplina getDisciplinaByNome(String nome);
	
	public abstract Disciplina getDisciplinaByCodigo(String codigo);
	
	public abstract Disciplina getOutraDisciplinaByNome(Integer id, String nome);
	
	public abstract Disciplina getOutraDisciplinaByCodigo(Integer id, String codigo);
	
	public abstract List<Disciplina> getTodasDisciplinas();
	
	public abstract List<Disciplina> getTodasDisciplinasOrderByCodigo();
}
