<!--
//Bloco de c?digo para esconder e mostra form
var Ver4 = parseInt(navigator.appVersion) >= 4
var IE4 = ((navigator.userAgent.indexOf("MSIE") != -1) && Ver4)
var block = "formulario";
function esconde() {	document.form.style.visibility = "hidden" }
function mostra() { document.form.style.visibility = "visible" }
//Bloco de c?digo para esconder e mostra form

var da = (document.all) ? 1 : 0;
var pr = (window.print) ? 1 : 0;
var mac = (navigator.userAgent.indexOf("Mac") != -1);

function printPage()
{
  if (pr) // NS4, IE5
    window.print()
  else if (da && !mac) // IE4 (Windows)
    vbPrintPage()
  else // other browsers
    alert("Desculpe seu browser n?o suporta esta fun??o. Por favor utilize a barra de trabalho para imprimir a p?gina.");
  return false;
}

/*
 * In�cio da Defini��o de Teclas Especiais
 * @author David Pereira
 * @date   26/07/2006
 */
Event.KEY_SHIFT = 16;
Event.KEY_END 	= 35;
Event.KEY_HOME 	= 36;

var teclasEspeciais = new Array(
	Event.KEY_BACKSPACE,	// 08 - Backspace
	Event.KEY_TAB, 			// 09 - Tab
	Event.KEY_RETURN, 		// 13 - Enter
	Event.KEY_SHIFT,		// 16 - Shift
	Event.KEY_ESC,			// 27 - Esc
	Event.KEY_END, 			// 35 - End
	Event.KEY_HOME, 		// 36 - Home
	Event.KEY_LEFT, 		// 37 - Seta esquerda
	Event.KEY_UP, 			// 38 - Seta para cima
	Event.KEY_RIGHT, 		// 39 - Seta direita
	Event.KEY_DOWN, 		// 40 - Seta abaixo
	Event.KEY_DELETE  		// 46 - Delete
);

/* Fim da Defini��o de Teclas Especiais */



/**
 * Marca/desmarca todos os checkboxs do campo passado como par?metro.
 * Marca/desmarca apenas os checkboxs disabled = false
 *
 */
var checkflag = false;
function marcarTodosCheckbox(field) {
  if (field.length != undefined) {
  	for (i = 0; i < field.length; i++) {
  		if (field[i].disabled != true)
	  		field[i].checked = !checkflag;
  	}
  }
  else if (field.disabled != true) {
  	field.checked = !checkflag;
  }

  checkflag = !checkflag;
  return checkflag;
}

/**
  * Mascara cpf, pulando automanticamente para pr?ximo campo
  */
