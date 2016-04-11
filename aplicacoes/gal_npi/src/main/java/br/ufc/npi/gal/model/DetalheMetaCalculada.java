package br.ufc.npi.gal.model;

public class DetalheMetaCalculada {

	private String componente;
	private String curso;
	private String tipoBibliografia;
	private String curriculo;
	private double calculo;
	private Integer semestre;
	private int quantidadeAlunos;
	private String codigoComponente;
	
	public void setComponente(String componente) {
		this.componente = componente;
	}

	public String getComponente(){
		return componente;
	}

	public String getCurso() {
		return curso;
	}

	public void setCurso(String curso) {
		this.curso = curso;
	}

	public String getTipoBibliografia() {
		return tipoBibliografia;
	}

	public void setTipoBibliografia(String tipoBibliografia) {
		this.tipoBibliografia = tipoBibliografia;
	}

	public String getCurriculo() {
		return curriculo;
	}

	public void setCurriculo(String curriculo) {
		this.curriculo = curriculo;
	}

	public double getCalculo() {
		return calculo;
	}

	public void setCalculo(double calculo) {
		this.calculo = calculo;
	}

	@Override
	public String toString() {
		return "DetalheMetaCalculada [componente=" + componente + ", curso=" + curso + ", tipoBibliografia="
				+ tipoBibliografia + ", curriculo=" + curriculo + ", calculo=" + calculo + "]";
	}

	public Integer getSemestre() {
		return semestre;
	}

	public void setSemestre(Integer semestre) {
		this.semestre = semestre;
	}

	public int getQuantidadeAlunos() {
		return quantidadeAlunos;
	}

	public void setQuantidadeAlunos(int quantidadeAlunos) {
		this.quantidadeAlunos = quantidadeAlunos;
	}

	public String getCodigoComponente() {
		return codigoComponente;
	}

	public void setCodigoComponente(String codigoComponente) {
		this.codigoComponente = codigoComponente;
	}

	
}
