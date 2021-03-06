package br.ufc.npi.gal.service;

import java.util.List;

public interface CalculoMetaService {

	public abstract List<ResultadoCalculo> gerarCalculo();
	
	public abstract List<ResultadoCalculo> gerarCalculoWithItensByCompra(int idCompra);
	
}