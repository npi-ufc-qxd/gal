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
import javax.validation.constraints.Size;

import org.hibernate.envers.Audited;
import org.hibernate.envers.NotAudited;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="titulos")
@Audited
//@NamedQuery(name="Titulo.findWithItensByCompra", query="select t from Titulo t left join fetch t.itens i on i.compra.id = :idCompra")
public class Titulo {

	@Id
	@Column(name="id_t")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name="nome_titulo")
	@NotEmpty(message="Campo obrigatório")
	private String nome;

	@Pattern.List({
		@Pattern(regexp = "([^\\s]{0,})", message = "O isbn não pode conter espaços"),
		@Pattern(regexp = "[a-zA-Z\\sà-ùÀ-Ù0-9]{0,}", message = "O campo não pode contar caracteres especiais")
	})
	@NotEmpty(message="Campo obrigatório")
	@Size(max=13, message="Este campo não pode conter mais de 13 caracteres")
	private String isbn;

	@Column(name="tipo_titulo")
	@NotEmpty(message="Campo obrigatório")
	private String tipo;

	@Column(name = "autor")
	private String autor;

	@Column(name = "titulo")
	@NotEmpty(message="Campo obrigatório")
	@Size(max=255,message="Este campo não pode conter mais de 255 caracteres")
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

	@Column(name = "cadastrado_biblioteca")
	private Boolean cadastradoBiblioteca;
	
	@NotAudited
	@OneToMany(mappedBy="titulo")
	private List<Item> itens;

	@NotAudited
	@OneToMany(mappedBy="titulo")
	private List<Cotacao> cotacoes;
	
	@NotAudited
	@OneToMany(mappedBy = "titulo", targetEntity = Bibliografia.class, fetch = FetchType.EAGER)
	private List<Bibliografia> bibliografias;
	
	@NotAudited
	@OneToMany(mappedBy = "titulo", targetEntity = Exemplar.class, fetch = FetchType.EAGER,cascade=CascadeType.REMOVE)
	private List<Exemplar> exemplares;

	public Titulo() {
		super();
	}

	public Titulo(String nome, String isbn, String tipo) {
		super();
		this.nome = nome;
		this.isbn = isbn;
		this.tipo = tipo;
	}

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
	
	public Boolean getCadastradoBiblioteca() {
		return cadastradoBiblioteca;
	}

	public void setCadastradoBiblioteca(Boolean cadastradoBiblioteca) {
		this.cadastradoBiblioteca = cadastradoBiblioteca;
	}
	
	public List<Cotacao> getCotacoes() {
		return cotacoes;
	}

	public void setCotacoes(List<Cotacao> cotacoes) {
		this.cotacoes = cotacoes;
	}
	
	public List<Item> getItens() {
		return itens;
	}

	public void setItens(List<Item> itens) {
		this.itens = itens;
	}

	public double getValorUnitarioMedio(){
		double valorUnitarioMedio = 0.0;
		if(this.getCotacoes()!=null && !this.getCotacoes().isEmpty()){
			for(Cotacao cotacao : this.getCotacoes()){
				valorUnitarioMedio += cotacao.getValor();
			}
			valorUnitarioMedio /= this.getCotacoes().size();
		}
		return valorUnitarioMedio;
	}
	
	@Override
	public String toString() {
		return "Titulo [id=" + id + ", nome=" + nome + ", tipo=" + tipo + "]";
	}
	

}