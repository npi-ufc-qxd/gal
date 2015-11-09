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
import org.springframework.web.multipart.MultipartFile;

import br.ufc.npi.gal.model.Curso;
import br.ufc.npi.gal.model.Disciplina;
import br.ufc.npi.gal.repository.DisciplinaRepository;
import br.ufc.npi.gal.repository.jpa.JpaCursoRepository;
import br.ufc.npi.gal.repository.jpa.JpaDisciplinaRepository;
import br.ufc.npi.gal.repository.jpa.JpaEstruturaCurricularRepositoryImpl;
import br.ufc.npi.gal.service.DisciplinaService;
import br.ufc.npi.gal.service.ParserEstruturaCurricularService;

@Named
public class ParserEstruturaCurricularServiceImpl implements ParserEstruturaCurricularService {
	private Document docFromHtml;
	@Inject
	private DisciplinaService disciplinaService;
	@Inject
	private JpaEstruturaCurricularRepositoryImpl jpaEstruturaCurricularRepository;
	@Inject
	private JpaCursoRepository jpaCursoRepository;
	
	public ParserEstruturaCurricularServiceImpl() {
	}

	@Override
	/*
	 * Este método é responsável por dar um get das informações de uma estrutura
	 * curricular Estas informações são dadas a partir de um HTML Caso a
	 * estrutura do HTML mude possivelmente este parser precisará ser atualizado
	 */
	public void processarArquivo(MultipartFile multipartFile){
		File fileHtml = new File("estrutura.html");
		try {
			multipartFile.transferTo(fileHtml);
			docFromHtml = Jsoup.parse(fileHtml, null, "");
			parserCurriculo();
			parserEstruturaCurricular();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private ArrayList<String> parserCurriculo() {
		ArrayList<String> info = new ArrayList<String>();
		Element tabela = docFromHtml.select("table").get(0);
		Elements linhas = tabela.select("tr");
		String codigoEstrutura = null;
		String nomeCurso = null;
		
		for (int i = 0; i < 14; i++) {
			if (i != 12) {
				Element linha = linhas.get(i);
				Elements colunas = linha.select("td");
				Element coluna = colunas.get(0);
				if(i==0){
					codigoEstrutura = colunas.get(0).text();
				}
				if(i==1){
					nomeCurso = colunas.get(0).text();
				}
				//System.out.println(colunas.get(0).text());
				info.add(coluna.text());
			}
		}
		// verificar no banco se a estruttura curricular já encontra-se cadastrada
		// usar as duas primeiras informações para verificar no banco 
		int limiteNomeCurso = nomeCurso.indexOf("-");
		nomeCurso = nomeCurso.substring(0, (limiteNomeCurso-1));
		System.out.println(verificaExistenciaEstruturaCurricular(nomeCurso, codigoEstrutura));
		return info;
	}
	
	private boolean verificaExistenciaEstruturaCurricular(String nomeCurso, String idEstrutura){
		Curso curso = jpaCursoRepository.getCursoByNome(nomeCurso);
		
		if(curso != null){
			if(jpaEstruturaCurricularRepository.getOutraEstruturaCurricularByAnoSemestre(curso.getId(), idEstrutura) != null){
				return true;
			}else{
				return false;
			}
		}
		return false;
	}

	private ArrayList<String> parserEstruturaCurricular() {
		ArrayList<String> info = new ArrayList<String>();
		// A quinta tabela do HTML é responsável por apresentar as informações
		// referentes aos componenetes de cada semestre. Mudanças no HTML poderá
		// ser necessário atualizar

		Element tabelaComponentes = docFromHtml.select("table").get(4);
		Elements linhas = tabelaComponentes.select("tr");
		System.out.println(linhas.size());

		for (int i = 0; i < linhas.size(); i++) {
			Element linha = linhas.get(i);
			// apenas tables referentes a componentes são válidas.
			// As demais devem ser ignoradas
			if (!(linha.className().equals("header"))) {
				if (linha.className().equals("tituloRelatorio")) {
					System.out.println();
					System.out.println(linha.select("td").text());
				}
				// O valor tem de ser igual a oito porque há algumas linhas que
				// são retornadas
				// que possuem menos elementos
				else if (linha.select("td").size() == 8) {
					parserComponente(linha.select("td"));
					System.out.println(linha.select("td").size());
					System.out.println();
				}
			}
		}
		return info;

	}

	/*
	 * Informações a serem extraídas de cada componente curricular...
	 * 
	 * 0 - ID 1 - Titulo + CH + Cr. + Periodo letivo 2 - CH Pratica + CH Lab 4 -
	 * Natureza 6 - pre-requisitos 7 - equivalentes 8 - co-requisito
	 * 
	 */

	private void parserComponente(Elements colunasComponente) {

		System.out.println(colunasComponente.get(0).text() + " | " + colunasComponente.get(1).text() + " | "
				+ colunasComponente.get(2).text() + " | " + colunasComponente.get(4).text() + " | "
				+ colunasComponente.get(6).text() + " | " + colunasComponente.get(7).text() + " | "
				+ colunasComponente.get(6).text());

		if (disciplinaService.getDisciplinaByCodigo(colunasComponente.get(0).text()) == null) {
			System.out.println("Add no banco");
		} else {
			System.out.println(disciplinaService.getDisciplinaByCodigo(colunasComponente.get(0).text()).getNome());
		}

	}

	@Override
	public void processarArquivoHTML(String urlEstruturaCurrcicular) throws IOException {
		// TODO Auto-generated method stub
		File fileHtml = new File(urlEstruturaCurrcicular);

		docFromHtml = Jsoup.parse(fileHtml, null, "");
		parserCurriculo();
		parserEstruturaCurricular();
	}

}