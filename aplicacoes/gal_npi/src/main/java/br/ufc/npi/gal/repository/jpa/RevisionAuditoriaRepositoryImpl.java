package br.ufc.npi.gal.repository.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.envers.AuditReader;
import org.hibernate.envers.AuditReaderFactory;
import org.hibernate.envers.RevisionType;
import org.hibernate.envers.query.AuditEntity;
import org.hibernate.envers.query.AuditQuery;

import br.ufc.npi.gal.model.Bibliografia;
import br.ufc.npi.gal.model.RevisionAuditoria;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.npi.gal.repository.RevisionAuditoriaRepository;
import br.ufc.quixada.npi.repository.jpa.JpaGenericRepositoryImpl;

@Named
public class RevisionAuditoriaRepositoryImpl extends JpaGenericRepositoryImpl<RevisionAuditoria> implements RevisionAuditoriaRepository{
	@PersistenceContext
	private EntityManager manager;

	@Override
	public List<RevisionAuditoria> getIdsRevisionsAuditoriaDoTitulo(Integer id) {
		AuditReader reader = AuditReaderFactory.get(manager);

		List<Number> alteracoes = reader.getRevisions(Titulo.class, id);
		List<RevisionAuditoria> revisions = new ArrayList<RevisionAuditoria>();
		RevisionAuditoria r;
		
		for(Number n : alteracoes){
			r = (RevisionAuditoria) reader.findRevision(RevisionAuditoria.class, n);
			revisions.add(r);
		}
		
		return revisions;
	}
	
	@Override
	public List<RevisionAuditoria> getAlteracoes(List<Titulo> titulosAudt, List<RevisionAuditoria> revisions){
		StringBuilder alteracoes = new StringBuilder();
		List<RevisionAuditoria> alteracoesRevision = new ArrayList<RevisionAuditoria>();
		if(revisions.size() > 1){
			int aux;
			for(int i=0;i<revisions.size()-1;i++){
				aux = i+1;
				Titulo atual = titulosAudt.get(i);
				Titulo proximo = titulosAudt.get(i+1); 
				
				if(!(atual.getNome().equals(proximo.getNome()))){
					alteracoes.append(" Nome, ");
				}
				if(!(atual.getIsbn().equals(proximo.getIsbn()))){
					alteracoes.append(" Isbn, ");
				}
				if(!(atual.getTipo().equals(proximo.getTipo()))){
					alteracoes.append(" Tipo do livro, ");
				}
				if(!(atual.getAutor().equals(proximo.getAutor()))){
					alteracoes.append(" Autor, ");
				}
				if(!(titulosAudt.get(i+1).getTitulo().equals(titulosAudt.get(i).getTitulo()))){
					alteracoes.append(" Titulo, ");
				}
				if(!(atual.getTitulo_n().equals(proximo.getTitulo_n()))){
					alteracoes.append(" Titulo_N, ");
				}
				if(!(atual.getTituloRevista().equals(proximo.getTituloRevista()))){
					alteracoes.append(" Titulo Revista, ");
				}
				if(!(atual.getSubTitulo().equals(proximo.getSubTitulo()))){
					alteracoes.append(" Sub titulo, ");
				}
				if(!(atual.getPagina().equals(proximo.getPagina()))){
					alteracoes.append(" Pagina, ");
				}
				if(!(atual.getRefArtigo().equals(proximo.getRefArtigo()))){
					alteracoes.append(" Refrencia Artigo, ");
				}
				if(!(atual.getEdicao().equals(proximo.getEdicao()))){
					alteracoes.append(" Edicao, ");
				}
				if(!(atual.getPublicador().equals(proximo.getPublicador()))){
					alteracoes.append(" Publicador ");
				}
				revisions.get(aux).conversao();
				revisions.get(aux).setMudanca(alteracoes.toString());
				alteracoesRevision.add(revisions.get(aux));
			}
		}
		return alteracoesRevision;
	}
	
