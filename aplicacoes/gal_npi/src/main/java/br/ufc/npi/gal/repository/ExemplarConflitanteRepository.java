package br.ufc.npi.gal.repository;

import br.ufc.npi.gal.model.Exemplar;
import br.ufc.npi.gal.model.ExemplarConflitante;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface ExemplarConflitanteRepository extends GenericRepository<ExemplarConflitante>{
	
	public abstract ExemplarConflitante getExemplarConflitanteByCodigo(String codigoExemplar);
	
}
