package br.ufc.npi.gal.auditoria;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="titulos_aud")
public class TituloAuditoria {
	@Id
	@Column(name="id_t")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="rev")
	private int rev;
	
	@Column(name="revtype")
	private int revtype;
	
	@Column(name="nome_titulo")
	private String nome;
	
	@Column(name="isbn")
	private String isbn;
	
	@Column(name="tipo_titulo")
	private String tipo;
	
	@Column(name = "autor")
	private String autor;
	
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
	
	@Column(name = "cadastrado_biblioteca")
	private Boolean cadastradoBiblioteca;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public int getRev() {
		return rev;
	}

	public void setRev(int rev) {
		this.rev = rev;
	}

	public int getRevtype() {
		return revtype;
	}

	public void setRevtype(int revtype) {
		this.revtype = revtype;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
}
