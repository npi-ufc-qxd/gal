/*eslint-env jquery*/
/*eslint new-cap: ["error", {"capIsNewExceptions": ["DataTable"]}]*/
/*eslint no-undefined: "error"*/

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

	$("table.table-orderable").each(function(){
		var defaultSort = $(this).attr("default-sort");
		// testa se existe o atributo defaultSort no elemento
		if(typeof defaultSort !== typeof undefined && defaultSort !== false){
			defaultSort = [defaultSort.split(" ")];
		}else{
			defaultSort = [];
		}


		var noSortFields = $(this).attr("no-sort-fields");
		// testa se existe o atributo noSortFields
		if(typeof noSortFields !== typeof undefined && noSortFields !== false){
			noSortFields = noSortFields.split(" ");
			// converte para array de inteiros
			for(var i = 0; i < noSortFields.length; i++){
				noSortFields[i] = Number(noSortFields[i]);
			}
		}else{
			noSortFields = [];
		}

		var attrPaging = $(this).attr("paging");
		if(typeof attrPaging !== typeof undefined){
			if(attrPaging === "false"){
				attrPaging = false;
			}
		}else{
			attrPaging = true;
		}

		var attrSearching = $(this).attr("searching");
		if(typeof attrSearching !== typeof undefined){
			if (attrSearching === "false"){
				attrSearching = false;
			}
		}else{
			attrSearching = true;
		}

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
			"order": defaultSort,
			"columnDefs": [
				{"orderable": true, "targets": noSortFields},
				// Essa linha foi desativada por gerar conflito com a busca na tabela
				// Link da resposta de um desenvolvedor da DataTables que pode significar
				// o porque do problema: https://github.com/DataTables/DataTables/issues/43
				/*{"targets": "_all", "type": 'portugues'}*/
			],
			"destroy": true,
			"paging": attrPaging,
			"searching": attrSearching
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
