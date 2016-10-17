/*eslint-env jquery*/
$( document ).ready(function() {

	
	$("#confirm-delete").on("show.bs.modal", function(e) {
		$(this).find(".btn-danger").attr("href", $(e.relatedTarget).data("href"));
	});
	
	var spanError = $("div:has(span.error)");
	if (spanError != null){
		spanError.find("span.error").css("color", "#a94442");
		spanError.find("span.error").parent().parent().addClass("has-error has-feedback");
	}

	$("select#selecionaComponente").change(function() { 
		var option = $(this).val();

		if(option == -1){
			newUrl = "/" + getAppName() + "/meta/listar";
		}else{
			newUrl = "/" + getAppName() + "/meta/componente/"+(option)+"/listar";
		}

		$(location).attr("href", newUrl);
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
    return v.replace(/\D/g,"");
}

function getAppName() {
	var url = location.pathname;
	url = url.split("/");
	return url[1];
}
