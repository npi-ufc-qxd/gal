/*eslint-env jquery*/
/*global Sortable*/

$(document).ready(function(){

	$("#txtBusca").fastLiveFilter("#acervo");

	function getItems(exampleNr) {
		var columns = [];
		$(exampleNr + " ul.sortable-list").each(function() {
			var idLista = $(this).attr("id");
			if (idLista !== "acervo") {
				var listaAuxTitulos = [];
				$("#"+idLista+" .sortable-item").each(function(){
					listaAuxTitulos.push($(this).attr("id"));
				});
				columns.push(listaAuxTitulos.join(","));
			}
		});
		return columns;
	}
	
	function getAppName() {
		var url = location.pathname;
		url = url.split("/");
		return url[1];

	}

	$("#btn-get").click(function() {
		var allItems = getItems("#drag-and-drop");
		var data = {
			basica : allItems[0],
			complementar : allItems[1],
			idComponente : $("#componenteId").val()
		};
		$.post("/" + getAppName() + "/componente/vincular", data);
	});

	if($("#drag-and-drop .sortable-list").length > 0){
		var listaDragAndDropBasica = $("#drag-and-drop .sortable-list#basica");
		Sortable.create(listaDragAndDropBasica[0], { group: "drag_and_drop" });

		var listaDragAndDropComplementar = $("#drag-and-drop .sortable-list#complementar");
		Sortable.create(listaDragAndDropComplementar[0], { group: "drag_and_drop" });

		var listaDragAndDropAcervo = $("#drag-and-drop .sortable-list#acervo");
		Sortable.create(listaDragAndDropAcervo[0], { group: "drag_and_drop" });
	}

});
