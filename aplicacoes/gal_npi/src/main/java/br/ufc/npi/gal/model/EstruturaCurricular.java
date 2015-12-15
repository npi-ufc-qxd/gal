package br.ufc.npi.gal.model;

import java.util.ArrayList;
import java.util.Arrays;
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
import javax.print.DocFlavor.CHAR_ARRAY;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.Transient;

@Entity
@Table(name = "curriculo")
public class EstruturaCurricular{

	@Id
	@Column(name = "id_c")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "codigo")
	@NotEmpty(message = "Campo obrigatório")
	@Pattern.List({
			@Pattern(regexp = "([^\\s]{0,})", message = "O campo não pode conter espaços"),
			@Pattern(regexp = "([0-9]{4}+[.][1-2]{1})", message = "O campo deve conter formato xxxx.1 ou xxxx.2"), })
	private String codigo;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "id_curso")
	private Curso curso;

	@OneToMany(mappedBy = "estruturaCurricular", targetEntity = IntegracaoCurricular.class, fetch = FetchType.LAZY)
	private List<IntegracaoCurricular> curriculos;

	@Column(name = "matriz_curricular")
	@NotEmpty(message = "Campo obrigatório")
	@Pattern.List({ @Pattern(regexp = "([a-z A-Z à-ú À-Ú\\s -]+$)", message = "O campo deve conter apenas letras"), })
	private String matrizCurricular;

	@Column(name = "unidade_vinculacao")
	@NotEmpty(message = "Campo obrigatório")
	private String unidadeVinculacao;

	@Column(name = "municipio")
	@NotEmpty(message = "Campo obrigatório")
	@Pattern.List({ @Pattern(regexp = "([a-z A-Z à-ú À-Ú\\s -]+$)", message = "Formato inválido"), })
	private String municipio;

	@Column(name = "semestre_vigor")
	@NotEmpty(message = "Campo obrigatório")
	@Pattern.List({
			@Pattern(regexp = "([^\\s]{0,})", message = "O campo não pode conter espaços"),
			@Pattern(regexp = "([0-9]{4}+[.][1-2]{1})", message = "O campo deve conter formato xxxx.1 ou xxxx.2"), })
	private String semestreEntradaVigor;

	@Column(name = "ch_opt_minima")
	@NotNull(message = "Campo obrigatório")
	private Integer chOptMinima;

	@Column(name = "prazo_conclusao_minimo")
	@NotNull(message = "Campo obrigatório")
	private Integer prazoConclusaoMinimo;

	@Column(name = "prazo_conclusao_medio")
	@NotNull(message = "Campo obrigatório")
	private Integer prazoConclusaoMedio;

	@Column(name = "prazo_conclusao_maximo")
	@NotNull(message = "Campo obrigatório")
	private Integer prazoConclusaoMaximo;

	@Column(name = "ch_periodo_minima")
	@NotNull(message = "Campo obrigatório")
	private Integer chPeriodoMinimo;

	@Column(name = "ch_periodo_media")
	@NotNull(message = "Campo obrigatório")
	private Integer chPeriodoMedio;

	@Column(name = "ch_periodo_maxima")
	@NotNull(message = "Campo obrigatório")
	private Integer chPeriodoMaximo;

	@javax.persistence.Transient
	private Integer chTotalMinima;

	@javax.persistence.Transient
	private Integer chObrigatoria;

	@javax.persistence.Transient
	private Integer chObgTeorica;

	@javax.persistence.Transient
	private Integer chObgPratica;

	@javax.persistence.Transient
	private Integer chAtvAcademicaEspecifica;

	@Column(name = "ch_comp_opt_livres")
	@NotNull(message = "Campo obrigatório")
	private Integer chCompOptLivres;
	
	@javax.persistence.Transient
	public static final String NATUREZA = "OBRIGATORIA";
	
	@javax.persistence.Transient
	public static final List<String> TIPO_ATV_ESPECIFICA = new ArrayList<String>(
			Arrays.asList("ESTAGIO", "TCC", "ATIVIDADES COMPLEMENTARES"));
	
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

	public Integer getPrazoConclusaoMinimo() {
		return prazoConclusaoMinimo;
	}

	public void setPrazoConclusaoMinimo(Integer prazoConclusaoMinimo) {
		this.prazoConclusaoMinimo = prazoConclusaoMinimo;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
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
		return "EstruturaCurricular [id=" + id + ", codigo=" + codigo
				+ ", curso=" + curso + "]";
	}

	public Integer getChOptMinima() {
		return chOptMinima;
	}

	public void setChOptMinima(Integer chOptMinima) {
		this.chOptMinima = chOptMinima;
	}

	public Integer getPrazoConclusaoMedio() {
		return prazoConclusaoMedio;
	}

	public void setPrazoConclusaoMedio(Integer prazoConclusaoMedio) {
		this.prazoConclusaoMedio = prazoConclusaoMedio;
	}

	public Integer getPrazoConclusaoMaximo() {
		return prazoConclusaoMaximo;
	}

	public void setPrazoConclusaoMaximo(Integer prazoConclusaoMaximo) {
		this.prazoConclusaoMaximo = prazoConclusaoMaximo;
	}

	public Integer getChPeriodoMinimo() {
		return chPeriodoMinimo;
	}

	public void setChPeriodoMinimo(Integer chPeriodoMinimo) {
		this.chPeriodoMinimo = chPeriodoMinimo;
	}

	public Integer getChPeriodoMedio() {
		return chPeriodoMedio;
	}

	public void setChPeriodoMedio(Integer chPeriodoMedio) {
		this.chPeriodoMedio = chPeriodoMedio;
	}

	public Integer getChPeriodoMaximo() {
		return chPeriodoMaximo;
	}

	public void setChPeriodoMaximo(Integer chPeriodoMaximo) {
		this.chPeriodoMaximo = chPeriodoMaximo;
	}

	public Integer getChTotalMinima() {
		return chTotalMinima;
	}

	public void setChTotalMinima(Integer chTotalMinima) {
		this.chTotalMinima = chTotalMinima;
	}

	public Integer getChObrigatoria() {
		calcularChCalculaveis();
		return chObrigatoria;
	}

	public void setChObrigatoria(Integer chObrigatoria) {
		this.chObrigatoria = chObrigatoria;
	}

	public Integer getChObgTeorica() {
		return chObgTeorica;
	}

	public void setChObgTeorica(Integer chObgTeorica) {
		this.chObgTeorica = chObgTeorica;
	}

	public Integer getChObgPratica() {
		return chObgPratica;
	}

	public void setChObgPratica(Integer chObgPratica) {
		this.chObgPratica = chObgPratica;
	}

	public Integer getChAtvAcademicaEspecifica() {
		return chAtvAcademicaEspecifica;
	}

	public void setChAtvAcademicaEspecifica(Integer chAtvAcademicaEspecifica) {
		this.chAtvAcademicaEspecifica = chAtvAcademicaEspecifica;
	}

	public Integer getChCompOptLivres() {
		return chCompOptLivres;
	}

	public void setChCompOptLivres(Integer chCompOptLivres) {
		this.chCompOptLivres = chCompOptLivres;
	}
	
	private void calcularChCalculaveis() {
		calcularChObrigatoria();
		calcularChTotalMinima();
		calcularChAtvAcademicaEspecifica();
		}

	private void calcularChAtvAcademicaEspecifica() {
		int contChAtvAcademicaEspecifica = 0;
		
		for (IntegracaoCurricular curriculo : this.getCurriculos()) {
			if (TIPO_ATV_ESPECIFICA.contains(curriculo.getComponente().getTipo())) {
				contChAtvAcademicaEspecifica += curriculo.getComponente().getChPratica();
				contChAtvAcademicaEspecifica += curriculo.getComponente().getChTeorica();
			}
		}
		this.chAtvAcademicaEspecifica = contChAtvAcademicaEspecifica;
	}

	private void calcularChTotalMinima() {
		this.chTotalMinima = chOptMinima + chObrigatoria;
	}

	private void calcularChObrigatoria() {
		int contChObrigatoria;
		int contChObgTeorica = 0;
		int contChObgPratica = 0;
		
		for (IntegracaoCurricular curriculo : this.getCurriculos()) {
			if (NATUREZA.equals(curriculo.getNatureza())) {
				contChObgPratica += curriculo.getComponente().getChPratica();
				contChObgTeorica += curriculo.getComponente().getChTeorica();
			}
		}

		contChObrigatoria = contChObgTeorica + contChObgPratica;
		this.chObgPratica = contChObgPratica;
		this.chObgTeorica = contChObgTeorica;
		this.chObrigatoria = contChObrigatoria;
	}
}
