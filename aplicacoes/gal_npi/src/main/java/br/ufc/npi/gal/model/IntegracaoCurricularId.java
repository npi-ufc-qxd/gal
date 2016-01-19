package br.ufc.npi.gal.model;

import java.io.Serializable;


public class IntegracaoCurricularId implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private EstruturaCurricular estruturaCurricular;
	private ComponenteCurricular componente;
	
	
	
	
	public EstruturaCurricular getEstruturaCurricular() {
		return estruturaCurricular;
	}
	public void setEstruturaCurricular(EstruturaCurricular estruturaCurricular) {
		this.estruturaCurricular = estruturaCurricular;
	}
	public ComponenteCurricular getComponenteCurricular() {
		return componente;
	}
	public void setComponenteCurricular(ComponenteCurricular componenteCurricular) {
		this.componente = componenteCurricular;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public int hashCode() {
		return estruturaCurricular.hashCode()+componente.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		if(obj instanceof IntegracaoCurricularId){
			IntegracaoCurricularId integracaoId = (IntegracaoCurricularId) obj;
			return integracaoId.componente.equals(componente) && integracaoId.estruturaCurricular.equals(estruturaCurricular);
		}	
		return false;	
	}
}
