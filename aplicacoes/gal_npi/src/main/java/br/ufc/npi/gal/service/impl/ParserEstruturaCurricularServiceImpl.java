package br.ufc.npi.gal.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.multipart.MultipartFile;

import br.ufc.npi.gal.model.Curso;
import br.ufc.npi.gal.model.Disciplina;
import br.ufc.npi.gal.model.EstruturaCurricular;
import br.ufc.npi.gal.model.IntegracaoCurricular;
import br.ufc.npi.gal.repository.jpa.JpaCursoRepository;
import br.ufc.npi.gal.repository.jpa.JpaEstruturaCurricularRepositoryImpl;
import br.ufc.npi.gal.service.DisciplinaService;
import br.ufc.npi.gal.service.EstruturaCurricularService;
import br.ufc.npi.gal.service.ParserEstruturaCurricularService;

@Named
public class ParserEstruturaCurricularServiceImpl implements ParserEstruturaCurricularService {
	private Document docFromHtml;
	@Inject
	private DisciplinaService disciplinaService;
	@Inject
	private EstruturaCurricularService estruturaCurricluarService;
	@Inject
	private JpaEstruturaCurricularRepositoryImpl jpaEstruturaCurricularRepository;
	@Inject
	private JpaCursoRepository jpaCursoRepository;
	private EstruturaCurricular estruturaCurricular;

	public ParserEstruturaCurricularServiceImpl() {
		estruturaCurricular = new EstruturaCurricular();
	}

