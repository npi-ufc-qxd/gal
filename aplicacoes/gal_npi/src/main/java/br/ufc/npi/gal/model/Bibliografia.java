package br.ufc.npi.gal.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.envers.Audited;


@Entity
@Audited
@Table(name = "bibliografias")
@IdClass(BibliografiaId.class)
public class Bibliografia {

	@Id
	@ManyToOne
	@JoinColumn(name="id_componente")
	private ComponenteCurricular componente;

	@Id
	@ManyToOne
	@JoinColumn(name = "id_titulo")
	private Titulo titulo;

	@Column(name = "tipo_bibliografia")
	private String tipoBibliografia;
	
	@Column(name="prioridade")
	private Integer prioridade;
	
	public ComponenteCurricular getComponenteCurricular() {
		return componente;
	}

	public void setComponenteCurricular(ComponenteCurricular componenteCurricular) {
		this.componente = componenteCurricular;
	}

	public Titulo getTitulo() {
		return titulo;
	}

	public void setTitulo(Titulo titulo) {
		this.titulo = titulo;
	}

	public String getTipoBibliografia() {
		return tipoBibliografia;
	}

	public void setTipoBibliografia(String tipoBibliografia) {
		this.tipoBibliografia = tipoBibliografia;
	}
	
	public Integer getPrioridade() {
		return prioridade;
	}

	public void setPrioridade(Integer prioridade) {
		this.prioridade = prioridade;
	}
	

	@Override
	public String toString() {
		
		 return "Bibliografia [id_componente=" + componente +
		 ", id_titulo="
		 + titulo + ", componente=" + getComponenteCurricular() + ", titulo="
		 + getTitulo() + ", tipoBibliografia=" + tipoBibliografia + "]";
	}
}
