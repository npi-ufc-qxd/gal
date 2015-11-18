$( document ).ready(function() {

	$('.data').datepicker({
		language: 'pt-BR',
		autoclose: true,
		format: "dd/mm/yyyy",
	});
	
	$('#resultadoParTable').dataTable( {
		iDisplayLength: 25,
		sPaginationType : "full_numbers",
		oLanguage : {
			"sEmptyTable" : "Nenhum registro encontrado",
			"sInfo" : "Mostrando _START_ até _END_ de _TOTAL_ registros",
			"sInfoEmpty" : "Mostrar 0 até 0 de 0 Registros",
			"sInfoFiltered" : "(Filtrar de _MAX_ total registros)",
			"sInfoPostFix" : "",
			"sInfoThousands" : ".",
			"sLengthMenu" : "Mostrar _MENU_ registros por página",
			"sLoadingRecords" : "Carregando...",
			"sProcessing" : "Processando...",
			"sZeroRecords" : "Nenhum registro encontrado",
			"sSearch" : "Pesquisar: ",
			"oPaginate" : {
				"sNext" : "Próximo",
				"sPrevious" : "Anterior",
				"sFirst" : "Primeiro",
				"sLast" : "Último"
			},
			"oAria" : {
				"sSortAscending" : ": Ordenar colunas de forma ascendente",
				"sSortDescending" : ": Ordenar colunas de forma descendente"
			}
		},
        "paging":   false,
        "ordering": false,
        "info":     false,
		"bDestroy": true
    } );
    
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
			"destroy": true
		});
	});
	
	$('#confirm-delete').on('show.bs.modal', function(e) {
	    $(this).find('.btn-danger').attr('href', $(e.relatedTarget).data('href'));
	});
	
	$('div:has(span.error)').find('span.error').css('color', '#a94442');
	$('div:has(span.error)').find('span.error').parent().parent().addClass('has-error has-feedback');
	
	$('#txtBusca').fastLiveFilter("#acervo");
	
	function getItems(exampleNr) {
		var columns = [];
		$(exampleNr + ' ul.sortable-list').each(
				function() {
					if ($(this).attr('id') != 'acervo') {
						columns.push($(this).sortable(
								'toArray').join(','));
					}
				});
		return columns;
	}

	$('#btn-get').click(function() {
		var data = {
			basica : getItems('#drag-and-drop')[0],
			complementar : getItems('#drag-and-drop')[1],
			idDiciplina : $('#disciplinaId').val()
		};

		$.get('/' + getAppName() + '/disciplina/vincular', data);
	});

	$('#drag-and-drop .sortable-list').sortable({
		connectWith : '#drag-and-drop .sortable-list'
	});

	$("select#seleciona").change(function() { 
		var option = $("#seleciona").val();

		if(option == -1){
			newUrl = "/" + getAppName() + "/meta/listar";
		}else{
			newUrl = "/" + getAppName() + "/meta/"+(option)+"/listar";
		}

		$(location).attr("href", newUrl);
	});
	

	$("#seleciona").val($("#idCurso").val());

	
	$(document).on("click", ".open-AddBookDialog", function() {
		var id = $(this).data('id');
		$(".modal-body #id").val(id);
	});

	$("#selectDisciplina").select2();

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