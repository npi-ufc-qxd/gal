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
	public List<RevisionAuditoria> getRevisionsAuditoriaTituloById(Integer id) {
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
	public List<RevisionAuditoria> mudancasEmUmaBibliografia(List<Bibliografia> listaAuditoriaBibliografia, List<RevisionAuditoria> revisions){
		StringBuilder alteracoes = new StringBuilder();
		List<RevisionAuditoria> alteracoesRevision = new ArrayList<RevisionAuditoria>();
		
		if(!listaAuditoriaBibliografia.isEmpty() && listaAuditoriaBibliografia.size() > 1){
			for(int i = 0; i < listaAuditoriaBibliografia.size() - 1; i++){
				if(listaAuditoriaBibliografia.get(i).getTipoBibliografia() == null){
					alteracoes.append("A Bibliografia  ");
					alteracoes.append(listaAuditoriaBibliografia.get(i).getTitulo().getNome().substring(0,50));
					alteracoes.append(" foi removida; ");
				}else{
					if(listaAuditoriaBibliografia.get(i).getPrioridade() != listaAuditoriaBibliografia.get(i+1).getPrioridade()){
						alteracoes.append("A Pioridade do titulo ");
						alteracoes.append(listaAuditoriaBibliografia.get(i).getTitulo().getNome().substring(0,50));
						alteracoes.append(" mudou de ");
						alteracoes.append(listaAuditoriaBibliografia.get(i).getPrioridade());
						alteracoes.append(" para ");
						alteracoes.append(listaAuditoriaBibliografia.get(i+1).getPrioridade());
						alteracoes.append(" ; ");
					}
					if(!(listaAuditoriaBibliografia.get(i).getTipoBibliografia().equals(listaAuditoriaBibliografia.get(i+1).getTipoBibliografia()))){
						alteracoes.append("A Bibliografia do titulo ");
						alteracoes.append(listaAuditoriaBibliografia.get(i).getTitulo().getNome().substring(0,50));
						alteracoes.append(" mudou de ");
						alteracoes.append(listaAuditoriaBibliografia.get(i).getTipoBibliografia());
						alteracoes.append(" para ");
						alteracoes.append(listaAuditoriaBibliografia.get(i+1).getTipoBibliografia());
						alteracoes.append(" ; ");
					}
				}

				revisions.get(i+1).conversao();
				revisions.get(i+1).setMudanca(alteracoes.toString());
				alteracoesRevision.add(revisions.get(i+1));
			}
		}
		return alteracoesRevision;
	}

}
