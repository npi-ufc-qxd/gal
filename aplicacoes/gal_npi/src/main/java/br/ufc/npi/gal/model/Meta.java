package br.ufc.npi.gal.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "meta")
public class Meta {

	@Id
	@Column(name = "id_mt")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(unique = true)
	private String nome;

	private double indiceCalculoBasica;

	private double indiceCalculoComplementar;

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

	public double getIndiceCalculoBasica() {
		return indiceCalculoBasica;
	}

	public void setIndiceCalculoBasica(double indiceCalculoBasica) {
		this.indiceCalculoBasica = indiceCalculoBasica;
	}

	public double getIndiceCalculoComplementar() {
		return indiceCalculoComplementar;
	}

	public void setIndiceCalculoComplementar(double indiceCalculoComplementar) {
		this.indiceCalculoComplementar = indiceCalculoComplementar;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Meta) {
			Meta other = (Meta) obj;
			if (other != null && other.getId() != null && this.id != null
					&& other.getId().equals(this.id)) {
				return true;
			}
		}
		return false;
	}

}