	@Override
	public List<RevisionAuditoria> getRevisionsAuditoriaByBibliografia(Bibliografia bibliografia){
		AuditReader reader = AuditReaderFactory.get(manager);
		
		AuditQuery query = reader.createQuery().forRevisionsOfEntity(Bibliografia.class, false, true);
		query.addProjection(AuditEntity.revisionNumber());
		query.add(AuditEntity.property("componente").eq(bibliografia.getComponenteCurricular()));
		query.add(AuditEntity.property("titulo").eq(bibliografia.getTitulo()));
		query.add(AuditEntity.property("titulo").isNotNull());
		
		List<Number> alteracoesBibliografia =(List<Number>) query.getResultList();
		
		List<RevisionAuditoria> revisions = new ArrayList<RevisionAuditoria>();
		RevisionAuditoria r;
		
		for(Number n : alteracoesBibliografia){
			r = (RevisionAuditoria) reader.findRevision(RevisionAuditoria.class,n);
			revisions.add(r);
		}
		
		return revisions;
	}

	@Override
	public RevisionAuditoria getRevisionAuditoriaBibliografiaRemovida(Bibliografia bibliografia){
		AuditReader reader = AuditReaderFactory.get(manager);
		
		AuditQuery query = reader.createQuery().forRevisionsOfEntity(Bibliografia.class, false, true);
		query.addProjection(AuditEntity.revisionNumber());
		query.add(AuditEntity.property("componente").eq(bibliografia.getComponenteCurricular()));
		query.add(AuditEntity.property("titulo").eq(bibliografia.getTitulo()));
		query.add(AuditEntity.revisionType().eq(RevisionType.DEL));
		
		List<Number> numeroRevInfo = query.getResultList();
		
		RevisionAuditoria revision = (RevisionAuditoria) reader.findRevision(RevisionAuditoria.class,numeroRevInfo.get(0));
		
		revision.setMudanca("A Bibliografia"+ bibliografia.getTitulo().getNome().substring(0,50)+" foi removida; ");
		
		return revision;
	}
	
	@Override
	public List<RevisionAuditoria> getRevisionAuditoriaDeUmaBibliografia(List<Bibliografia> listaAuditoriaBibliografia, List<RevisionAuditoria> revisions){
		StringBuilder alteracoes = new StringBuilder();
		List<RevisionAuditoria> alteracoesRevision = new ArrayList<RevisionAuditoria>();
		
		if(!listaAuditoriaBibliografia.isEmpty() && listaAuditoriaBibliografia.size() > 1){
			int aux;
			for(int i = 0; i < listaAuditoriaBibliografia.size() - 1; i++){
				aux = i+1;
				Bibliografia atual = listaAuditoriaBibliografia.get(i);
				Bibliografia proxima = listaAuditoriaBibliografia.get(i+1);
				if(atual.getTipoBibliografia() == null){
					alteracoes.append("A Bibliografia  ");
					alteracoes.append(atual.getTitulo().getNome().substring(0,50));
					alteracoes.append(" foi removida; ");
				}else{
					if(atual.getPrioridade() != proxima.getPrioridade()){
						alteracoes.append("A Pioridade do titulo ");
						alteracoes.append(atual.getTitulo().getNome().substring(0,50));
						alteracoes.append(" mudou de ");
						alteracoes.append(atual.getPrioridade());
						alteracoes.append(" para ");
						alteracoes.append(proxima.getPrioridade());
						alteracoes.append(" ; ");
					}
					if(!(atual.getTipoBibliografia().equals(proxima.getTipoBibliografia()))){
						alteracoes.append("A Bibliografia do titulo ");
						alteracoes.append(atual.getTitulo().getNome().substring(0,50));
						alteracoes.append(" mudou de ");
						alteracoes.append(atual.getTipoBibliografia());
						alteracoes.append(" para ");
						alteracoes.append(proxima.getTipoBibliografia());
						alteracoes.append(" ; ");
					}
				}

				revisions.get(aux).conversao();
				revisions.get(aux).setMudanca(alteracoes.toString());
				alteracoesRevision.add(revisions.get(aux));
			}
		}
		return alteracoesRevision;
	}

}
