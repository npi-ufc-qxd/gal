$( document ).ready(function() {

	$('.data').datepicker({
		language: 'pt-BR',
		autoclose: true,
		format: "dd/mm/yyyy",
	});
	
	// Marca no select box o filtro que foi executado
	$("#selecionaCurso").val($("#idCurso").val());
	$("#selecionaComponente").val($("#idComponente").val());
	
	// adiciona busca nos select box
	$(".select-filter").select2();
	
	// remove acentos de strings
	function removeAcentos(data){
		var r = !data ?
		        '' :
		        typeof data === 'string' ?
		            data
		            	.toLowerCase()
	                	.replace( /[áàäâãÁÀÄÂÃ]/g, 'a' )
	                	.replace( /[óòöôõÓÒÖÔÕ]/g, 'o' )
	                	.replace( /[éèëêÉÈËÊ]/g, 'e' )
	                	.replace( /[íìïîÍÌÏÎ]/g, 'i' )
	                	.replace( /[úùüûÚÙÜÛ]/g, 'u' )
		                .replace( /ç/g, 'c' )
		                .replace( /\n/g, ' ' ) :
		            data;
		return r;
	}
	
	$.fn.DataTable.ext.type.search.string = removeAcentos;
    
	$('table.table-orderable').each(function(){
		var default_sort = $(this).attr('default-sort');
		// testa se existe o atributo default_sort no elemento
		if(typeof default_sort !== typeof undefined && default_sort !== false)
			default_sort = [default_sort.split(' ')];
		else
			default_sort = [];
		
		
		var no_sort_fields = $(this).attr('no-sort-fields');
		// testa se existe o atributo no_sort_fields
		if(typeof no_sort_fields !== typeof undefined && no_sort_fields !== false){
			no_sort_fields = no_sort_fields.split(' ');
			// converte para array de inteiros
			for(i = 0; i < no_sort_fields.length; i++){
				no_sort_fields[i] = Number(no_sort_fields[i]);
			}
		}
		
		else
			no_sort_fields = [];
		
		var attr_paging = $(this).attr('paging');
		if(typeof attr_paging !== typeof undefined){
			if(attr_paging === "false")
				attr_paging = false;
		}
		else attr_paging = true;
		
		var attr_searching = $(this).attr('searching');
		if(typeof attr_searching !== typeof undefined){
			if (attr_searching === "false")
				attr_searching = false;
		}
		else attr_searching = true;
		
		
		$(this).dataTable({
			"pageLength": 25,
			"pagingType" : "full_numbers",
			"language" : {
				"decimal": ",",
				"emptyTable" : "Nenhum registro encontrado",
				"info" : "Mostrando _START_ até _END_ de _TOTAL_ registros",
				"infoEmpty" : "Mostrar 0 até 0 de 0 Registros",
				"infoFiltered" : "(Filtrar de _MAX_ total registros)",
				"infoPostFix" : "",
				"thousands" : ".",
				"lengthMenu" : "Mostrar _MENU_ registros por página",
				"loadingRecords" : "Carregando...",
				"processing" : "Processando...",
				"zeroRecords" : "Nenhum registro encontrado",
				"search" : "Pesquisar: ",
				"paginate" : {
					"next" : "Próximo",
					"previous" : "Anterior",
					"first" : "Primeiro",
					"last" : "Último"
				},
				"aria" : {
					"sortAscending" : ": Ordenar colunas de forma ascendente",
					"sortDescending" : ": Ordenar colunas de forma descendente"
				}
			},
			"order": default_sort,
			"columnDefs": [ { "orderable": false, "targets": no_sort_fields } ],
			"destroy": true,
			"paging": attr_paging,
			"searching": attr_searching
		});
	});
	
	$('#submitEditarTitulo').click(function(){
		$('#formfieldtitulo').submit();
	});
	
	$('.form-control').on("keyup",function(){
		 
		document.getElementById("nome").value = document.getElementById("autor").value + " " + document.getElementById("nome_titulo").value + " " +document.getElementById("titulo_n").value + 
												" " + document.getElementById("sub_titulo").value +	" " + document.getElementById("titulo_revista").value + " " + document.getElementById("pagina").value + " " + document.getElementById("ref_artigo").value +
												" " + document.getElementById("edicao").value + " " + document.getElementById("publicador").value;
		console.error(document.getElementById("nome").value);
	});
	
	$('#expandirTodosAccordions').click(function(){
		$('.panel-collapse').collapse('show');
	});
	
	$('#esconderTodosAccordions').click(function(){
		$('.panel-collapse').collapse('hide');
	});
	
	$('#confirm-delete').on('show.bs.modal', function(e) {
	    $(this).find('.btn-danger').attr('href', $(e.relatedTarget).data('href'));
	});
	
	$('div:has(span.error)').find('span.error').css('color', '#a94442');
	$('div:has(span.error)').find('span.error').parent().parent().addClass('has-error has-feedback');
	
	$('#txtBusca').fastLiveFilter("#acervo");
	
	function getItems(exampleNr) {
		var columns = [];
		$(exampleNr + ' ul.sortable-list').each(function() {
			var idLista = $(this).attr('id')
			if (idLista != 'acervo') {
				var lista_aux_titulos = []
				$('#'+idLista+' .sortable-item').each(function(){
					lista_aux_titulos.push($(this).attr('id'));
				});
				columns.push(lista_aux_titulos.join(','));
			}
		});
		return columns;
	}

	$('#btn-get').click(function() {
		var allItems = getItems('#drag-and-drop');
		var data = {
			basica : allItems[0],
			complementar : allItems[1],
			idComponente : $('#componenteId').val()
		};
		$.post('/' + getAppName() + '/componente/vincular', data);
	});
	
	$("select#selecionaCurso").change(function() { 
		var option = $(this).val();

		if(option == -1){
			newUrl = "/" + getAppName() + "/meta/listar";
		}else{
			newUrl = "/" + getAppName() + "/meta/"+(option)+"/listar";
		}

		$(location).attr("href", newUrl);
	});
	
	$("select#selecionaComponente").change(function() { 
		var option = $(this).val();

		if(option == -1){
			newUrl = "/" + getAppName() + "/meta/listar";
		}else{
			newUrl = "/" + getAppName() + "/meta/componente/"+(option)+"/listar";
		}

		$(location).attr("href", newUrl);
	});

	if($('#drag-and-drop .sortable-list').length > 0){
		var lista_drag_and_drop_basica = $('#drag-and-drop .sortable-list#basica');
		Sortable.create(lista_drag_and_drop_basica[0], { group: "drag_and_drop" });

		var lista_drag_and_drop_complementar = $('#drag-and-drop .sortable-list#complementar');
		Sortable.create(lista_drag_and_drop_complementar[0], { group: "drag_and_drop" });

		var lista_drag_and_drop_acervo = $('#drag-and-drop .sortable-list#acervo');
		Sortable.create(lista_drag_and_drop_acervo[0], { group: "drag_and_drop" });
	}

	$(document).on("click", ".open-AddBookDialog", function() {
		var id = $(this).data('id');
		$(".modal-body #id").val(id);
	});
});

