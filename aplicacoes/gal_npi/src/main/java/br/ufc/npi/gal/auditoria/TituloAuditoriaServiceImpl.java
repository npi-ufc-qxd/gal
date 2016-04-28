package br.ufc.npi.gal.auditoria;


import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import br.ufc.quixada.npi.service.impl.GenericServiceImpl;

@Named
public class TituloAuditoriaServiceImpl extends GenericServiceImpl<TituloAuditoria> implements TituloAuditoriaService{
	
	@Inject
	private TituloAuditoriaRepositorio tituloAuditoriaRepositorio;
	
	@Override
	public List<TituloAuditoria> getTituloAuditoriaById(Integer id) {
		return tituloAuditoriaRepositorio.getTituloAuditoriaById(id);
	}

	@Override
	public List<TituloAuditoria> getTituloAuditoriaByrevType(Integer revtype, Integer id) {
		return tituloAuditoriaRepositorio.getTituloAuditoriaByrevType(revtype, id);
	}

}
