package br.ufc.npi.gal.exception;

public class ArquivoNaoSuportadoException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ArquivoNaoSuportadoException() {
		super("Arquivo não suportado.");
	}
	
	public ArquivoNaoSuportadoException(String mensagem){
		super(mensagem);
	}
}