function goBack() {
	window.history.back()
}

function mascara(o,f){
    v_obj=o
    v_fun=f
    setTimeout("execmascara()",1)
}
	
function execmascara(){
    v_obj.value=v_fun(v_obj.value)
}

function soNumeros(v){
    return v.replace(/\D/g,"")
}

function getAppName() {
	var url = location.pathname;
	url = url.split("/");
	return url[1];

}

//Função para mostrar o checkbox "vinculado a biblioteca" nas páginas de adição/edição de Título
function showHideElement(tipo_titulo){
	if (tipo_titulo === "Físico") { // Mesmo valor do enum br.ufc.npi.gal.model.TipoTitulo
        $("#inputVinculacao").hide();
    } 
	else if (tipo_titulo === "Virtual") { // // Mesmo valor do enum br.ufc.npi.gal.model.TipoTitulo
		$("#inputVinculacao").show();
    }
}
// Para a página de edição, será necessário identificar previamente o valor do campo "tipo" para a tomada de decisão de mostrar/esconder o campo "vinculado a biblioteca" 
showHideElement($("#tipo").val());

/*mostra a quantidade de exemplares que um titulo possui*/
$(".open-AddQtdExemplares").on("click", function() {
	var acervo = $(this).data('id');
	var mensagem;
	if (acervo > 0) {
		mensagem = "Esse título possui " + acervo + " exemplares, tem certeza de que deseja exclui-lo?";
	} else {
		mensagem = "Tem certeza de que deseja excluir esse título?";
	}
	$("#mensagem").text(mensagem);
});

/*mostra o codigo do exemplar ao tentar exclui-lo*/
$(".open-CodigoExemplar").on("click", function() {
	var codigo = $(this).data('id');
	var mensagem = "Tem certeza de que deseja excluir o exemplar " + codigo + " ?";
	$("#mensagem").text(mensagem);
});

