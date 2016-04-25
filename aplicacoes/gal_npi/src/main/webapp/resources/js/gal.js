$( document ).ready(function() {

	$(".data").datepicker({
		language: "pt-BR",
		autoclose: true,
		format: "dd/mm/yyyy",
	});
	
	$("#confirm-delete").on("show.bs.modal", function(e) {
		$(this).find(".btn-danger").attr("href", $(e.relatedTarget).data("href"));
	});
	
	$("div:has(span.error)").find("span.error").css("color", "#a94442");
	$("div:has(span.error)").find("span.error").parent().parent().addClass("has-error has-feedback");
	
	$(document).on("click", ".open-AddBookDialog", function() {
		var id = $(this).data("id");
		$(".modal-body #id").val(id);
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
    return v.replace(/\D/g,"")
}

function getAppName() {
	var url = location.pathname;
	url = url.split('/');
	return url[1];

}