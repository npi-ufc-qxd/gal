package br.ufc.npi.gal.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.web.multipart.MultipartFile;

import br.ufc.npi.gal.exception.ArquivoNaoSuportadoException;
import br.ufc.npi.gal.model.AcervoDocumento;
import br.ufc.npi.gal.model.Exemplar;
import br.ufc.npi.gal.model.ExemplarConflitante;
import br.ufc.npi.gal.model.Titulo;
import br.ufc.npi.gal.repository.AcervoDocumentoRepository;
import br.ufc.npi.gal.repository.ExemplarConflitanteRepository;
import br.ufc.npi.gal.repository.ExemplarRepository;
import br.ufc.npi.gal.repository.TituloRespository;
import br.ufc.npi.gal.service.AcervoService;
import br.ufc.npi.gal.service.ValidadorXSL;
import br.ufc.quixada.npi.service.impl.GenericServiceImpl;
import jxl.Sheet;
import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.read.biff.BiffException;

@Named
public class AcervoServiceImpl extends GenericServiceImpl<ExemplarConflitante> implements AcervoService {
	private static final int COLUNA_COD_EXEMPLAR = 2;
	private static final int COLUNA_TIPO = 26;
	//CAMPOS DO NOME TITULO
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
	
	private static final int MIDIA_FISICA = 0;
	private static final int MIDIA_DIGITAL = 1;
	private static final String ECLIPSE_ENCODE = "Cp1252";
	
	@Inject
	private AcervoDocumentoRepository acervoDocumentoRepository;
	
	@Inject
	private ExemplarConflitanteRepository exemplarConflitanteReposiroty;
	@Inject
	private TituloRespository tituloRepository;
	@Inject
	private ExemplarRepository exemplarRepository;
	
	@Override 
	public void registrarAtualizacao(AcervoDocumento acervoDocumento){
		acervoDocumentoRepository.save(acervoDocumento);
	}
	