	/*
	 * Este método é responsável por dar um get das informações de uma estrutura
	 * curricular Estas informações são dadas a partir de um HTML Caso a
	 * estrutura do HTML mude possivelmente este parser precisará ser atualizado
	 */
	@Override
	public List<String> processarArquivo(MultipartFile multipartFile, Integer id) {
		File fileHtml = new File("estrutura.html");
		try {
			multipartFile.transferTo(fileHtml);
			docFromHtml = Jsoup.parse(fileHtml, null, "");
			List<String> statusParser = parserCurriculo(id);
			if (statusParser != null)
				parserEstruturaCurricular();
			return statusParser;
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

	}

	private List<String> parserCurriculo(Integer id) {

		String codigoEstrutura = "";
		String nomeCurso = "";

		ArrayList<String> info = new ArrayList<String>();
		Element tabela = docFromHtml.select("table").get(0);
		Elements linhas = tabela.select("tr");

		for (int i = 0; i < 14; i++) {
			if (i != 12) {
				Element linha = linhas.get(i);
				Elements colunas = linha.select("td");
				Element coluna = colunas.get(0);
				if (i == 0) {
					codigoEstrutura = colunas.get(0).text();
				}
				if (i == 1) {
					nomeCurso = colunas.get(0).text();
				}
				info.add(coluna.text());
				System.out.println(coluna.text());
			}
		}

		// verificar no banco se a estruttura curricular já encontra-se
		// cadastrada
		// usar as duas primeiras informações para verificar no banco
		int limiteNomeCurso = nomeCurso.indexOf("-");
		nomeCurso = nomeCurso.substring(0, (limiteNomeCurso - 1));

		return info;
	}

	public EstruturaCurricular registrarNovaEstruturaCurricular(List<String> estrutura, Curso curso) {

		estruturaCurricular.setAnoSemestre(estrutura.get(0));
		estruturaCurricular.setMatrizCurricular(estrutura.get(1));
		estruturaCurricular.setUnidadeVinculacao(estrutura.get(2));
		estruturaCurricular.setMunicipio(estrutura.get(3));
		estruturaCurricular.setSemestreEntradaVigor(estrutura.get(4).replaceAll("\\ ", ""));
		estruturaCurricular.setChOptMinima(estrutura.get(5));

		int idMinino, idMedio, idMaximo;

		idMinino = estrutura.get(11).indexOf("Mínimo");
		idMedio = estrutura.get(11).indexOf("Médio");
		idMaximo = estrutura.get(11).indexOf("Máximo");
		estruturaCurricular.setPrazoConclusaoMinimo(estrutura.get(11).substring(idMinino + 6, 8));
		estruturaCurricular.setPrazoConclusaoMedio(estrutura.get(11).substring(idMedio + 5, 16));
		estruturaCurricular
				.setPrazoConclusaoMaximo(estrutura.get(11).substring(idMaximo + 6, estrutura.get(11).length()));

		idMinino = estrutura.get(12).indexOf("Mínima");
		idMedio = estrutura.get(12).indexOf("Média");
		idMaximo = estrutura.get(12).indexOf("Máxima");
		estruturaCurricular.setChPeriodoMinimo(estrutura.get(12).substring(idMinino + 6, idMedio - 2));
		estruturaCurricular.setChPeriodoMedio(estrutura.get(12).substring(idMedio + 5, idMaximo - 2));
		estruturaCurricular
				.setChPeriodoMaximo(estrutura.get(12).substring(idMaximo + 6, estrutura.get(12).length() - 1));
		estruturaCurricular.setCurso(curso);
		System.out.println(estruturaCurricular.getCurso().getId());
		estruturaCurricluarService.save(estruturaCurricular);
		return estruturaCurricular;
	}

	private ArrayList<String> parserEstruturaCurricular() {
		ArrayList<String> info = new ArrayList<String>();
		// A quinta tabela do HTML é responsável por apresentar as informações
		// referentes aos componenetes de cada semestre. Mudanças no HTML poderá
		// ser necessário atualizar

		Element tabelaComponentes = docFromHtml.select("table").get(4);
		Elements linhas = tabelaComponentes.select("tr");
		System.out.println(linhas.size());
		int periodoOferta = 0;

		for (int i = 0; i < linhas.size(); i++) {
			Element linha = linhas.get(i);
			// apenas tables referentes a componentes são válidas.
			// As demais devem ser ignoradas
			if (!(linha.className().equals("header"))) {
				if (linha.className().equals("tituloRelatorio")) {
					// pegando o período de oferta da integracao
					System.out.println(linha.select("td").text().substring(0, 1));
					periodoOferta = Integer.parseInt(linha.select("td").text().substring(0, 1));
				}
				// O valor tem de ser igual a oito porque há algumas linhas que
				// são retornadas
				// que possuem menos elementos
				else if (linha.select("td").size() == 8) {
					parserComponente(linha.select("td"), periodoOferta);
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

	private void parserComponente(Elements colunasComponente, int periodoOferta) {

		System.out.println(colunasComponente.get(0).text() + " | " + colunasComponente.get(1).text() + " | "
				+ colunasComponente.get(2).text() + " | " + colunasComponente.get(3).text() + " | "
				+ colunasComponente.get(4).text() + " | " + colunasComponente.get(6).text() + " | "
				+ colunasComponente.get(7).text() + " | " + colunasComponente.get(6).text());
		// ED0204 | SÉRIES TEMPORAIS APLICADAS - 64h (4cr) - 1 período letivo |
		// 32h aula (2cr) 32h lab.(2cr) | OPTATIVA | ( ED0174 OU CC0214 ) | | (
		// ED0174 OU CC0214 )
		Disciplina disciplina = new Disciplina();
		disciplina = disciplinaService.getDisciplinaByCodigo(colunasComponente.get(0).text());

		if (disciplina == null) {
			int valorParada, valorParada2 = 0;

			disciplina = new Disciplina();
			disciplina.setCodigo(colunasComponente.get(0).text());
			valorParada = colunasComponente.get(1).text().indexOf("-");
			disciplina.setNome(colunasComponente.get(1).text().substring(0, valorParada - 1));
			System.out.println(colunasComponente.get(1).text().substring(0, valorParada - 1));
			disciplina.setTipo(colunasComponente.get(4).text());
			System.out.println(colunasComponente.get(4).text());
			valorParada = colunasComponente.get(2).text().indexOf("aula");
			disciplina.setChTeorica(colunasComponente.get(2).text().substring(0, valorParada - 1));
			System.out.println(colunasComponente.get(2).text().substring(0, valorParada - 1));

			if ((colunasComponente.get(3).text().equals("DISCIPLINA"))) {

				valorParada = colunasComponente.get(2).text().indexOf("cr)");
				valorParada2 = colunasComponente.get(2).text().indexOf("lab");
				disciplina.setChPratica(colunasComponente.get(2).text().substring(valorParada + 4, valorParada2 - 1));
				System.out.println(colunasComponente.get(2).text().substring(valorParada + 4, valorParada2 - 1));
			} else {
				valorParada2 = colunasComponente.get(2).text().indexOf("lab");
				disciplina.setChPratica(colunasComponente.get(2).text().substring(valorParada + 5, valorParada2 - 1));
				System.out.println(colunasComponente.get(2).text().substring(valorParada + 5, valorParada2 - 1));
			}
			disciplinaService.save(disciplina);
			/*
			 * IntegracaoCurricular integracao = new IntegracaoCurricular();
			 * integracao.setDisciplina(disciplina);
			 * integracao.setEstruturaCurricular(estruturaCurricular);
			 * integracao.setNatureza(colunasComponente.get(4).text());
			 * integracao.setSemestreOferta(periodoOferta);
			 */
		}

	}

	@Override
	public void processarArquivoHTML(String urlEstruturaCurrcicular) throws IOException {
		// TODO Auto-generated method stub
		File fileHtml = new File(urlEstruturaCurrcicular);

		docFromHtml = Jsoup.parse(fileHtml, null, "");
		// parserCurriculo();
		parserEstruturaCurricular();
	}

}