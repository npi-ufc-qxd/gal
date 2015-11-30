package br.ufc.npi.gal.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import br.ufc.npi.gal.repository.IntegracaoCurricularRepository;
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
	private IntegracaoCurricularRepository integracaoCurricularRepository;
	@Inject
	private IntegracaoCurricularService integracaoCurricularService;
	private EstruturaCurricular estruturaCurricular;
	private List<String> disciplinasCurriculo;
	private HashMap<String, String> disciplinasPreRequisitos;

	public ParserEstruturaCurricularServiceImpl() {
		estruturaCurricular = new EstruturaCurricular();
		disciplinasCurriculo = new ArrayList<String>();
		disciplinasPreRequisitos = new HashMap<String, String>();
	}

	/**
	 * 
	 */
	@Override
	public List<String> processarArquivo(MultipartFile multipartFile, Integer id) {
		File fileHtml = new File("estrutura.html");
		try {
			multipartFile.transferTo(fileHtml);
			docFromHtml = Jsoup.parse(fileHtml, null, "");
			List<String> statusParser = parserCurriculo(id);
			if (statusParser != null)
				return statusParser;
		} catch (IllegalStateException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return null;

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
		novaEstrutura.setAnoSemestre(estrutura.get(0));
		novaEstrutura.setMatrizCurricular(estrutura.get(1));
		novaEstrutura.setUnidadeVinculacao(estrutura.get(2));
		novaEstrutura.setMunicipio(estrutura.get(3));
		novaEstrutura.setSemestreEntradaVigor(estrutura.get(4).replaceAll("\\ ", ""));
		novaEstrutura.setChOptMinima(estrutura.get(5));

		int idMinino, idMedio, idMaximo;

		idMinino = estrutura.get(11).indexOf("Mínimo");
		idMedio = estrutura.get(11).indexOf("Médio");
		idMaximo = estrutura.get(11).indexOf("Máximo");
		novaEstrutura.setPrazoConclusaoMinimo(estrutura.get(11).substring(idMinino + 6, 8));
		novaEstrutura.setPrazoConclusaoMedio(estrutura.get(11).substring(idMedio + 5, 16));
		novaEstrutura.setPrazoConclusaoMaximo(estrutura.get(11).substring(idMaximo + 6, estrutura.get(11).length()));

		idMinino = estrutura.get(12).indexOf("Mínima");
		idMedio = estrutura.get(12).indexOf("Média");
		idMaximo = estrutura.get(12).indexOf("Máxima");
		novaEstrutura.setChPeriodoMinimo(estrutura.get(12).substring(idMinino + 6, idMedio - 2));
		novaEstrutura.setChPeriodoMedio(estrutura.get(12).substring(idMedio + 5, idMaximo - 2));
		novaEstrutura.setChPeriodoMaximo(estrutura.get(12).substring(idMaximo + 6, estrutura.get(12).length() - 1));
		novaEstrutura.setCurso(curso);
		System.out.println(novaEstrutura.getCurso().getId());
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
		verificaExistenciaIntegracao();
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

		System.out.println(colunasComponente.get(0).text() + " | " + colunasComponente.get(1).text() + " | "
				+ colunasComponente.get(2).text() + " | " + colunasComponente.get(3).text() + " | "
				+ colunasComponente.get(4).text() + " | " + colunasComponente.get(6).text() + " | "
				+ colunasComponente.get(7).text() + " | " + colunasComponente.get(6).text());

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

		}
		disciplinasCurriculo.add(disciplina.getCodigo());
		disciplinasPreRequisitos.put(disciplina.getCodigo(), colunasComponente.get(5).text());
		adicionarIntegracaoCurricular(disciplina, periodoOferta, colunasComponente.get(4).text(),
				colunasComponente.get(5).text(), colunasComponente.get(6).text(), colunasComponente.get(7).text());

	}

	private void adicionarIntegracaoCurricular(Disciplina disciplina, int periodoOferta, String natureza,
			String preRequisitos, String equivalencias, String coRequisitos) {
		IntegracaoCurricular integracaoCurricular = new IntegracaoCurricular();
		integracaoCurricular.setDisciplina(disciplina);
		integracaoCurricular.setEstruturaCurricular(estruturaCurricular);
		integracaoCurricular.setNatureza(natureza);
		integracaoCurricular.setSemestreOferta(periodoOferta);
		integracaoCurricular.setQuantidadeAlunos(50);
		System.out.println(integracaoCurricular.toString());
		integracaoCurricularService.save(integracaoCurricular);
	}

	/**
	 * Este método será um método genérico a ser utilizado para a existência de
	 * quivalências, co- e pré-requisitos entre integrações curriculares
	 * 
	 * @param consulta,
	 *            string que vem do HTML @return, deve retornar a lista de
	 *            integrações referente a uma outra integração curricular
	 */
	private void verificaExistenciaIntegracao() {
		List<IntegracaoCurricular> listIntegracao = new ArrayList<IntegracaoCurricular>();
		int i = 0;
		Disciplina disciplinaIntegracao = new Disciplina();
		String codigoIntegracao = "";
		String consulta = "";
		for (String codigoDisciplina : disciplinasCurriculo) {
			consulta = disciplinasPreRequisitos.get(codigoDisciplina);
			consulta = consulta.replaceAll("OU", "");
			consulta = consulta.replaceAll("E", "");
			consulta = consulta.replace('(', ' ');
			consulta = consulta.replace(')', ' ');
			while (consulta.length() > i) {
				if (consulta.charAt(i) != ' ') {
					codigoIntegracao += consulta.charAt(i);
					i++;
				} else {
					codigoIntegracao = codigoIntegracao.replaceAll(" ", "");
					disciplinaIntegracao = disciplinaService.getDisciplinaByCodigo(codigoIntegracao);
					if (disciplinaIntegracao != null) {
						listIntegracao.add(integracaoCurricularService.getIntegracaoByIdDisciplinaIdCurriculo(
								disciplinaIntegracao.getId(), estruturaCurricular.getId()));
					}
					codigoIntegracao = "";
					i += 2;
				}
			}
			vinculaIntegracaoCurricular(codigoDisciplina, listIntegracao);
			i = 0;
			codigoIntegracao = "";
		}

	}

	private void vinculaIntegracaoCurricular(String idIntegracao, List<IntegracaoCurricular> vinculacoes) {
		IntegracaoCurricular integracao = integracaoCurricularRepository.getIntegracao(
				disciplinaService.getDisciplinaByCodigo(idIntegracao).getId(), estruturaCurricular.getId());
		integracao.setPreRequisitos(vinculacoes);
		integracaoCurricularService.save(integracao);
	}

}