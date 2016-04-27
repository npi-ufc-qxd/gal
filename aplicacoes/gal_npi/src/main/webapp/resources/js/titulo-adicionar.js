/*eslint-env jquery*/

$(document).ready(function(){

	//Função para mostrar o checkbox "vinculado a biblioteca" nas páginas de adição/edição de Título
	function showHideElement(tipoTitulo){
		if (tipoTitulo === "Físico") { // Mesmo valor do enum br.ufc.npi.gal.model.TipoTitulo
			$("#inputCadastradoBiblioteca").hide();
		}
		else if (tipoTitulo === "Virtual") { // // Mesmo valor do enum br.ufc.npi.gal.model.TipoTitulo
			$("#inputCadastradoBiblioteca").show();
		}
	}
	
	// Evento para mostrar/esconder o campo "cadastrado na biblioteca" nas páginas de adição/edição de Título de acordo com o tipo do título
	$("select#tipo").on("change", function(){
		showHideElement(this.value);
	});

	// Para a página de edição, será necessário identificar previamente o valor do campo "tipo" para a tomada de decisão de mostrar/esconder o campo "vinculado a biblioteca"
	showHideElement($("#tipo").val());

	//submit para formulario para adicionar titulo
	$(".form-control").on("keyup change focusout",function(){
		document.getElementById("nome").value = document.getElementById("autor").value + " " + document.getElementById("nome_titulo").value + " " +document.getElementById("titulo_n").value +
												" " + document.getElementById("sub_titulo").value +	" " + document.getElementById("titulo_revista").value + " " + document.getElementById("pagina").value + " " + document.getElementById("ref_artigo").value +
												" " + document.getElementById("edicao").value + " " + document.getElementById("publicador").value;
	});


});
