package br.ufc.npi.gal.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.npi.gal.model.RevisionAuditoria;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.npi.gal.repository.RevisionAuditoriaRepository;
import br.ufc.npi.gal.service.RevisionAuditoriaService;
import br.ufc.quixada.npi.service.impl.GenericServiceImpl;

@Named
public class RevisionAuditoriaServiceImpl extends GenericServiceImpl<RevisionAuditoria> implements RevisionAuditoriaService{
	
	@Inject
	private RevisionAuditoriaRepository revisionAuditoriaRespository;
	
	@Override
	public List<RevisionAuditoria> getRevisionsAuditoriaTituloById(Integer id) {
		return this.revisionAuditoriaRespository.getRevisionsAuditoriaTituloById(id);
	}

	@Override
	public List<RevisionAuditoria> getAlteracoes(List<Titulo> titulosAudt, List<RevisionAuditoria> revisions) {
		StringBuilder alteracoes = new StringBuilder();
		List<RevisionAuditoria> alteracoesRevision = new ArrayList<RevisionAuditoria>();
		if(revisions.size() > 1){
			for(int i=0;i<revisions.size()-1;i++){
				if(!(titulosAudt.get(i+1).getNome().equals(titulosAudt.get(i).getNome()))){
					alteracoes.append(" Nome, ");
				}
				if(!(titulosAudt.get(i+1).getIsbn().equals(titulosAudt.get(i).getIsbn()))){
					alteracoes.append(" Isbn, ");
				}
				if(!(titulosAudt.get(i+1).getTipo().equals(titulosAudt.get(i).getTipo()))){
					alteracoes.append(" Tipo do livro, ");
				}
				if(!(titulosAudt.get(i+1).getAutor().equals(titulosAudt.get(i).getAutor()))){
					alteracoes.append(" Autor, ");
				}
				if(!(titulosAudt.get(i+1).getTitulo().equals(titulosAudt.get(i).getTitulo()))){
					alteracoes.append(" Titulo, ");
				}
				if(!(titulosAudt.get(i+1).getTitulo_n().equals(titulosAudt.get(i).getTitulo_n()))){
					alteracoes.append(" Titulo_N, ");
				}
				if(!(titulosAudt.get(i+1).getTituloRevista().equals(titulosAudt.get(i).getTituloRevista()))){
					alteracoes.append(" Titulo Revista, ");
				}
				if(!(titulosAudt.get(i+1).getSubTitulo().equals(titulosAudt.get(i).getSubTitulo()))){
					alteracoes.append(" Sub titulo, ");
				}
				if(!(titulosAudt.get(i+1).getPagina().equals(titulosAudt.get(i).getPagina()))){
					alteracoes.append(" Pagina, ");
				}
				if(!(titulosAudt.get(i+1).getRefArtigo().equals(titulosAudt.get(i).getRefArtigo()))){
					alteracoes.append(" Refrencia Artigo, ");
				}
				if(!(titulosAudt.get(i+1).getEdicao().equals(titulosAudt.get(i).getEdicao()))){
					alteracoes.append(" Edicao, ");
				}
				if(!(titulosAudt.get(i+1).getPublicador().equals(titulosAudt.get(i).getPublicador()))){
					alteracoes.append(" Publicador ");
				}
				revisions.get(i+1).conversao();
				revisions.get(i+1).setMudanca(alteracoes.toString());
				alteracoesRevision.add(revisions.get(i+1));
			}
		}
		return alteracoesRevision;
	}
	
	public List<RevisionAuditoria> getRevisionsAuditoriaByBibliografia(Bibliografia bibliografia){
		return this.revisionAuditoriaRespository.getRevisionsAuditoriaByBibliografia(bibliografia);
	}

}
