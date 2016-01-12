package br.ufc.npi.gal.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;

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
	
	@ManyToOne
	private IntegracaoCurricular integracao;
	
	@OneToMany(mappedBy = "integracao", targetEntity = IntegracaoCurricular.class, fetch = FetchType.LAZY)
	private List<IntegracaoCurricular> preRequisitos;
	
	@OneToMany(mappedBy = "integracao", targetEntity = IntegracaoCurricular.class, fetch = FetchType.LAZY)
	private List<IntegracaoCurricular> coRequisitos;
	
	public List<IntegracaoCurricular> getCoRequisitos() {
		return coRequisitos;
	}

	public void setCoRequisitos(List<IntegracaoCurricular> coRequisitos) {
		this.coRequisitos = coRequisitos;
	}

	public IntegracaoCurricular getIntegracao() {
		return integracao;
	}

	public void setIntegracao(IntegracaoCurricular integracao) {
		this.integracao = integracao;
	}

	public List<IntegracaoCurricular> getPreRequisitos() {
		return preRequisitos;
	}

	public void setPreRequisitos(List<IntegracaoCurricular> preRequisitos) {
		this.preRequisitos = preRequisitos;
	}

	public String getNatureza() {
		return natureza;
	}

	public void setNatureza(String natureza) {
		this.natureza = natureza;
	}

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

	@Override
	public String toString() {
		return "IntegracaoCurricular [estruturaCurricular=" + estruturaCurricular + ", componente=" + componente
				+ ", quantidadeAlunos=" + quantidadeAlunos + ", semestreOferta=" + semestreOferta + "]";
	}

}
