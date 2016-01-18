package br.ufc.npi.gal.model;

import java.io.Serializable;


public class BibliografiaId implements Serializable {

	private static final long serialVersionUID = 1L;
	
	
	private ComponenteCurricular componente;

	
	private Titulo titulo;
	
	

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

	@Override
	public int hashCode() {
		return titulo.hashCode()+componente.hashCode();
	}
	
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof BibliografiaId){
			BibliografiaId bibliografiaId = (BibliografiaId) obj;
			return bibliografiaId.componente.equals(componente) && bibliografiaId.titulo.equals(titulo);
		}
		
		return false;	
	}
}