	@Override
	public void processarArquivo(MultipartFile multipartFile) throws ArquivoNaoSuportadoException {
		try {
			
			File arquivo = new File("temp.xls");
			multipartFile.transferTo(arquivo);
			
			Workbook workbook = gerarWorkBook(arquivo);
			Sheet sheet = workbook.getSheet(0);
			
			ValidadorXSL validadorXSL = new ValidadorXSLImpl();
			boolean arquivoValido = validadorXSL.dadosValidos(sheet);
			if (arquivoValido) {
				List<Exemplar> exemplares = arquivoParaLista(sheet);
				realizarAtualização(exemplares);
			}else {
				throw new ArquivoNaoSuportadoException("Os dados do arquivo são inválidos.");
			}
			
			workbook.close();
		} catch (IllegalStateException e) {
			e.printStackTrace();
			throw new ArquivoNaoSuportadoException(e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
			throw new ArquivoNaoSuportadoException(e.getMessage());
		} catch (BiffException e) {
			e.printStackTrace();
			throw new ArquivoNaoSuportadoException(e.getMessage());
		}		
	}

	public List<Exemplar> arquivoParaLista(Sheet sheet) {
		List<Exemplar> relatorioDeExemplares = new ArrayList<Exemplar>();
		int linhas = sheet.getRows();
		ExemplarConflitante exemplarConflitante = new ExemplarConflitante();
		
		for (int linha = 1; linha < linhas; linha++) {
			
			if(sheet.getCell(COLUNA_TIPO,linha).getContents().equals(MIDIA_FISICA)) {
				//TODO proximo passo. e fornecer o getbytes para o controller.
				exemplarConflitante = extrairExemplar(sheet, linha);
				exemplarConflitante.setLinha(linha);
				
				//exemplarConflitante = validarLinha(sheet,i);
				
				if(exemplarConflitante.getDescricaoErro().isEmpty()){
					relatorioDeExemplares.add(formatarExemplar(sheet,linha));
				}else{
					adicionarConflito(exemplarConflitante);
				}
			}
		}
		return relatorioDeExemplares;
	}
	
	private void realizarAtualização(List<Exemplar> listaDeExemplares) {
		for (Exemplar exemplar : listaDeExemplares) {
			//se ISBN ja existe no banco cadastra apenas o exemplar
			if(tituloRepository.getTituloByIsbn(exemplar.getTitulo().getIsbn()) != null){
				if (exemplarRepository.getExemplarByCodigo(exemplar.getCodigoExemplar()) == null) {
					exemplar.setTitulo(tituloRepository.getTituloByIsbn(exemplar.getTitulo().getIsbn()));
					exemplarRepository.save(exemplar);
				}
				
			}
			//se não, cadastrar titulo primeiro e o exemplar dps
			else{
				tituloRepository.save(exemplar.getTitulo());
				try{
					exemplarRepository.save(exemplar);
				}catch(Exception e){
					System.err.println("Exemplar ja existente! Código do exemplar: " +exemplar.getCodigoExemplar());
				}
			}
		}
	}
	
	private void realizarAtualização(Exemplar exemplar) {
		//se ISBN ja existe no banco cadastra apenas o exemplar
		if(tituloRepository.getTituloByIsbn(exemplar.getTitulo().getIsbn()) != null){
			if (exemplarRepository.getExemplarByCodigo(exemplar.getCodigoExemplar()) == null) {
				exemplar.setTitulo(tituloRepository.getTituloByIsbn(exemplar.getTitulo().getIsbn()));
				exemplarRepository.save(exemplar);
			}
			
		}
		//se não, cadastrar titulo primeiro e o exemplar dps
		else{
			tituloRepository.save(exemplar.getTitulo());
			try{
				exemplarRepository.save(exemplar);
			}catch(Exception e){
				System.err.println("Exemplar ja existente! Código do exemplar: " +exemplar.getCodigoExemplar());
			}
		}
	}
	
	private void adicionarConflito(ExemplarConflitante conflito) {
		try{
			ExemplarConflitante aux = exemplarConflitanteReposiroty.getExemplarConflitanteByCodigo(conflito.getCodigoExemplar());
			if (aux!=null) {
				//salvar verificar e rever exemplares conflitantes
				if (conflito.equals(aux)==false) {
					conflito.setDescricaoErro(conflito.getDescricaoErro()+ " Codigo de exemplar duplicado");
					exemplarConflitanteReposiroty.save(conflito);
				}
			} else {
				exemplarConflitanteReposiroty.save(conflito);
			}
		}catch(Exception e){
			System.err.println("Exemplar ja existente! Código do exemplar: " +conflito.getCodigoExemplar());
		}
	}

	/*
	private ExemplarConflitante validarLinha(Sheet sheet, int i) {
		ExemplarConflitante exemplarConflitante = new ExemplarConflitante();
		String erros = new String();
		
		/* Refatorado --> extrairTipoExemplar
		String validadorTipo = validacaoDeTipo(sheet.getCell(COLUNA_TIPO,i).getContents());
		if(validadorTipo.equals("valido")){
			exemplarConflitante.setTipo(sheet.getCell(COLUNA_TIPO,i).getContents());
		}else{
			exemplarConflitante.setTipo(sheet.getCell(COLUNA_TIPO,i).getContents());
			erros = validadorTipo + ",";
		}
		*/
			
		/* Refatorado --> extrairNomeTitulo
		if(!formatarNomeTituloVerificacao(sheet,i).isEmpty()){
			exemplarConflitante = preencherCamposNomeTitulo(sheet,i,exemplarConflitante);
		}else {
			exemplarConflitante = preencherCamposNomeTitulo(sheet,i,exemplarConflitante);
			erros +=" Nome do título não especificado, ";
		}
		*/
		
		/* Refatorado --> extrairCodigoExemplar
		String validadorCodExemplar = formatarCodigoExemplar(sheet.getCell(COLUNA_COD_EXEMPLAR,i).getContents());
		if(validadorCodExemplar.equals("valido")){
			exemplarConflitante.setCodigoExemplar(sheet.getCell(COLUNA_COD_EXEMPLAR,i).getContents());
			//if (exemplarRepository.getExemplarByCodigo(exemplarConflitante.getCodigoExemplar())!=null) {
				//erros+= " codigo de exemplar já existe no banco,";
			//}
		}else{
			exemplarConflitante.setCodigoExemplar(sheet.getCell(COLUNA_COD_EXEMPLAR,i).getContents());
			erros+= " "+validadorCodExemplar + ", ";
		}
		*/
		
		/* Refatorado --> extrairISBN
		String isbn = extrairISBNDaCelula(sheet.getCell(COLUNA_ISBN,i).getContents());
		String validadorIsbn = formatarIsbn(isbn);
		if(validadorIsbn.equals("valido")){
			exemplarConflitante.setIsbn(isbn);
		}else{
			exemplarConflitante.setIsbn(isbn);
			erros+=" "+validadorIsbn+ ", ";
		}
		
		exemplarConflitante.setDescricaoErro(erros);
		return exemplarConflitante;
		
	}*/
	

	private String formatarIsbn(String contents) {
		if(contents.matches("([0-9]{7,13})") || contents.matches("[0-9]{7,13}[X|x]")) {
			return "valido";
		}
		return "ISBN inválido";
	}

	private ExemplarConflitante extrairExemplar(Sheet sheet, int linha){
		StringBuilder notificacao = new StringBuilder();
		ExemplarConflitante exemplar = new ExemplarConflitante();
		
		extrairCodigoExemplar(exemplar, sheet, linha, notificacao);
		extrairTipoExemplar(exemplar, sheet, linha, notificacao);
		extrairNomeTituloExemplar(exemplar, sheet, linha, notificacao);
		extrairISBNExemplar(exemplar, sheet, linha, notificacao);
		exemplar.setDescricaoErro(notificacao.toString());
		
		return exemplar;
	}
	
	private void extrairISBNExemplar(ExemplarConflitante exemplar, Sheet sheet, int linha, StringBuilder notificacao) {
		String isbn = extrairISBNDaCelula(sheet.getCell(COLUNA_ISBN,linha).getContents());
		exemplar.setIsbn(isbn);
		if (!isbn.matches("([0-9]{7,13})") && !isbn.matches("[0-9]{7,13}[X|x]")) {
			notificacao.append("ISBN inválido");
		}
	}

	private void extrairNomeTituloExemplar(ExemplarConflitante exemplar, Sheet sheet, int linha, StringBuilder notificacao) {
		exemplar.setAutor(sheet.getCell(COLUNA_AUTOR,linha).getContents());
		if (exemplar.getAutor().isEmpty()) {
			notificacao.append("Autor não informado. ");
		}
		exemplar.setEdicao(sheet.getCell(COLUNA_EDICAO,linha).getContents());
		if (exemplar.getEdicao().isEmpty()) {
			notificacao.append("Ediçao não informada. ");
		}
		exemplar.setPagina(sheet.getCell(COLUNA_PAGINA,linha).getContents());
		if (exemplar.getPagina().isEmpty()) {
			notificacao.append("Página não informada. ");
		}
		exemplar.setPublicador(sheet.getCell(COLUNA_PUBLICADOR,linha).getContents());
		if (exemplar.getPublicador().isEmpty()) {
			notificacao.append("Publicador não informado. ");
		}
		exemplar.setRefArtigo(sheet.getCell(COLUNA_REF_ARTIGO,linha).getContents());
		if (exemplar.getRefArtigo().isEmpty()) {
			notificacao.append("Ref. Artigo não informado. ");
		}
		exemplar.setSubTitulo(sheet.getCell(COLUNA_SUB_TITULO,linha).getContents());
		if (exemplar.getSubTitulo().isEmpty()) {
			notificacao.append("SubTitulo não informado. ");
		}
		exemplar.setTitulo(sheet.getCell(COLUNA_TITULO,linha).getContents());
		if (exemplar.getTitulo().isEmpty()) {
			notificacao.append("Titulo não informado. ");
		}
		exemplar.setTitulo_n(sheet.getCell(COLUNA_TITULO_N,linha).getContents());
		if (exemplar.getTitulo_n().isEmpty()) {
			notificacao.append("Titulo_N não informado. ");
		}
		exemplar.setTituloRevista(sheet.getCell(COLUNA_TITULO_REVISTA,linha).getContents());
		if (exemplar.getTituloRevista().isEmpty()) {
			notificacao.append("Titulo Revista não informado. ");
		}
	}

	private void extrairCodigoExemplar(ExemplarConflitante exemplar, Sheet sheet, int linha, StringBuilder notificacao) {
		String codigo = sheet.getCell(COLUNA_COD_EXEMPLAR,linha).getContents();
		exemplar.setCodigoExemplar(codigo);
		if (codigo.isEmpty()) {
			notificacao.append("Codigo do exemplar não informado. ");
		} else if(!codigo.matches("[0-9]+")){
			notificacao.append("Código do exemplar inválido. ");
		}
	}
	
	private void extrairTipoExemplar(ExemplarConflitante exemplar, Sheet sheet, int linha, StringBuilder notificacao) {
		String tipo = sheet.getCell(COLUNA_TIPO,linha).getContents();
		exemplar.setTipo(tipo);
		if (tipo.isEmpty()) {
			notificacao.append("Tipo do exemplar não informado. ");
		} else if(tipo.equals(MIDIA_DIGITAL)){
			notificacao.append("Tipo do exemplar virtual. ");
		} else if(!tipo.equals(MIDIA_FISICA)){
			notificacao.append("Tipo do exemplar inválido. ");
		}
	}

	private String validacaoDeTipo(String tipo) {
		if(tipo.equals("0") ){
			return "valido";
		}else if(tipo.equals("")){
			return "Tipo de exemplar não especificado";
		} else if (tipo.equals("1")) {
			return "tipo virtual";
		}
		return "Tipo de exemplar inválido";
	}

	private String extrairISBNDaCelula(String isbnForaDeFormato) {
		isbnForaDeFormato = isbnForaDeFormato.replaceAll("\\.", "");
		isbnForaDeFormato = isbnForaDeFormato.replaceAll("ISBN", "");
		isbnForaDeFormato = isbnForaDeFormato.replaceAll("\\(.+", "");
		isbnForaDeFormato = isbnForaDeFormato.replaceAll("(v1)", "");
		isbnForaDeFormato = isbnForaDeFormato.replaceAll("(v2)", "");
		isbnForaDeFormato = isbnForaDeFormato.replaceAll("\\s+", "");
		isbnForaDeFormato = isbnForaDeFormato.replaceAll("-", "");
		isbnForaDeFormato = isbnForaDeFormato.replaceAll("\\[.+", "");
		isbnForaDeFormato = isbnForaDeFormato.replaceAll(" ", "");
		return isbnForaDeFormato;
	
	}

	private String formatarNomeTitulo(Sheet sheet, int i) {
		// concatena os campos que compoem o titulo
		return sheet.getCell(COLUNA_AUTOR, i).getContents() + " "+sheet.getCell(COLUNA_TITULO, i).getContents() +" "+ sheet.getCell(COLUNA_TITULO_N, i).getContents()+" "
				+sheet.getCell(COLUNA_SUB_TITULO,i).getContents() +" "+sheet.getCell(COLUNA_TITULO_REVISTA, i).getContents() +" "+sheet.getCell(COLUNA_PAGINA,i).getContents()
				+" "+sheet.getCell(COLUNA_REF_ARTIGO,i).getContents() +" "+sheet.getCell(COLUNA_EDICAO,i).getContents() +" "+sheet.getCell(COLUNA_PUBLICADOR,i).getContents();
	}
	
	/*
	private String formatarNomeTituloVerificacao(Sheet sheet, int i) {
		// concatena os campos que compoem o titulo
		return sheet.getCell(COLUNA_AUTOR, i).getContents() + sheet.getCell(COLUNA_TITULO, i).getContents() + sheet.getCell(COLUNA_TITULO_N, i).getContents() + 
				sheet.getCell(COLUNA_SUB_TITULO,i).getContents() + sheet.getCell(COLUNA_TITULO_REVISTA, i).getContents() + sheet.getCell(COLUNA_PAGINA,i).getContents()
				+ sheet.getCell(COLUNA_REF_ARTIGO,i).getContents() + sheet.getCell(COLUNA_EDICAO,i).getContents() + sheet.getCell(COLUNA_PUBLICADOR,i).getContents();
	}
	*/
	private String formatarNomeTitulo(ExemplarConflitante exemplar) {
		return exemplar.getAutor() + " " + exemplar.getTitulo() + " " + exemplar.getTitulo_n() + " " +
				exemplar.getSubTitulo() + " " + exemplar.getTituloRevista() + " " + exemplar.getPagina() + " " +
				exemplar.getRefArtigo() + " " + exemplar.getEdicao() + " " + exemplar.getPublicador();
	}
	
	private String formatarNomeTituloVerificacao(ExemplarConflitante exemplar) {
		return exemplar.getAutor() + exemplar.getTitulo() + exemplar.getTitulo_n() + exemplar.getSubTitulo() + 
			   exemplar.getTituloRevista() + exemplar.getPagina() + exemplar.getRefArtigo() + 
			   exemplar.getEdicao() + exemplar.getPublicador();
	}

	private Exemplar formatarExemplar(Sheet sheet, int i) {
		Titulo titulo = new Titulo();
		titulo.setIsbn(extrairISBNDaCelula(sheet.getCell(COLUNA_ISBN, i).getContents()));
		titulo.setAutor(sheet.getCell(COLUNA_AUTOR, i).getContents());
		titulo.setTitulo(sheet.getCell(COLUNA_TITULO, i).getContents());
		titulo.setTitulo_n(sheet.getCell(COLUNA_TITULO_N, i).getContents());
		titulo.setTituloRevista(sheet.getCell(COLUNA_TITULO_REVISTA, i).getContents());
		titulo.setSubTitulo(sheet.getCell(COLUNA_SUB_TITULO,i).getContents());
		titulo.setPagina(sheet.getCell(COLUNA_PAGINA,i).getContents());
		titulo.setEdicao(sheet.getCell(COLUNA_EDICAO,i).getContents());
		titulo.setRefArtigo(sheet.getCell(COLUNA_REF_ARTIGO,i).getContents());
		titulo.setPublicador(sheet.getCell(COLUNA_PUBLICADOR,i).getContents());
		titulo.setNome(formatarNomeTitulo(sheet,i));
		titulo.setTipo("Físico");
		Exemplar exemplar = new Exemplar();
		exemplar.setTitulo(titulo);
		exemplar.setCodigoExemplar(sheet.getCell(COLUNA_COD_EXEMPLAR, i).getContents());
		return exemplar;
	}
	
	private Exemplar formatarExemplar(ExemplarConflitante exemplarConflitante) {
		Exemplar exemplar = new Exemplar();
		Titulo titulo = new Titulo();
		titulo.setIsbn(exemplarConflitante.getIsbn());
		titulo.setNome(formatarNomeTitulo(exemplarConflitante));
		titulo.setAutor(exemplarConflitante.getAutor());
		titulo.setTitulo(exemplarConflitante.getTitulo());
		titulo.setTitulo_n(exemplarConflitante.getTitulo_n());
		titulo.setTituloRevista(exemplarConflitante.getTituloRevista());
		titulo.setSubTitulo(exemplarConflitante.getSubTitulo());
		titulo.setPagina(exemplarConflitante.getPagina());
		titulo.setEdicao(exemplarConflitante.getEdicao());
		titulo.setRefArtigo(exemplarConflitante.getRefArtigo());
		titulo.setPublicador(exemplarConflitante.getPublicador());
		titulo.setTipo("Físico");
		exemplar.setTitulo(titulo);
		exemplar.setCodigoExemplar(exemplarConflitante.getCodigoExemplar());
		return exemplar;
	}
	
	/*
	private ExemplarConflitante preencherCamposNomeTitulo(Sheet sheet, int i,
			ExemplarConflitante exemplarConflitante) {
		exemplarConflitante.setAutor(sheet.getCell(COLUNA_AUTOR,i).getContents());
		exemplarConflitante.setEdicao(sheet.getCell(COLUNA_EDICAO,i).getContents());
		exemplarConflitante.setPagina(sheet.getCell(COLUNA_PAGINA,i).getContents());
		exemplarConflitante.setPublicador(sheet.getCell(COLUNA_PUBLICADOR,i).getContents());
		exemplarConflitante.setRefArtigo(sheet.getCell(COLUNA_REF_ARTIGO,i).getContents());
		exemplarConflitante.setSubTitulo(sheet.getCell(COLUNA_SUB_TITULO,i).getContents());
		exemplarConflitante.setTitulo(sheet.getCell(COLUNA_TITULO,i).getContents());
		exemplarConflitante.setTitulo_n(sheet.getCell(COLUNA_TITULO_N,i).getContents());
		exemplarConflitante.setTituloRevista(sheet.getCell(COLUNA_TITULO_REVISTA,i).getContents());
		return exemplarConflitante;
	}
	*/
	private String formatarCodigoExemplar(String contents) {
		if(contents.isEmpty()){
			return "Código do exemplar não especificado";
		}else if(!contents.matches("[0-9]+")){
			return "Código do exemplar inválido";
		}else
			return "valido";
	}
	
	public boolean submeterExemplarConflitante(ExemplarConflitante exemplarConflitante) {
		exemplarConflitante.setDescricaoErro("");
		String erros = new String();
		
		String validadorTipo = validacaoDeTipo(exemplarConflitante.getTipo());
		if(!validadorTipo.equals("valido")){
			erros = validadorTipo;
		}
		
		String validadorCodExemplar = formatarCodigoExemplar(exemplarConflitante.getCodigoExemplar());
		if(!validadorCodExemplar.equals("valido")){
			erros+= "; "+validadorCodExemplar;
		} else {			
			if (exemplarRepository.getExemplarByCodigo(exemplarConflitante.getCodigoExemplar())!=null) {
				erros+= " codigo de exemplar já existe no banco,";
			}
		}
		
		String isbn = extrairISBNDaCelula(exemplarConflitante.getIsbn());
		String validadorIsbn = formatarIsbn(isbn);
		if(!validadorIsbn.equals("valido")){
			erros+="; "+validadorIsbn;
		}
		
		String titulo = formatarNomeTituloVerificacao(exemplarConflitante);
		if (titulo.isEmpty()) {
			erros+= "; " + "Nome do título não especificado";
		}
		
		exemplarConflitante.setDescricaoErro(erros);
		if(exemplarConflitante.getDescricaoErro().equals("")) {
			Exemplar exemplar = formatarExemplar(exemplarConflitante);
			realizarAtualização(exemplar);
			exemplarConflitanteReposiroty.delete(exemplarConflitante);
			return true;
		} else {
			exemplarConflitanteReposiroty.update(exemplarConflitante);
			return false;
		}
	}

	private Workbook gerarWorkBook(File planilha) throws BiffException, IOException{
		WorkbookSettings configuracao = new WorkbookSettings();
		configuracao.setEncoding(ECLIPSE_ENCODE);
		return Workbook.getWorkbook(planilha,configuracao);
	}

}
