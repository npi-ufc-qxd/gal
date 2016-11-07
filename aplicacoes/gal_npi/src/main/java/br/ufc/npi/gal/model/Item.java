package br.ufc.npi.gal.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Item {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private Integer quantidade;
	
	@OneToOne
	private Titulo titulo;
	
	@ManyToOne
	private Compra compra;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public Titulo getTitulo() {
		return titulo;
	}

	public void setTitulo(Titulo titulo) {
		this.titulo = titulo;
	}

	public Compra getCompra() {
		return compra;
	}

	public void setCompra(Compra compra) {
		this.compra = compra;
	}
	
	public int getQuantidadeReal(){
		if(titulo!=null && titulo.getExemplares()!=null) {
			return titulo.getExemplares().size();
		}
		return 0;
	}
	
	public double getValorUnitarioMedio(){
		double valorUnitarioMedio = 0.0;
		if(titulo!=null && titulo.getCotacoes()!=null && !titulo.getCotacoes().isEmpty()){
			for(Cotacao cotacao : titulo.getCotacoes()){
				valorUnitarioMedio += cotacao.getValor();
			}
			valorUnitarioMedio /= titulo.getCotacoes().size();
		}
		return valorUnitarioMedio;
	}
	
	public double getValorTotalMedio(){
		return this.getValorUnitarioMedio()*this.quantidade;
	}
	
}
