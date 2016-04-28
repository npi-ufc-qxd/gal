package br.ufc.npi.gal.auditoria;

import br.ufc.quixada.npi.service.GenericService;

import java.util.List;

import br.ufc.npi.gal.auditoria.TituloAuditoria;

public interface TituloAuditoriaService extends GenericService<TituloAuditoria>{
	public abstract List<TituloAuditoria> getTituloAuditoriaById(Integer id);
	public abstract List<TituloAuditoria> getTituloAuditoriaByrevType(Integer revtype, Integer id);
}
