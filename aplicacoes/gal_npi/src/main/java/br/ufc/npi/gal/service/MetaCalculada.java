package br.ufc.npi.gal.service;

import java.util.List;

public class MetaCalculada {

	private String nomeMeta;
	private List<DetalheMetaCalculada> detalhePar;
	private List<DetalheMetaCalculada> detalheImpar;

	public String getNome() {
		return nomeMeta;
	}

	public void setNome(String nome) {
		this.nomeMeta = nome;
	}

	public List<DetalheMetaCalculada> getDetalheMetaCalculadaPar() {
		return detalhePar;
	}

	public void setDetalheMetaCalculadaPar(
			List<DetalheMetaCalculada> detalheMetaCalculadaPar) {
		this.detalhePar = detalheMetaCalculadaPar;
	}

	public List<DetalheMetaCalculada> getDetalheMetaCalculadaImpar() {
		return detalheImpar;
	}

	public void setDetalheMetaCalculadaImpar(
			List<DetalheMetaCalculada> detalheMetaCalculadaImpar) {
		this.detalheImpar = detalheMetaCalculadaImpar;
	}

	@Override
	public String toString() {
		return "MetaCalculada [nome=" + nomeMeta + ", detalhePar=" + detalhePar
				+ ", detalheImpar=" + detalheImpar + "]";
	}

	public double calcular() {
		double somatorioPar = 0;
		double somatorioImpar = 0;

		for (DetalheMetaCalculada dmcPar : detalhePar) {
			somatorioPar += dmcPar.getCalculo();
		}
		for (DetalheMetaCalculada dmcImpar : detalheImpar) {
			somatorioPar += dmcImpar.getCalculo();
		}
		if (somatorioPar >= somatorioImpar) {
			return somatorioPar;
		} else {
			return somatorioImpar;
		}
	}

}
