package br.ufc.npi.gal.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "integracao_curricular")
@IdClass(IntegracaoCurricularId.class)
public class IntegracaoCurricular {

	@Id
	@ManyToOne
	@JoinColumn(name = "id_curriculo")
	private EstruturaCurricular estruturaCurricular;

	@Id
	@ManyToOne
	@JoinColumn(name = "id_componente")
	private ComponenteCurricular componente;

	@Column(name = "qtd_alunos")
	private Integer quantidadeAlunos;

	@Column(name = "semestre_oferta")
	private Integer semestreOferta;

	@Column(name = "natureza")
	private String natureza;
	
	@Column(name="observacoes")
	private String observacoes;

	@Column(name="influenciar_calculo")
	private Boolean influenciarCalculo;

	public EstruturaCurricular getEstruturaCurricular() {
		return estruturaCurricular;
	}

	public void setEstruturaCurricular(EstruturaCurricular estruturaCurricular) {
		this.estruturaCurricular = estruturaCurricular;
	}
	
	public ComponenteCurricular getComponente() {
		return componente;
	}

	public void setComponente(ComponenteCurricular componente) {
		this.componente = componente;
	}

	public Integer getQuantidadeAlunos() {
		return quantidadeAlunos;
	}

	public void setQuantidadeAlunos(Integer quantidadeAlunos) {
		this.quantidadeAlunos = quantidadeAlunos;
	}

	public Integer getSemestreOferta() {
		return semestreOferta;
	}

	public void setSemestreOferta(Integer semestreOferta) {
		this.semestreOferta = semestreOferta;
	}

	public String getNatureza() {
		return natureza;
	}

	public void setNatureza(String natureza) {
		this.natureza = natureza;
	}

	public String getObservacoes() {
		return observacoes;
	}

	public void setObservacoes(String observacoes) {
		this.observacoes = observacoes;
	}

	public Boolean getInfluenciarCalculo() {
		return influenciarCalculo;
	}

	public void setInfluenciarCalculo(Boolean influenciarCalculo) {
		this.influenciarCalculo = influenciarCalculo;
	}

	@Override
	public String toString() {
		return "IntegracaoCurricular [estruturaCurricular=" + estruturaCurricular + ", componente=" + componente
				+ ", quantidadeAlunos=" + quantidadeAlunos + ", semestreOferta=" + semestreOferta + ", natureza="
				+ natureza + ", observacoes=" + observacoes + ", influenciarCalculo=" + influenciarCalculo + "]";
	}

}
