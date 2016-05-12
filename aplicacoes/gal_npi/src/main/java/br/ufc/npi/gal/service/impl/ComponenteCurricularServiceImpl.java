package br.ufc.npi.gal.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.npi.gal.model.ComponenteCurricular;
import br.ufc.npi.gal.repository.ComponenteCurricularRepository;
import br.ufc.npi.gal.service.ComponenteCurricularService;
import br.ufc.quixada.npi.service.impl.GenericServiceImpl;


@Named
public class ComponenteCurricularServiceImpl extends GenericServiceImpl<ComponenteCurricular> implements ComponenteCurricularService {
	
	@Inject
	private ComponenteCurricularRepository componenteCurricularRepository;

	@Override
	public ComponenteCurricular getComponenteCurricularByNome(String nome) {
		return componenteCurricularRepository.getComponenteCurricularByNome(nome);
	}

	@Override
	public ComponenteCurricular getComponenteCurricularByCodigo(String codigo) {
		return componenteCurricularRepository.getComponenteCurricularByCodigo(codigo);
	}

	@Override
	public ComponenteCurricular getOutraComponenteCurricularByNome(Integer id, String nome) {
		return componenteCurricularRepository.getOutraComponenteCurricularByNome(id, nome);
	}

	@Override
	public ComponenteCurricular getOutraComponenteCurricularByCodigo(Integer id, String codigo) {
		return componenteCurricularRepository.getOutraComponenteCurricularByCodigo(id, codigo);
	}
	
	@Override
	public List<ComponenteCurricular> getTodosComponenteCurricular() {
		return componenteCurricularRepository.getTodosComponenteCurricular();
	}

	@Override
	public List<Bibliografia> getBibliografiasAuditoria(ComponenteCurricular componente){
		return componenteCurricularRepository.getBibliografiasAuditoria(componente);
	}

}