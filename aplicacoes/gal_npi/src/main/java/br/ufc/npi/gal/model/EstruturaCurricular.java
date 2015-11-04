package br.ufc.npi.gal.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "curriculo")
public class EstruturaCurricular {

	@Id
	@Column(name = "id_c")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "ano_semestre")

	@NotEmpty(message = "Campo obrigatório")
	@Pattern.List({ @Pattern(regexp = "([^\\s]{0,})", message = "O campo não pode conter espaços"),
			@Pattern(regexp = "([0-9]{4}+[.][1-2]{1})", message = "O campo deve conter formato xxxx.1 ou xxxx.2"), })
	private String anoSemestre;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_curso")
	private Curso curso;

	@OneToMany(mappedBy = "estruturaCurricular", targetEntity = IntegracaoCurricular.class, fetch = FetchType.LAZY)
	private List<IntegracaoCurricular> curriculos;

	@Column(name = "matriz_curricular")
	private String matrizCurricular;

	@Column(name = "unidade_vinculacao")
	private String unidadeVinculacao;

	@Column(name = "municipio")
	private String municipio;

	@Column(name = "semestre_vigor")
	@Pattern.List({ @Pattern(regexp = "([^\\s]{0,})", message = "O campo não pode conter espaços"),
			@Pattern(regexp = "([0-9]{4}+[.][1-2]{1})", message = "O campo deve conter formato xxxx.1 ou xxxx.2"), })
	private String semestreEntradaVigor;

	@Column(name = "ch_opt_minima")
	private String chOptMinima;

	@Column(name = "prazo_conclusao_minimo")
	private String prazoConclusaoMinimo;

	@Column(name = "prazo_conclusao_medio")
	private String prazoConclusaoMedio;

	@Column(name = "prazo_conclusao_maximo")
	private String prazoConclusaoMaximo;

	@Column(name = "ch_periodo_minimo")
	private String chPeriodoMinimo;

	@Column(name = "ch_periodo_medio")
	private String chPeriodoMedio;

	@Column(name = "ch_periodo_maximo")
	private String chPeriodoMaximo;

	public EstruturaCurricular() {

	}

	public String getMatrizCurricular() {
		return matrizCurricular;
	}

	public void setMatrizCurricular(String matrizCurricular) {
		this.matrizCurricular = matrizCurricular;
	}

	public String getUnidadeVinculacao() {
		return unidadeVinculacao;
	}

	public void setUnidadeVinculacao(String unidadeVinculacao) {
		this.unidadeVinculacao = unidadeVinculacao;
	}

	public String getMunicipio() {
		return municipio;
	}

	public void setMunicipio(String municipio) {
		this.municipio = municipio;
	}

	public String getSemestreEntradaVigor() {
		return semestreEntradaVigor;
	}

	public void setSemestreEntradaVigor(String semestreEntradaVigor) {
		this.semestreEntradaVigor = semestreEntradaVigor;
	}

	public String getChOptMinima() {
		return chOptMinima;
	}

	public void setChOptMinima(String chOptMinima) {
		this.chOptMinima = chOptMinima;
	}

	public String getPrazoConclusaoMinimo() {
		return prazoConclusaoMinimo;
	}

	public void setPrazoConclusaoMinimo(String prazoConclusaoMinimo) {
		this.prazoConclusaoMinimo = prazoConclusaoMinimo;
	}

	public String getPrazoConclusaoMedio() {
		return prazoConclusaoMedio;
	}

	public void setPrazoConclusaoMedio(String prazoConclusaoMedio) {
		this.prazoConclusaoMedio = prazoConclusaoMedio;
	}

	public String getPrazoConclusaoMaximo() {
		return prazoConclusaoMaximo;
	}

	public void setPrazoConclusaoMaximo(String prazoConclusaoMaximo) {
		this.prazoConclusaoMaximo = prazoConclusaoMaximo;
	}

	public String getChPeriodoMinimo() {
		return chPeriodoMinimo;
	}

	public void setChPeriodoMinimo(String chPeriodoMinimo) {
		this.chPeriodoMinimo = chPeriodoMinimo;
	}

	public String getChPeriodoMedio() {
		return chPeriodoMedio;
	}

	public void setChPeriodoMedio(String chPeriodoMedio) {
		this.chPeriodoMedio = chPeriodoMedio;
	}

	public String getChPeriodoMaximo() {
		return chPeriodoMaximo;
	}

	public void setChPeriodoMaximo(String chPeriodoMaximo) {
		this.chPeriodoMaximo = chPeriodoMaximo;
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
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public String toString() {
		return "EstruturaCurricular [id=" + id + ", anoSemestre=" + anoSemestre + ", curso=" + curso + "]";
	}

}
