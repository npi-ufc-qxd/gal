/*eslint-env jquery*/
/*eslint new-cap: ["error", {"capIsNewExceptions": ["DataTable"]}]*/

$(document).ready(function(){

	// remove acentos de strings
	function removeAcentos(data){
		return ! data ? 
				"" :
					typeof data === "string" ?
					data
					.toLowerCase()
					.replace( /[áàäâãÁÀÄÂÃ]/g, "a" )
					.replace( /[óòöôõÓÒÖÔÕ]/g, "o" )
					.replace( /[éèëêÉÈËÊ]/g, "e" )
					.replace( /[íìïîÍÌÏÎ]/g, "i" )
					.replace( /[úùüûÚÙÜÛ]/g, "u" )
					.replace( /[çÇ]/g, "c" )
					.replace( /\n/g, " " ) :
					data;
	}

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
	
	function getDefaultSort(table){
		var defaultSort = table.attr("default-sort");
		// testa se existe o atributo defaultSort no elemento
		if(typeof defaultSort !== typeof window.undefined){
			defaultSort = [defaultSort.split(" ")];
		}else{
			defaultSort = [];
		}
		return defaultSort;
	}
	
	function getNoSortFields(table){
		var noSortFields = table.attr("no-sort-fields");
		// testa se existe o atributo noSortFields
		if(typeof noSortFields !== typeof window.undefined){
			noSortFields = noSortFields.split(" ");
			// converte para array de inteiros
			for(var i = 0; i < noSortFields.length; i++){
				noSortFields[i] = Number(noSortFields[i]);
			}
		}else{
			noSortFields = [];
		}
		return noSortFields;
	}
	
	function getAttrPaging(table){
		var attrPaging = table.attr("paging");
		if(typeof attrPaging === typeof window.undefined){
			attrPaging = true;
		}
		return attrPaging;
	}

	function getAttrSearching(table){
		var attrSearching = table.attr("searching");
		if(typeof attrSearching === typeof window.undefined){
			attrSearching = true;
		}
		return attrSearching;
	}
	
	$("table.table-orderable").each(function(){

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
			"order": getDefaultSort($(this)),
			"columnDefs": [
				{"orderable": true, "targets": getNoSortFields($(this))},
				// Essa linha foi desativada por gerar conflito com a busca na tabela
				// Link da resposta de um desenvolvedor da DataTables que pode significar
				// o porque do problema: https://github.com/DataTables/DataTables/issues/43
				/*{"targets": "_all", "type": 'portugues'}*/
			],
			"destroy": true,
			"paging": getAttrPaging($(this)),
			"searching": getAttrSearching($(this))
		});
	});

	//aplica o filtro no input da busca
	$(".dataTables_filter input").keyup( function () {
		var table = $("table.table-orderable").DataTable();
        table
          .search($.fn.DataTable.ext.type.search.string( this.value ))
          .draw();
    } );

});
