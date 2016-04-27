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