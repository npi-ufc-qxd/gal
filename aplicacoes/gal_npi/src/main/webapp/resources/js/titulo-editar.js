/*eslint-env jquery*/

$(document).ready(function(){

	// Evento para mostrar/esconder o campo "cadastrado na biblioteca" nas páginas de adição/edição de Título de acordo com o tipo do título
	$("select#tipo").on("change", function(){
		showHideElement(this.value);
	});

	//Função para mostrar o checkbox "vinculado a biblioteca" nas páginas de adição/edição de Título
	function showHideElement(tipo_titulo){
		if (tipo_titulo === "Físico") { // Mesmo valor do enum br.ufc.npi.gal.model.TipoTitulo
	        $("#inputCadastradoBiblioteca").hide();
	    }
		else if (tipo_titulo === "Virtual") { // // Mesmo valor do enum br.ufc.npi.gal.model.TipoTitulo
			$("#inputCadastradoBiblioteca").show();
	    }
	}

	// Para a página de edição, será necessário identificar previamente o valor do campo "tipo" para a tomada de decisão de mostrar/esconder o campo "vinculado a biblioteca"
	showHideElement($("#tipo").val());

	//titulo-editar
	$("#submitEditarTitulo").click(function(){
		alert("#submitEditarTitulo");
		$("#formfieldtitulo").submit();
	});

});
