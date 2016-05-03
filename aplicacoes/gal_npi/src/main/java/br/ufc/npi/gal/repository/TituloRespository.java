package br.ufc.npi.gal.repository;

import java.util.List;

import br.ufc.npi.gal.auditoria.RevisionAuditoriaTitulo;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface TituloRespository extends GenericRepository<Titulo> {
	
	public abstract Titulo getTituloByNome(String nome);
	
	public abstract Titulo getTituloByIsbn(String isbn);
	
	public abstract Titulo getOutroTituloByNome(Integer id, String nome);
	
	public abstract Titulo getOutroTituloByIsbn(Integer id, String isbn);
	
	public abstract List<Titulo> getTitulosAuditoriaById(Integer id);
	
	public abstract List<RevisionAuditoriaTitulo> getRevisionsAuditoriaTituloById(Integer id);
}
