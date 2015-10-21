package br.ufc.npi.gal.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import br.ufc.npi.gal.service.ParserEstruturaCurricularService;

public class ParserEstruturaCurricularServiceImpl implements ParserEstruturaCurricularService {
	private File fileHtml;
	private Document docFromHtml;
	private ArrayList<String> infoCurriculo;

	public ParserEstruturaCurricularServiceImpl() {

	}

	@Override
	public void processarArquivo(String urlEstruturaCurrcicular) throws IOException {
		/*
		 * if (validacaoDocumento(urlEstruturaCurrcicular)) { Document doc =
		 * Jsoup.connect(urlEstruturaCurrcicular).get(); //HtmlToPlainText
		 * formatter = new HtmlToPlainText(); }
		 */

		fileHtml = new File(urlEstruturaCurrcicular);
		docFromHtml = Jsoup.parse(fileHtml, null, "http://example.com/");
		infoCurriculo = parserCurriculo();

		for (String info : infoCurriculo) {
			System.out.println(info);
		}

	}

	private ArrayList<String> parserCurriculo() {
		ArrayList<String> info = new ArrayList<String>();
		Element tabela = docFromHtml.select("table").get(0);
		Elements linhas = tabela.select("tr");

		for (int i = 0; i < 14; i++) {
			if (i != 12) {
				Element linha = linhas.get(i);
				Elements colunas = linha.select("td");
				Element coluna = colunas.get(0);
				info.add(coluna.text());
			}
		}
		return info;
	}

	private void parserEstruturaCurricular() {

	}

}
