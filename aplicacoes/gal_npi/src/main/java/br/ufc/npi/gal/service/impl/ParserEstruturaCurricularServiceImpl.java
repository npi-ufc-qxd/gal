package br.ufc.npi.gal.service.impl;

import java.io.File;
import java.io.IOException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.web.multipart.MultipartFile;

import br.ufc.npi.gal.model.Curso;
import br.ufc.npi.gal.model.Disciplina;
import br.ufc.npi.gal.model.EstruturaCurricular;
import br.ufc.npi.gal.model.IntegracaoCurricular;
import br.ufc.npi.gal.service.CursoService;
import br.ufc.npi.gal.service.DisciplinaService;
import br.ufc.npi.gal.service.EstruturaCurricularService;
import br.ufc.npi.gal.service.IntegracaoCurricularService;
import br.ufc.npi.gal.service.ParserEstruturaCurricularService;

@Named
public class ParserEstruturaCurricularServiceImpl implements ParserEstruturaCurricularService {
	private Document docFromHtml;
	@Inject
	private DisciplinaService disciplinaService;
	@Inject
	private EstruturaCurricularService estruturaCurricluarService;
	@Inject
	private IntegracaoCurricularService integracaoCurricularService;
	@Inject
	private CursoService cursoService;
	private EstruturaCurricular estruturaCurricular;

	public ParserEstruturaCurricularServiceImpl() {
		estruturaCurricular = new EstruturaCurricular();
	}

