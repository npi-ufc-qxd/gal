$( document ).ready(function() {
	
<<<<<<< HEAD
	$("#confirm-delete").on("show.bs.modal", function(e) {
		$(this).find(".btn-danger").attr("href", $(e.relatedTarget).data("href"));
	});
	
	var spanError = $("div:has(span.error)");
	if (spanError != null){
		spanError.find("span.error").css("color", "#a94442");
		spanError.find("span.error").parent().parent().addClass("has-error has-feedback");
=======
	$.fn.DataTable.ext.type.search.string = removeAcentos;
	
	$.extend( $.fn.DataTable.ext.type.order, {
		"portugues-asc": function ( a, b ) {
			a = removeAcentos(a);
			b = removeAcentos(b);
			return ((a < b) ? -1 : ((a > b) ? 1 : 0));
		},
		"portugues-desc": function ( a, b ) {
			a = removeAcentos(a);
			b = removeAcentos(b);
			return ((a < b) ? 1 : ((a > b) ? -1 : 0));
	    }
	});
    
	$('table.table-orderable').each(function(){
		var default_sort = $(this).attr('default-sort');
		// testa se existe o atributo default_sort no elemento
		if(default_sort !== undefined && default_sort !== false)
			default_sort = [default_sort.split(' ')];
		else
			default_sort = [];
		
		
		var no_sort_fields = $(this).attr('no-sort-fields');
		// testa se existe o atributo no_sort_fields
		if(no_sort_fields !== undefined && no_sort_fields !== false){
			no_sort_fields = no_sort_fields.split(' ');
			// converte para array de inteiros
			for(i = 0; i < no_sort_fields.length; i++){
				no_sort_fields[i] = Number(no_sort_fields[i]);
			}
		}
		
		else
			no_sort_fields = [];
		
		var attr_paging = $(this).attr('paging');
		if(attr_paging !== undefined){
			if(attr_paging === "false")
				attr_paging = false;
		}
		else attr_paging = true;
		
		var attr_searching = $(this).attr('searching');
		if(attr_searching !== undefined){
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
			"columnDefs": [ 
			    {"orderable": true, "targets": no_sort_fields},
			    // Essa linha foi desativada por gerar conflito com a busca na tabela
			    // Link da resposta de um desenvolvedor da DataTables que pode significar
			    // o porque do problema: https://github.com/DataTables/DataTables/issues/43
			    /*{"targets": "_all", "type": 'portugues'}*/ 
			],
			"destroy": true,
			"paging": attr_paging,
			"searching": attr_searching
		});
	});
	
	//aplica o filtro no input da busca
	$('.dataTables_filter input').keyup( function () {
		var table = $('table.table-orderable').DataTable();
		table
			.search($.fn.DataTable.ext.type.search.string(this.value))
			.draw();
	});
	
	$('#submitEditarTitulo').click(function(){
		$('#formfieldtitulo').submit();
	});
	
	$('.form-control').on("keyup change focusout",function(){
		document.getElementById("nome").value = document.getElementById("autor").value + " " + document.getElementById("nome_titulo").value + " " +document.getElementById("titulo_n").value + 
												" " + document.getElementById("sub_titulo").value +	" " + document.getElementById("titulo_revista").value + " " + document.getElementById("pagina").value + " " + document.getElementById("ref_artigo").value +
												" " + document.getElementById("edicao").value + " " + document.getElementById("publicador").value;
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
>>>>>>> master
	}
	
	
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
	url = url.split('/');
	return url[1];

}
