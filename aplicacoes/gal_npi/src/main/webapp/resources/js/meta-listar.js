/*eslint-env jquery*/

$(document).ready(function(){

	// adiciona busca nos select box
	$(".select-filter").select2();

	// Marca no select box o filtro que foi executado
	$("#selecionaCurso").val($("#idCurso").val());
	$("#selecionaComponente").val($("#idComponente").val());

	function getAppName() {
		var url = location.pathname;
		url = url.split("/");
		return url[1];

	}
	
	$("select#selecionaCurso").change(function() {
		var option = $(this).val();
		var newUrl;
		if(option === -1){
			newUrl = "/" + getAppName() + "/meta/listar";
		}else{
			newUrl = "/" + getAppName() + "/meta/"+(option)+"/listar";
		}

		$(location).attr("href", newUrl);
	});

	$("select#selecionaComponente").change(function() {
		var option = $(this).val();
		var newUrl;
		if(option === -1){
			newUrl = "/" + getAppName() + "/meta/listar";
		}else{
			newUrl = "/" + getAppName() + "/meta/componente/"+(option)+"/listar";
		}
		$(location).attr("href", newUrl);
	});

});