	@Override
	public List<String> processarArquivo(Integer id) {
		try {
			List<String> statusParser = parserCurriculo(id);
			if (statusParser != null)
				return statusParser;
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	@Override
	public boolean verificaConformidadeDocumeto(MultipartFile multipartFile, Integer id) throws IOException {
		File fileHtml = new File("estrutura.html");
		String nomeCurso = "";
		int indice = 0;

		try {
			multipartFile.transferTo(fileHtml);
			docFromHtml = Jsoup.parse(fileHtml, null, "");
			List<String> statusParser = parserCurriculo(id);
			indice = statusParser.get(1).indexOf(" -");
			nomeCurso = removeAcentos(statusParser.get(1).substring(0, indice).toUpperCase());

			Curso curso = cursoService.getCursoByCodigo(id);
			if (nomeCurso.equals(curso.getNome())) {
				return true;
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

	/**
	 * 
	 * @param id,
	 *            id do curso relacionado com a nova estrutura curricular
	 * @return retorna um array com as informações do currículo que foram
	 *         adicionadas
	 */
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
			}
		}

		/**
		 * verificar no banco se a estruttura curricular já encontra-se
		 * cadastrada usar as duas primeiras informações para verificar no banco
		 */
		int limiteNomeCurso = nomeCurso.indexOf("-");
		nomeCurso = nomeCurso.substring(0, (limiteNomeCurso - 1));
		return info;
	}

	/**
	 * 
	 * @param estrutura,
	 *            lista de informações coletadas no método private
	 *            parserCurriculo que traz as informações a serem salvas no
	 *            banco
	 * @param curso,
	 *            curso relacionado com a estrutura curricular
	 * @return retorna a nova estrutura curricular adicionada no banco
	 */
	public EstruturaCurricular registrarNovaEstruturaCurricular(List<String> estrutura, Curso curso) {
		EstruturaCurricular novaEstrutura = new EstruturaCurricular();
		novaEstrutura.setCodigo(estrutura.get(0));
		novaEstrutura.setMatrizCurricular(estrutura.get(1));
		novaEstrutura.setUnidadeVinculacao(estrutura.get(2));
		novaEstrutura.setMunicipio(estrutura.get(3));
		novaEstrutura.setSemestreEntradaVigor(estrutura.get(4).replaceAll("\\ ", ""));
		novaEstrutura.setChOptMinima(trasnformaStringInteger(estrutura.get(8).replaceAll("hrs", "")));
		novaEstrutura.setChCompOptLivres(trasnformaStringInteger(estrutura.get(10).replaceAll("hrs", "")));

		int idMinino, idMedio, idMaximo;

		idMinino = estrutura.get(11).indexOf("Mínimo");
		idMedio = estrutura.get(11).indexOf("Médio");
		idMaximo = estrutura.get(11).indexOf("Máximo");
		novaEstrutura.setPrazoConclusaoMinimo(
				trasnformaStringInteger(estrutura.get(11).substring(idMinino + 6, idMedio-1)));
		novaEstrutura.setPrazoConclusaoMedio(
				trasnformaStringInteger(estrutura.get(11).substring(idMedio + 5, idMaximo-1)));
		novaEstrutura.setPrazoConclusaoMaximo(trasnformaStringInteger(
				estrutura.get(11).substring(idMaximo + 6, estrutura.get(11).length())));

		idMinino = estrutura.get(12).indexOf("Mínima");
		idMedio = estrutura.get(12).indexOf("Média");
		idMaximo = estrutura.get(12).indexOf("Máxima");
		novaEstrutura.setChPeriodoMinimo(trasnformaStringInteger(
				estrutura.get(12).substring(idMinino + 6, idMedio - 2).replaceAll("hrs", "")));
		novaEstrutura.setChPeriodoMedio(trasnformaStringInteger(
				estrutura.get(12).substring(idMedio + 5, idMaximo - 2).replaceAll("hrs", "")));
		novaEstrutura.setChPeriodoMaximo(trasnformaStringInteger(estrutura.get(12)
				.substring(idMaximo + 6, estrutura.get(12).length() - 1).replaceAll("hrs", "")));
		novaEstrutura.setCurso(curso);
		estruturaCurricular = novaEstrutura;
		estruturaCurricluarService.save(novaEstrutura);
		parserEstruturaCurricular();
		return novaEstrutura;
	}

	/**
	 * 
	 * @return deve retornar a lista de todas as disciplinas cadastradas no
	 *         banco da nova estrutura curricular. Estas informações serão úteis
	 *         no momento de dar um log do processo de importação que foi feito
	 */
	private ArrayList<String> parserEstruturaCurricular() {
		ArrayList<String> info = new ArrayList<String>();

		/**
		 * A quinta tabela do HTML é responsável por apresentar as informações
		 * referentes aos componenetes de cada semestre. Mudanças no HTML poderá
		 * ser necessário atualizar
		 */

		Element tabelaComponentes = docFromHtml.select("table").get(4);
		Elements linhas = tabelaComponentes.select("tr");
		int periodoOferta = 0;

		for (int i = 0; i < linhas.size(); i++) {
			Element linha = linhas.get(i);
			/**
			 * apenas tables referentes a componentes são válidas. As demais
			 * devem ser ignoradas
			 */
			if (!(linha.className().equals("header"))) {
				if (linha.className().equals("tituloRelatorio")) {
					/**
					 * pegando o período de oferta da integracao
					 */
					periodoOferta = Integer.parseInt(linha.select("td").text().substring(0, 1));
				}
				/**
				 * O valor tem de ser igual a oito porque há algumas linhas que
				 * são retornadas que possuem menos elementos
				 */
				else if (linha.select("td").size() == 8) {
					parserComponente(linha.select("td"), periodoOferta);
				}
			}
		}
		return info;
	}

	/**
	 * 
	 * @param colunasComponente,
	 *            representa uma integração curricular específica do arquivo
	 *            HTML com todas as informaçẽos necessárias para criar uma nova
	 *            disciplina no banco quanto uma nova integração curricular
	 * @param periodoOferta,
	 *            corresponde ao semestre que a integração curricular é
	 *            ofertado. Esta informação vem de um elemento da tabela de
	 *            componentes
	 */
	private void parserComponente(Elements colunasComponente, int periodoOferta) {

		Disciplina disciplina = new Disciplina();
		disciplina = disciplinaService.getDisciplinaByCodigo(colunasComponente.get(0).text());
		int chPratica, chTeorica;
		String aux;

		if (disciplina == null) {
			int valorParada, valorParada2 = 0;

			disciplina = new Disciplina();
			disciplina.setCodigo(colunasComponente.get(0).text());
			valorParada = colunasComponente.get(1).text().indexOf(" - ");
			System.out.println(colunasComponente.get(1).text().substring(0, valorParada));
			disciplina.setNome(removeAcentos(colunasComponente.get(1).text().substring(0, valorParada)));
			disciplina.setTipo(tipoDisciplina(colunasComponente.get(3).text()));
			valorParada = colunasComponente.get(2).text().indexOf("aula");
			// aux = colunasComponente.get(2).text().substring(0, valorParada -
			// 1).replaceAll("h", "");
			// chTeorica = Integer.parseInt(aux);
			disciplina.setChTeorica(trasnformaStringInteger(
					colunasComponente.get(2).text().substring(0, valorParada - 1).replaceAll("h", "")));

			if ((colunasComponente.get(3).text().equals("DISCIPLINA"))) {

				valorParada = colunasComponente.get(2).text().indexOf("cr)");
				valorParada2 = colunasComponente.get(2).text().indexOf("lab");
				//aux = colunasComponente.get(2).text().substring(valorParada + 4, valorParada2 - 1).replaceAll("h", "");
				//chPratica = Integer.parseInt(aux);
				disciplina.setChPratica(trasnformaStringInteger(colunasComponente.get(2).text().substring(valorParada + 4, valorParada2 - 1).replaceAll("h", "")));
			} else {
				valorParada2 = colunasComponente.get(2).text().indexOf("lab");
				// aux = colunasComponente.get(2).text().substring(valorParada +
				// 5, valorParada2 - 1).replaceAll("h", "");
				// chPratica = Integer.parseInt(aux);
				disciplina.setChPratica(trasnformaStringInteger(colunasComponente.get(2).text()
						.substring(valorParada + 5, valorParada2 - 1).replaceAll("h", "")));
			}
			disciplinaService.save(disciplina);

		}
		adicionarIntegracaoCurricular(disciplina, periodoOferta, colunasComponente.get(4).text(),
				colunasComponente.get(5).text(), colunasComponente.get(6).text(), colunasComponente.get(7).text());

	}

	private void adicionarIntegracaoCurricular(Disciplina disciplina, int periodoOferta, String natureza,
			String preRequisitos, String equivalencias, String coRequisitos) {
		IntegracaoCurricular integracaoCurricular = new IntegracaoCurricular();
		integracaoCurricular.setDisciplina(disciplina);
		integracaoCurricular.setEstruturaCurricular(estruturaCurricular);
		integracaoCurricular.setNatureza(naturezaIntegracao(natureza));
		integracaoCurricular.setSemestreOferta(periodoOferta);
		integracaoCurricular.setQuantidadeAlunos(50);
		integracaoCurricularService.save(integracaoCurricular);
	}

	private Integer trasnformaStringInteger(String valor) {
		if (valor.length() > 0) {
			return Integer.parseInt(valor.replaceAll(" ", ""));
		} else {
			return 0;
		}
	}

	private String tipoDisciplina(String tipoDisciplina) {
		if (tipoDisciplina.equals("DISCIPLINA")) {
			return "DISCIPLINA";
		} else if (tipoDisciplina.equals("ATIVIDADES COMPLEMENTARES")) {
			return "ATIVIDADES COMPLEMENTARES";
		} else if (tipoDisciplina.equals("ESTÁGIO")) {
			return "ESTAGIO";
		} else if (tipoDisciplina.equals("TRABALHO DE CONCLUSÃO DE CURSO")) {
			return "TCC";
		}
		return "";
	}

	private String naturezaIntegracao(String natureza) {
		if (natureza.equals("OBRIGATÓRIA")) {
			return "OBRIGATORIA";
		} else if (natureza.equals("OPTATIVA")) {
			return "OPTATIVA";
		}
		return "";
	}

	private String removeAcentos(String string) {
		if (string != null) {
			string = Normalizer.normalize(string, Normalizer.Form.NFD);
			string = string.replaceAll("[^\\p{ASCII}]", "");
		}
		return string;
	}

}