function formataCPF(campo, event, proximoCampoId) {
    var tecla = event.keyCode ? event.keyCode : event.charCode;
    
    if (teclasEspeciais.indexOf(tecla) != -1) {
    	return true;
    }
    
	if ( '0123456789'.indexOf(String.fromCharCode(tecla)) == -1 ) {
		return false;
	}
	
    var rExp = /[^\0-\9]|\-|\.|\//g;
    var vr = campo.value.replace(rExp, "")

  	vr = vr.replace( "/", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( "-", "" );

	var saida = vr.substring(0, 3);
	if (campo.value.length >= 3)
		saida += "." + vr.substring(3, 6);
	if (campo.value.length >= 5)
		saida +=  "." + vr.substring(6, 9);
	if (campo.value.length >= 9)
		saida +=  "-" + vr.substring(9, 11);

     campo.value = saida;

    if ((proximoCampoId != null) && (campo.value.length == 14))
       document.getElementById(proximoCampoId).focus();
}

function formataNumInteiro(campo,tammax,teclapres)
{

	var tecla = teclapres.keyCode;
	vr = campo.value;
	vr = vr.replace( "/", "" );
	vr = vr.replace( "/", "" );
	vr = vr.replace( ",", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	tam = vr.length;

	if (tam < tammax && tecla != 8){ tam = vr.length + 1 ; }

	if (tecla == 8 ){	tam = tam - 1 ; }

	if ( tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105 ){
		if ( tam <= 3 ){
	 		campo.value.value = vr ; }
	 	if ( (tam >= 4) && (tam <= 6) ){
	 		campo.value = vr.substr( 0, tam - 3) + '.' + vr.substr( tam - 3, tam ) ; }
	 	if ( (tam >= 7) && (tam <= 9) ){
	 		campo.value = vr.substr( 0, tam - 6 ) + '.' + vr.substr( tam - 6, 3 ) + '.' + vr.substr( tam - 3, tam ) ; }
	 	if ( (tam >= 10) && (tam <= 12) ){
	 		campo.value = vr.substr( 0, tam - 9 ) + '.' + vr.substr( tam - 9, 6 ) + '.' + vr.substr( tam - 6, 3 ) + '.' + vr.substr( tam - 3, tam ) ; }
	 	if ( (tam >= 13) && (tam <= 15) ){
	 		campo.value = vr.substr( 0, tam - 12 ) + '.' + vr.substr( tam - 12, 9 ) + '.' + vr.substr( tam - 9, 6 ) + '.' + vr.substr( tam - 6, 3 ) + '.' + vr.substr( tam - 3, tam ) ; }
	 	if ( (tam >= 16) && (tam <= 18) ){
	 		campo.value = vr.substr( 0, tam - 15 ) + '.' + vr.substr( tam - 15, 12 ) + '.' + vr.substr( tam - 12, 9 ) + '.' + vr.substr( tam - 9, 6 ) + '.' + vr.substr( tam - 6, 3 ) + '.' + vr.substr( tam - 3, tam ) ;}
	}
}

/**
  * Marcara cnpj, pulando automanticamente para pr?ximo campo
  */
function formataCNPJ(campo, event, proximoCampoId) {
    var tecla = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;

	// Enter, Backspace, TAB e delete
	if ((tecla == Event.KEY_RETURN)
		|| (tecla == Event.KEY_BACKSPACE)
		|| (tecla == Event.KEY_TAB)
		|| (tecla == Event.KEY_LEFT)
		|| (tecla == Event.KEY_RIGHT)
		|| (tecla == Event.KEY_DELETE)) {
		return true;
	}

    var vr = campo.value.replace(/[\D]+/g,"");
	var saida = vr.substring(0, 2);

	if (vr.length >= 2) {
		saida += "." + vr.substring(2, 5);
	}
	if (vr.length >= 4) {
		saida +=  "." + vr.substring(5, 8);
	}
	if (vr.length >= 8) {
		saida +=  "/" + vr.substring(8, 12);
	}
	if (vr.length >= 11) {
		saida +=  "-" + vr.substring(12, 14);
	}

    campo.value = saida;

    if ((proximoCampoId != null) && (campo.value.length == 18))
       document.getElementById(proximoCampoId).focus();
}

/**
  * Marcara cpf/cnpj, pulando automanticamente para pr?ximo campo.
  * Depende do tamanho da string passada, escolhe se CPF ou se CNPJ
  */
function formataCpfCnpj(campo, event, proximoCampoId) {

	if (campo.value.length < 15){
		formataCPF(campo, event, null);
	}else{
		formataCNPJ(campo, event, proximoCampoId)
	}
}

/**
  * Marcara para CEP, pulando automanticamente para pr?ximo campo
  */
function formataCEP(campo, event, proximoCampoId)
{
    var tecla = (event!=null)? event.keyCode: 0;

	if ( ((tecla < 48) || (tecla > 57))  &&
		 ((tecla < 96) || (tecla > 105)) &&
		 (tecla != 0) )

    var rExp = /[^\0-\9]|\-|\./g;
    var vr = campo.value.replace(rExp, "")
    vr = vr.replace( "-", "" );

	var saida = vr.substring(0, 5);
	if (campo.value.length >= 5)
		saida += "-" + vr.substring(5, 8);

    campo.value = saida;

    if ((proximoCampoId != null) && (campo.value.length == 9))
       document.getElementById(proximoCampoId).focus();
}

/**
  * Marcara para TELEFONE, pulando automanticamente para pr?ximo campo
  */
function formataTelefone(campo, event, proximoCampoId)
{
    var tecla = (event!=null)? event.keyCode: 0;

	if ( ((tecla < 48) || (tecla > 57))  &&
		 ((tecla < 96) || (tecla > 105)) &&
		 (tecla != 0) )

    var rExp = /[^\0-\9]|\-|\./g;
    var vr = campo.value.replace(rExp, "")
    vr = vr.replace( "-", "" );

	var saida = vr.substring(0, 4);
	if (campo.value.length >= 4)
		saida += "-" + vr.substring(4, 9);

    campo.value = saida;

    if ((proximoCampoId != null) && (campo.value.length == 9))
       document.getElementById(proximoCampoId).focus();
}

// Fun??es utilizadas no menu para mudan?a da cor da linha
function on(src,corover)
{
if (!src.contains(event.fromElement))
 {
  src.bgColor = corover;
 }
}

function off(src,corout)
{
if (!src.contains(event.toElement))
 {
  src.bgColor = corout;
 }
}

//Fun??o que recebe um valor(float) e retornar? o valor formatado.
function formatarValor(valor,tammax) {
	var valorFormatado ="";
	vr = valor.toString();

	if(vr.indexOf(".") != -1){
		centavos = vr.substring(vr.indexOf(".")+1,vr.length);
		if(centavos.length == 1){
			vr = vr.concat("0");
		}
	}
	else{
		vr = vr.concat(".00");
	}

	vr = vr.replace( "/", "" );

	vr = vr.replace( "/", "" );
	vr = vr.replace( ",", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	vr = vr.replace( ".", "" );
	tam = vr.length;

	if ( tam <= 2 ){
 		valorFormatado = vr ; }
 	if ( (tam > 2) && (tam <= 5) ){
 		valorFormatado = vr.substr( 0, tam - 2 ) + ',' + vr.substr( tam - 2, tam ) ; }
 	if ( (tam >= 6) && (tam <= 8) ){
 		valorFormatado = vr.substr( 0, tam - 5 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
 	if ( (tam >= 9) && (tam <= 11) ){
 		valorFormatado = vr.substr( 0, tam - 8 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
 	if ( (tam >= 12) && (tam <= 14) ){
 		valorFormatado = vr.substr( 0, tam - 11 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ; }
 	if ( (tam >= 15) && (tam <= 17) ){
 		valorFormatado = vr.substr( 0, tam - 14 ) + '.' + vr.substr( tam - 14, 3 ) + '.' + vr.substr( tam - 11, 3 ) + '.' + vr.substr( tam - 8, 3 ) + '.' + vr.substr( tam - 5, 3 ) + ',' + vr.substr( tam - 2, tam ) ;}

 	return valorFormatado;
}





//Fun??o que escreve um valor por extenso
function extenso(form){
	c = form.elements[0].value;
	c = c.replace( ".", "" );
	c = c.replace( ".", "" );
	if(c == "" || c <= 0 || c >=10000000){form.elements[6].value="ZERO";return(-1);}
	else{
		if(c == 0){
			return(" ZERO ");}
		else{
			aUnid = new Array();
			aDezena = new Array();
			aCentena = new Array();
			aGrupo = new Array();
			aTexto = new Array();

			aUnid[1] = "UM ";
			aUnid[2] = "DOIS ";
			aUnid[3] = "TR?S ";
			aUnid[4] = "QUATRO ";
			aUnid[5] = "CINCO ";
			aUnid[6] = "SEIS ";
			aUnid[7] = "SETE ";
			aUnid[8] = "OITO ";
			aUnid[9] = "NOVE ";
			aUnid[10] = "DEZ ";
			aUnid[11] = "ONZE ";
			aUnid[12] = "DOZE ";
			aUnid[13] = "TREZE ";
			aUnid[14] = "QUATORZE ";
			aUnid[15] = "QUINZE ";
			aUnid[16] = "DEZESSEIS ";
			aUnid[17] = "DEZESETE ";
			aUnid[18] = "DEZOITO ";
			aUnid[19] = "DEZENOVE ";

			aDezena[1] = "DEZ ";
			aDezena[2] = "VINTE ";
			aDezena[3] = "TRINTA ";
			aDezena[4] = "QUARENTA ";
			aDezena[5] = "CINQ?ENTA ";
			aDezena[6] = "SESSENTA ";
			aDezena[7] = "SETENTA ";
			aDezena[8] = "OITENTA ";
			aDezena[9] = "NOVENTA ";

			aCentena[1] = "CENTO ";
			aCentena[2] = "DUZENTOS ";
			aCentena[3] = "TREZENTOS ";
			aCentena[4] = "QUATROCENTOS ";
			aCentena[5] = "QUINHENTOS ";
			aCentena[6] = "SEISCENTOS ";
			aCentena[7] = "SETECENTOS ";
			aCentena[8] = "OITOCENTOS ";
			aCentena[9] = "NOVECENTOS ";

			if(c.indexOf(".") != -1){
				aGrupo[4] = c.substring(c.indexOf(".")+1,c.length);
				aGrupo[4] = aGrupo[4].substring(0,2);
				ct = c.substring(0,c.indexOf("."));
			}
			else{
				if(c.indexOf(",") != -1)	{
					aGrupo[4] = c.substring(c.indexOf(",")+1,c.length);
					aGrupo[4] = aGrupo[4].substring(0,2);
					ct = c.substring(0,c.indexOf(","));
				}
				else{
					aGrupo[4] = "00";
					ct = c;
				}
				tt = "";
				for(f=0;f<(10-ct.length);f++){tt += "0";}
				tt += ct;
			}
			aGrupo[1] = tt.substring(1,4);
			aGrupo[2] = tt.substring(4,7);
			aGrupo[3] = tt.substring(7,10);
			aGrupo[4] = "0"+aGrupo[4];

			for(f=1;f<5;f++){
				cParte = aGrupo[f];
				if(parseFloat(cParte) < 10){nTamanho = 1;}
				else{
					if(parseFloat(cParte) < 100){nTamanho = 2;}
					else{
						if(parseFloat(cParte) < 1000){nTamanho = 3;}
						else{nTamanho = 0;}
					}
				}
				aTexto[f] = "";
				if(nTamanho == 3){
					if(cParte.substring(1,3) != "00"){
						aTexto[f] += aCentena[cParte.substring(0,1)] + "E ";
						nTamanho = 2;
					}
					else{
						if(cParte.substring(0,1) == "1"){aTexto[f] += "CEM ";}
						else{aTexto[f] += aCentena[cParte.substring(0,1)];}
					}
				}
				if(nTamanho == 2){
					if(parseFloat(cParte.substring(1,3)) < 10){aTexto[f] += aUnid[cParte.substring(2,3)];}
					else{
						if(parseFloat(cParte.substring(1,3)) < 20){aTexto[f] += aUnid[cParte.substring(1,3)];}
						else{
							aTexto[f] += aDezena[cParte.substring(1,2)];
							if(cParte.substring(2,3) != "0"){
								aTexto[f] += "E ";
								nTamanho = 1;
							}
						}
					}
				}
				if(nTamanho == 1){aTexto[f] += aUnid[cParte.substring(2,3)];}
			}
			if(parseFloat(aGrupo[1] + aGrupo[2] + aGrupo[3]) == 0 && parseFloat(aGrupo[4]) != 0){
				cFinal = aTexto[4];
				if(parseFloat(aGrupo[4]) == 1){cFinal +=  "CENTAVO";}
				else{cFinal +=  "CENTAVOS";}
			}
			else{
				if(parseFloat(aGrupo[1]) != 0){
					cFinal = aTexto[1];
					if(parseFloat(aGrupo[1]) > 1){cFinal += "MILH?ES ";}
					else{cFinal += "MILH?O ";}
					if(parseFloat(aGrupo[2] + aGrupo[3]) == 0){cFinal += "DE ";}
					else{cFinal += "E ";}
				}
				else{cFinal = "";}
				if(parseFloat(aGrupo[2]) != 0){
					cFinal += aTexto[2] + "MIL ";
					if(parseFloat(aGrupo[3]) != 0){cFinal += "E ";}
				}
				if(parseFloat(aGrupo[3]) != 0){cFinal += aTexto[3];}
				if(parseFloat(aGrupo[1] + aGrupo[2] + aGrupo[3]) == 1){cFinal += "REAL";}
				else{cFinal += "REAIS";}
				if(parseFloat(aGrupo[4]) != 0){
					cFinal += " E "+aTexto[4];
					if(parseFloat(aGrupo[4])==1){cFinal += "CENTAVO";}
					else{cFinal += "CENTAVOS";}
				}
			}
			form.elements[6].value=cFinal;
			return(cFinal);
		}
	}
}

//
// FUN?ES PARA TAG sipac:textArea
//
/**
 * Fun??o prepara um textArea para contagem de caracteres para
 * posterior valida??o.
 * - Seta o m?todo checkMaxLength para chamada onkeyup e onchange do textArea
 * passado como parametro.
 * - Seta a o m?todo validateTextAreas
 * para a chamada onsubmit do form se este n?o estiver setado.
 *
 * @param textArea objeto textArea a ser limitado
 * @see br.ufrn.sipac.arq.tags.TextareaTag
 * @author Rafael Borja
 */
function setMaxLength(textArea, validar)
{
	var contadorDiv = document.getElementById(textArea.id + '.contador');
		if (textArea.getAttribute('maxlength'))
		{
			contadorDiv.innerHTML = '<span>0</span>/'+textArea.getAttribute('maxlength');

			textArea.contador = contadorDiv.getElementsByTagName('span')[0];
			textArea.divContador = contadorDiv;
			textArea.onkeyup = textArea.onchange = checkMaxLength;

			textArea.onkeyup();
		}
}

/**
 * Fun??o para contagem de caracteres em um textArea
 *
 * @see br.ufrn.sipac.arq.tags.TextareaTag
 * @author Rafael Borja
 */
function checkMaxLength()
{
	var currentLength = this.value.length;
	var maxLength = this.getAttribute('maxlength');

	// Formata valor exibido (vermelho se ultrapassar maxlength
	if (currentLength > maxLength)
		this.divContador.style.color= 'red';
	else
		this.divContador.style.color= 'black';

	// Altera o valor exibido
	this.contador.tamanhoAtual = currentLength;
	currentLength = currentLength + '';
	for (i=0; i < maxLength.length && currentLength.length < maxLength.length; i++)
		currentLength = '0' + currentLength;

	this.contador.firstChild.nodeValue = currentLength;
}

/**
 * Fun??o valida o tamanho de todos os texts areas que possuem
 * o atributo maxlength.
 *
 * @see setMaxLength
 * @see checkMaxLength
 * @auhor Rafael Borja
 */
function validateTextAreas()
{
	var x;
	try {
		x = form.getElementsByTagName('textarea');
	} catch (e) {
		form = this;
		x = form.getElementsByTagName('textarea');
	}

	for (var i=0;i<x.length;i++)
	{
		var tamanhoMax = x[i].getAttribute('maxlength');
		if (x[i].contador.tamanhoAtual > tamanhoMax) {
			alert('Texto ultrapassa tamanho permitido');
			return false;
		}
		else
			i = i;
	}
	return true;
}

function changeMethod(method) {
	getEl('dispatch').dom.value = method;
}

// marca check
function marcaCheckBox(id) {
	getEl(id).dom.checked = true;
}

function navegateTo(view, element) {
// modifica o form do qual o elemento faz parte
	element.form.elements['dispatch'].value = 'navegar';
	element.form.elements['view'].value = view;
	element.form.submit();
}

function submitMethod(method, element, idDispatch) {
	if (idDispatch == undefined)
		element.form.elements['dispatch'].value = method;
	else
		element.form.elements[idDispatch].value = method;

	element.form.submit();
}

function remover(method, property, value) {
	getEl(property).dom.value = value;
	getEl('dispatch').dom.value = method;
	getEl(property).dom.form.submit();
}

function formataExprPreReq(campo, event) {

	//  essa funcao deveria automaticamente fechar parenteses
	// so aceitar letras, numeros e parenteses
	campo.value = campo.value.toUpperCase();
}

var Class = {
  create: function() {
    return function() {
      this.initialize.apply(this, arguments);
    }
  }
}

Object.extend = function(destination, source) {
  for (var property in source) {
    destination[property] = source[property];
  }
  return destination;
}

function ApenasNumeros(e)
{
	navegador = /msie/i.test(navigator.userAgent);
	if (navegador)
		var tecla = event.keyCode;
	else
		var tecla = e.which;
	if(tecla > 47 && tecla < 58) // numeros de 0 a 9
		return true;
	else
		{
		if (tecla != 8){ // backspace
			 if (tecla == 9)
				return true;
			 else
			 	return false;
			 }
		else
			return true;
	}
}

function formataValorJsf(campo, event, casas) {

     var point = '.';
     var comma = ',';
     var sep = 0;
     var key = '';
     var i = j = 0;
     var len = len2 = 0;
     var strCheck = '0123456789';
     var aux = aux2 = '';
     var rcode = event.which ? event.which : event.keyCode;
	 casas = parseInt(casas);

     if (teclasEspeciais.indexOf(rcode) != -1) {
          return true; // Teclas especiais
     }

	 if (rcode >= 96 && rcode <= 105)
		rcode -= 48; // Teclado num�rico, c�digo diferente

     key = String.fromCharCode(rcode); // Pega o valor da tecla pelo c?digo

     if (strCheck.indexOf(key) == -1){
          return false; // Filtra teclas inv?lidas
     }

     len = campo.value.length;
     for(; i < len; i++){
          if (strCheck.indexOf(campo.value.charAt(i))!=-1){
               aux += campo.value.charAt(i);
          }
     }

     aux += key;
     len = aux.length;

	 if (len == 0)     { campo.value = ''; }
     if (len <= casas) { campo.value = aux; }
     if (len > casas) {
          aux2 = '';
          for (j = 0, i = len - (casas + 1); i >= 0; i--) {
               if (j == casas + 1) {
                    aux2 += '';
                    j = 0;
               }
               aux2 += aux.charAt(i);
               j++;
          }
          campo.value = '';
          len2 = aux2.length;
          for (i = len2 - 1; i >= 0; i--){
               campo.value += aux2.charAt(i);
          }
          campo.value += point+ aux.substr(len - casas, len);
     }

     return false;
}

//-->