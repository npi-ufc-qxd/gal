package br.ufc.npi.gal.service.impl;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.examples.HtmlToPlainText;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import br.ufc.npi.gal.service.ParserEstruturaCurricularService;

public class ParserEstruturaCurricularServiceImpl implements ParserEstruturaCurricularService {

	@Override
	public void processarArquivo(String urlEstruturaCurrcicular) throws IOException {
		if (validacaoDocumento(urlEstruturaCurrcicular)) {
			Document doc = Jsoup.connect(urlEstruturaCurrcicular).get();
			HtmlToPlainText formatter = new HtmlToPlainText();

			String selector = null;

			Elements elements = doc.select(selector);
			for (Element element : elements) {
				String plainText = formatter.getPlainText(element);
				System.out.println(plainText);
			}
		}

	}

	public boolean validacaoDocumento(String url) {
		try {
			Document doc = Jsoup.connect(url).get();
			return true;
			
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}

}
