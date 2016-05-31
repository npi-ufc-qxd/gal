package br.ufc.npi.gal.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.OrderBy;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "componentes")
public class ComponenteCurricular {

	@Id
	@Column(name = "id_c")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotEmpty(message = "Campo obrigatório")
	@Column(name = "nome")
	@Size(min = 5, max= 255, message = "O nome do Componente Curricular deve ter no mínimo 5 e no maximo 255 caracteres")
	private String nome;

	@NotEmpty(message = "Campo obrigatório")
	@Column(name = "cod_d")
	@Pattern(regexp = "[a-zA-Z\\sà-ùÀ-Ù0-9]{0,}", message = "O campo código do Componente Curricular não pode possuir caracteres especiais.")//12
	@Size(min = 5, max = 12, message = "O código do Componente Curricular deve ter entre 5 e 12 caracteres")
	private String codigo;
	
	@OneToMany(mappedBy = "componente", targetEntity = IntegracaoCurricular.class, fetch = FetchType.LAZY)
	private List<IntegracaoCurricular> curriculos;
	

	@OneToMany(mappedBy = "componente", targetEntity = Bibliografia.class, fetch = FetchType.LAZY)
	@OrderBy(clause = "prioridade ASC")
	private List<Bibliografia> bibliografias;

	@Column(name = "ch_pratica")
	@NotNull(message = "Campo obrigatório")
	private Integer chPratica;

	@Column(name = "ch_teorica")
	@NotNull(message = "Campo obrigatório")
	private Integer chTeorica;

	@Column(name = "tipo")
	private String tipo;
	
	@Transient
	public static final String COMPLEMENTAR = "Complementar";
	
	@Transient
	public static final String BASICA = "Básica";

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public ComponenteCurricular() {
		this.codigo = "";
		this.nome = "";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<IntegracaoCurricular> getCurriculos() {
		return curriculos;
	}

	public void setCurriculos(List<IntegracaoCurricular> curriculos) {
		this.curriculos = curriculos;
	}

	public List<Bibliografia> getBibliografias() {
		return bibliografias;
	}

	public void setBibliografias(List<Bibliografia> bibliografias) {
		this.bibliografias = bibliografias;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public String toString() {
		return "Componente [id=" + id + ", nome=" + nome + ", codigo=" + codigo + "]";
	}

	public Integer getChPratica() {
		return chPratica;
	}

	public void setChPratica(Integer chPratica) {
		this.chPratica = chPratica;
	}

	public Integer getChTeorica() {
		return chTeorica;
	}

	public void setChTeorica(Integer chTeorica) {
		this.chTeorica = chTeorica;
	}
	
	public List<Titulo> getTitulosBibliografiasBasicas() {
		List<Titulo> titulos = new ArrayList<Titulo>();
		for (Bibliografia bibliografia : this.bibliografias) {
			if (BASICA.equals(bibliografia.getTipoBibliografia())) {
				titulos.add(bibliografia.getTitulo());
			}
		}
		return titulos;
	}
	
	public List<Titulo> getTitulosBibliografiasComplementares() {
		List<Titulo> titulos = new ArrayList<Titulo>();
		for (Bibliografia bibliografia : this.bibliografias) {
			if (COMPLEMENTAR.equals(bibliografia.getTipoBibliografia())) {
				titulos.add(bibliografia.getTitulo());
			}
		}
		return titulos;
	}
	public List<Bibliografia> getBibliografiasPorTipo(String tipoBibliografia){
		List<Bibliografia> bibliografias = new ArrayList<Bibliografia>();
		for (Bibliografia bibliografia : this.bibliografias) {
			if (tipoBibliografia.equals(bibliografia.getTipoBibliografia())) {
				bibliografias.add(bibliografia);
			}
		}
		return bibliografias;
	}

}