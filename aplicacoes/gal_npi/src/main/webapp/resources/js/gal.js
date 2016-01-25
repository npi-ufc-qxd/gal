$( document ).ready(function() {

	$('.data').datepicker({
		language: 'pt-BR',
		autoclose: true,
		format: "dd/mm/yyyy",
	});
	
	// remove acentos para auxiliar na busca dentro do datatable
	function removeAcentos(data){
		return ! data ?
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
	}
	
	// não está funcionando na tabela de componentes curriculares
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
		});
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
	
	var lista_drag_and_drop_basica = $('#drag-and-drop .sortable-list#basica');
	Sortable.create(lista_drag_and_drop_basica[0], { group: "drag_and_drop" });
	
	var lista_drag_and_drop_complementar = $('#drag-and-drop .sortable-list#complementar');
	Sortable.create(lista_drag_and_drop_complementar[0], { group: "drag_and_drop" });
	
	var lista_drag_and_drop_acervo = $('#drag-and-drop .sortable-list#acervo');
	Sortable.create(lista_drag_and_drop_acervo[0], { group: "drag_and_drop" });

	$("select#seleciona").change(function() { 
		var option = $("#seleciona").val();

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
	

	$("#seleciona").val($("#idCurso").val());
	$("#selecionaComponente").val($("#idComponente").val());

	
	$(document).on("click", ".open-AddBookDialog", function() {
		var id = $(this).data('id');
		$(".modal-body #id").val(id);
	});

	$("#selectComponente").select2();

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