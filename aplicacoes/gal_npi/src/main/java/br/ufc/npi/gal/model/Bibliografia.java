package br.ufc.npi.gal.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "bibliografias")
@IdClass(BibliografiaId.class)
public class Bibliografia implements Comparable<Object>{

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
	
	@Column(name = "posicao")
	private Integer posicao;

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
	
	public Integer getPosicao() {
		return posicao;
	}

	public void setPosicao(int posicao) {
		this.posicao = posicao;
	}

	@Override
	public String toString() {
		
		 return "Bibliografia [id_componente=" + componente +
		 ", id_titulo="
		 + titulo + ", componente=" + getComponenteCurricular() + ", titulo="
		 + getTitulo() + ", tipoBibliografia=" + tipoBibliografia + "]";
	}

	@Override
	public int compareTo(Object o) {
		Bibliografia aux = (Bibliografia )o;
		if(this.posicao  > aux.posicao) {
			return 1;
		} else if(this.posicao  < aux.posicao) {
			return -1;
		}
		return 0;
	}
}
