package br.ufc.npi.gal.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "disciplinas")
public class Disciplina {

	@Id
	@Column(name = "id_d")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@NotEmpty(message = "Campo obrigatório")
	@Column(name = "nome")
	@Size(min = 6, message = "O nome deve ter no mínimo 6 caracteres")
	private String nome;

	@NotEmpty(message = "Campo obrigatório")
	@Column(name = "cod_d")
	@Pattern(regexp = "[a-zA-Z\\sà-ùÀ-Ù0-9]{0,}", message = "O campo código não pode possuir caracteres especiais.")
	@Size(min = 5, max = 12, message = "O código deve ter entre 6 e 12 caracteres")
	private String codigo;

	@OneToMany(mappedBy = "disciplina", targetEntity = IntegracaoCurricular.class, fetch = FetchType.LAZY)
	private List<IntegracaoCurricular> curriculos;

	@OneToMany(mappedBy = "disciplina", targetEntity = Bibliografia.class, fetch = FetchType.LAZY)
	private List<Bibliografia> bibliografias;

	@Column(name = "ch_pratica")
	private Integer chPratica;

	@Column(name = "ch_teorica")
	private Integer chTeorica;

	@Column(name = "tipo")
	private String tipo;

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

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public Disciplina() {
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
		return "Disciplina [id=" + id + ", nome=" + nome + ", codigo=" + codigo + "]";
	}
}