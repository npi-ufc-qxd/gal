package br.ufc.npi.gal.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="curriculo")
public class EstruturaCurricular {
	
	@Id
	@Column(name="id_c")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name="ano_semestre")
	private String anoSemestre;
	
	@JoinColumn(name="cod_curso",referencedColumnName="cod_c")
	@ManyToOne
	private Curso curso;
	
	@OneToMany(mappedBy="estruturaCurricular")
	private List<IntegracaoCurricular> curriculos;
	
	public EstruturaCurricular(){
		
	}

	public EstruturaCurricular(String anoSemestre, Curso curso) {
		super();
		this.anoSemestre = anoSemestre;
		this.curso = curso;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAnoSemestre() {
		return anoSemestre;
	}

	public void setAnoSemestre(String anoSemestre) {
		this.anoSemestre = anoSemestre;
	}

	public Curso getCurso() {
		return curso;
	}

	public void setCurso(Curso curso) {
		this.curso = curso;
	}
	
	

	public List<IntegracaoCurricular> getCurriculos() {
		return curriculos;
	}

	public void setCurriculos(List<IntegracaoCurricular> curriculos) {
		this.curriculos = curriculos;
	}

	@Override
	public String toString() {
		return "EstruturaCurricular [id=" + id + ", anoSemestre=" + anoSemestre
				+ ", curso=" + curso + "]";
	}
	
	
}
