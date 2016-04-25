package br.ufc.npi.gal.model;

public enum EnumNatureza {
		
	OBRIGATORIA("Obrigatória"), OPTATIVA("Optativa");
	
	private String descricao;
	
	private EnumNatureza(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDescricao() {
		return this.descricao;
	}
}
