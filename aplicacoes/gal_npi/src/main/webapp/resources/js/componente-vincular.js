/*eslint-env jquery*/

$(document).ready(function(){

	$("#txtBusca").fastLiveFilter("#acervo");

	function getItems(exampleNr) {
		var columns = [];
		$(exampleNr + " ul.sortable-list").each(function() {
			var idLista = $(this).attr("id")
			if (idLista != "acervo") {
				var lista_aux_titulos = []
				$('#'+idLista+" .sortable-item").each(function(){
					lista_aux_titulos.push($(this).attr("id"));
				});
				columns.push(lista_aux_titulos.join(','));
			}
		});
		return columns;
	}

	$("#btn-get").click(function() {
		var allItems = getItems("#drag-and-drop");
		var data = {
			basica : allItems[0],
			complementar : allItems[1],
			idComponente : $("#componenteId").val()
		};
		$.post('/' + getAppName() + "/componente/vincular", data);
	});

	if($("#drag-and-drop .sortable-list").length > 0){
		var lista_drag_and_drop_basica = $("#drag-and-drop .sortable-list#basica");
		Sortable.create(lista_drag_and_drop_basica[0], { group: "drag_and_drop" });

		var lista_drag_and_drop_complementar = $("#drag-and-drop .sortable-list#complementar");
		Sortable.create(lista_drag_and_drop_complementar[0], { group: "drag_and_drop" });

		var lista_drag_and_drop_acervo = $("#drag-and-drop .sortable-list#acervo");
		Sortable.create(lista_drag_and_drop_acervo[0], { group: "drag_and_drop" });
	}

});
