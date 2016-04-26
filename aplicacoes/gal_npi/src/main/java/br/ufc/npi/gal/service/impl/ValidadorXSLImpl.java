package br.ufc.npi.gal.service.impl;

import org.springframework.web.multipart.MultipartFile;

import br.ufc.npi.gal.service.ValidadorXSL;
import jxl.Sheet;

public class ValidadorXSLImpl implements ValidadorXSL {

	private static final int COLUNA_COD_EXEMPLAR = 2;
	private static final int COLUNA_TIPO = 26;
	private static final int COLUNA_AUTOR = 36;
	private static final int COLUNA_TITULO = 37;
	private static final int COLUNA_TITULO_N = 38;
	private static final int COLUNA_SUB_TITULO = 39;
	private static final int COLUNA_TITULO_REVISTA = 40;
	private static final int COLUNA_PAGINA = 41;
	private static final int COLUNA_REF_ARTIGO = 42;
	private static final int COLUNA_EDICAO = 43;
	private static final int COLUNA_ISBN = 45;
	private static final int COLUNA_PUBLICADOR = 46;

	private static final int LINHA_LABELS = 0;
	private static final int TOTAL_COLUNAS = 57;

	private static final String LABEL_COD_EXEMPLAR = "COD_EXEMPLAR";
	private static final String LABEL_TIPO = "MAT_ADICIONAL";
	private static final String LABEL_AUTOR = "AUTOR";
	private static final String LABEL_TITULO = "TITULO";
	private static final String LABEL_TITULO_N = "TITULO_N";
	private static final String LABEL_SUB_TITULO = "SUB_TITULO";
	private static final String LABEL_TITULO_REVISTA = "TITULO_REVISTA";
	private static final String LABEL_PAGINA = "PAGINA";
	private static final String LABEL_REF_ARTIGO = "REF_ARTIGO";
	private static final String LABEL_EDICAO = "EDICAO";
	private static final String LABEL_ISBN = "ESCALA";
	private static final String LABEL_PUBLICADOR = "PUBLICACAO";

	@Override
	public boolean isEmpty(MultipartFile multipartFile) {
		return multipartFile.isEmpty() ? true : false;
	}

	@Override
	public boolean isXLS(MultipartFile multipartFile) {
		String nomeDoArquivo = multipartFile.getOriginalFilename();
		String extensao = (String) nomeDoArquivo.subSequence(nomeDoArquivo.length() - 4, nomeDoArquivo.length());
		return extensao.equalsIgnoreCase(".xls") ? true : false;
	}

	@Override
	public boolean dadosValidos(Sheet sheet) {
		if (sheet.getColumns() < TOTAL_COLUNAS) {
			return false;
		}
		
		if (!sheet.getCell(COLUNA_COD_EXEMPLAR, LINHA_LABELS).getContents().equals(LABEL_COD_EXEMPLAR)) {
			return false;
		} else if (!sheet.getCell(COLUNA_TIPO, LINHA_LABELS).getContents().equals(LABEL_TIPO)) {
			return false;
		} else if (!sheet.getCell(COLUNA_AUTOR, LINHA_LABELS).getContents().equals(LABEL_AUTOR)) {
			return false;
		} else if (!sheet.getCell(COLUNA_TITULO, LINHA_LABELS).getContents().equals(LABEL_TITULO)) {
			return false;
		} else if (!sheet.getCell(COLUNA_TITULO_N, LINHA_LABELS).getContents().equals(LABEL_TITULO_N)) {
			return false;
		} else if (!sheet.getCell(COLUNA_SUB_TITULO, LINHA_LABELS).getContents().equals(LABEL_SUB_TITULO)) {
			return false;
		} else if (!sheet.getCell(COLUNA_TITULO_REVISTA, LINHA_LABELS).getContents().equals(LABEL_TITULO_REVISTA)) {
			return false;
		} else if (!sheet.getCell(COLUNA_PAGINA, LINHA_LABELS).getContents().equals(LABEL_PAGINA)) {
			return false;
		} else if (!sheet.getCell(COLUNA_REF_ARTIGO, LINHA_LABELS).getContents().equals(LABEL_REF_ARTIGO)) {
			return false;
		} else if (!sheet.getCell(COLUNA_EDICAO, LINHA_LABELS).getContents().equals(LABEL_EDICAO)) {
			return false;
		} else if (!sheet.getCell(COLUNA_ISBN, LINHA_LABELS).getContents().equals(LABEL_ISBN)) {
			return false;
		} else if (!sheet.getCell(COLUNA_PUBLICADOR, LINHA_LABELS).getContents().equals(LABEL_PUBLICADOR)) {
			return false;
		} 
		return true;
	}

}
