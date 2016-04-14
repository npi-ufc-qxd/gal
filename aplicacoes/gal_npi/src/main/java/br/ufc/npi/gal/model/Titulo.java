package br.ufc.npi.gal.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="titulos")
public class Titulo {
	
	public Titulo() {
		
	}
	
	public Titulo(String nome, String isbn, String tipo) {
		super();
		this.nome = nome;
		this.isbn = isbn;
		this.tipo = tipo;
	}
	
	@Id
	@Column(name="id_t")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	

	@Column(name="nome_titulo")
	private String nome;
	
	@Pattern.List({
		@Pattern(regexp = "([^\\s]{0,})", message = "O isbn não pode conter espaços"),
		@Pattern(regexp = "[a-zA-Z\\sà-ùÀ-Ù0-9]{0,}", message = "O campo não pode contar caracteres especiais")
	})
	@NotEmpty(message="Campo obrigatório")
	private String isbn;
	
	@Column(name="tipo_titulo")
	@NotEmpty(message="Campo obrigatório")
	private String tipo;
	
	@Column(name = "autor")
	private String autor;
	
	@NotEmpty(message = "Campo obrigatório")
	@Column(name = "titulo")
	private String titulo;
	
	@Column(name = "titulo_n")
	private String titulo_n;
	
	@Column(name = "sub_titulo")
	private String subTitulo;
	
	@Column(name = "titulo_revista")
	private String tituloRevista;
	
	@Column(name = "pagina")
	private String pagina;
	
	@Column(name = "ref_artigo")
	private String refArtigo;
	
	@Column(name = "edicao")
	private String edicao;
	
	@Column(name = "publicador")
	private String publicador;

	@OneToMany(mappedBy = "titulo", targetEntity = Bibliografia.class, fetch = FetchType.LAZY)

	private List<Bibliografia> bibliografias;
	
	@OneToMany(mappedBy = "titulo", targetEntity = Exemplar.class, fetch = FetchType.LAZY,cascade=CascadeType.REMOVE)
	private List<Exemplar> exemplares;
	
	public List<Bibliografia> getBibliografias() {
		return bibliografias;
	}

	public void setBibliografias(List<Bibliografia> bibliografias) {
		this.bibliografias = bibliografias;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getTitulo_n() {
		return titulo_n;
	}

	public void setTitulo_n(String titulo_n) {
		this.titulo_n = titulo_n;
	}

	public String getSubTitulo() {
		return subTitulo;
	}

	public void setSubTitulo(String subTitulo) {
		this.subTitulo = subTitulo;
	}

	public String getTituloRevista() {
		return tituloRevista;
	}

	public void setTituloRevista(String tituloRevista) {
		this.tituloRevista = tituloRevista;
	}

	public String getPagina() {
		return pagina;
	}

	public void setPagina(String pagina) {
		this.pagina = pagina;
	}

	public String getRefArtigo() {
		return refArtigo;
	}

	public void setRefArtigo(String refArtigo) {
		this.refArtigo = refArtigo;
	}

	public String getEdicao() {
		return edicao;
	}

	public void setEdicao(String edicao) {
		this.edicao = edicao;
	}

	public String getPublicador() {
		return publicador;
	}

	public void setPublicador(String publicador) {
		this.publicador = publicador;
	}
	
	public List<Exemplar> getExemplares() {
		return exemplares;
	}

	public void setExemplares(List<Exemplar> exemplares) {
		this.exemplares = exemplares;
	}

	public int getAcervo() {
		return this.exemplares.size();
	}

	@Override
	public String toString() {
		return "Titulo [id=" + id + ", nome=" + nome + ", tipo=" + tipo + "]";
	}

}
