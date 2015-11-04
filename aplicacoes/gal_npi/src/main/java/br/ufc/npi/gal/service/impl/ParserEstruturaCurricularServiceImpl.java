package br.ufc.npi.gal.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.inject.Named;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import br.ufc.npi.gal.model.Disciplina;
import br.ufc.npi.gal.repository.DisciplinaRepository;
import br.ufc.npi.gal.repository.jpa.JpaDisciplinaRepository;
import br.ufc.npi.gal.service.DisciplinaService;
import br.ufc.npi.gal.service.ParserEstruturaCurricularService;

@Named
public class ParserEstruturaCurricularServiceImpl implements ParserEstruturaCurricularService {
	private File fileHtml;
	private Document docFromHtml;
	private ArrayList<String> infoCurriculo;
	@Inject
	private DisciplinaService disciplinaService;

	public ParserEstruturaCurricularServiceImpl() {
	}

	@Override
	/*
	 * Este método é responsável por dar um get das informações de uma estrutura
	 * curricular Estas informações são dadas a partir de um HTML Caso a
	 * estrutura do HTML mude possivelmente este parser precisará ser atualizado
	 */
	public void processarArquivo(String urlEstruturaCurrcicular) throws IOException {
		/*
		 * if (validacaoDocumento(urlEstruturaCurrcicular)) { Document doc =
		 * Jsoup.connect(urlEstruturaCurrcicular).get(); //HtmlToPlainText
		 * formatter = new HtmlToPlainText(); }
		 */

		fileHtml = new File(urlEstruturaCurrcicular);
		docFromHtml = Jsoup.parse(fileHtml, null, "http://example.com/");
		infoCurriculo = parserEstruturaCurricular();

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

	private ArrayList<String> parserEstruturaCurricular() {
		ArrayList<String> info = new ArrayList<String>();
		// A quinta tabela do HTML é responsável por apresentar as informações
		// referentes aos componenetes de cada semestre. Mudanças no HTML poderá
		// ser necessário atualizar
		Element tabelaComponentes = docFromHtml.select("table").get(4);
		Elements linhas = tabelaComponentes.select("tr");

		for (int i = 0; i < linhas.size(); i++) {
			Element linha = linhas.get(i);
			if (!(linha.className().equals("header"))) {
				if (linha.className().equals("tituloRelatorio")) {
					System.out.println();
					System.out.println(linha.select("td").text());
				} else if (linha.select("td").size() > 1) {
					parserComponente(linha.select("td"));
					System.out.println();
				}
			}
		}
		return info;

	}

	private void parserComponente(Elements colunasComponente) {

		System.out.print(colunasComponente.get(0).text() + " | " + colunasComponente.get(1).text() + " | "
				+ colunasComponente.get(2).text() + " | " + colunasComponente.get(4).text() + " | "
				+ colunasComponente.get(6).text() + " | " + colunasComponente.get(7).text() + " | "
				+ colunasComponente.get(6).text());

		System.out.print(disciplinaService.getDisciplinaByCodigo(colunasComponente.get(0).text()).getCodigo());

	}

}

/*
 * Informações a serem extraídas de cada componente curricular...
 * 
 * 0 - ID 1 - Titulo + CH + Cr. + Periodo letivo 2 - CH Pratica + CH Lab 4 -
 * Natureza 6 - pre-requisitos 7 - equivalentes 8 - co-requisito
 * 
 */
