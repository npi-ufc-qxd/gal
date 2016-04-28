package br.ufc.npi.gal.auditoria;

import java.util.List;

import br.ufc.npi.gal.auditoria.TituloAuditoria;
import br.ufc.quixada.npi.repository.GenericRepository;

public interface TituloAuditoriaRepositorio extends GenericRepository<TituloAuditoria>{
	public abstract List<TituloAuditoria> getTituloAuditoriaById(Integer id);
	public abstract List<TituloAuditoria> getTituloAuditoriaByrevType(Integer revtype, Integer id);
}
