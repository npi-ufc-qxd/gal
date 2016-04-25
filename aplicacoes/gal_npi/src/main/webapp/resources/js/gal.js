$( document ).ready(function() {

	$(".data").datepicker({
		language: "pt-BR",
		autoclose: true,
		format: "dd/mm/yyyy",
	});
	
	// Marca no select box o filtro que foi executado
	$("#selecionaCurso").val($("#idCurso").val());
	$("#selecionaComponente").val($("#idComponente").val());
	
	// adiciona busca nos select box
	$(".select-filter").select2();
	
	
	$(".form-control").on("keyup change focusout",function(){
		document.getElementById("nome").value = document.getElementById("autor").value + " " + document.getElementById("nome_titulo").value + " " +document.getElementById("titulo_n").value + 
												" " + document.getElementById("sub_titulo").value +	" " + document.getElementById("titulo_revista").value + " " + document.getElementById("pagina").value + " " + document.getElementById("ref_artigo").value +
												" " + document.getElementById("edicao").value + " " + document.getElementById("publicador").value;
	});
	
	$("#expandirTodosAccordions").click(function(){
		alert("#expandirTodosAccordions");
		$(".panel-collapse").collapse("show");
	});
	
	$("#esconderTodosAccordions").click(function(){
		alert("#esconderTodosAccordions");
		$(".panel-collapse").collapse("hide");
	});
	
	$("#confirm-delete").on("show.bs.modal", function(e) {
		$(this).find(".btn-danger").attr("href", $(e.relatedTarget).data("href"));
	});
	
	$("div:has(span.error)").find("span.error").css("color", "#a94442");
	$("div:has(span.error)").find("span.error").parent().parent().addClass("has-error has-feedback");
	
	$("#txtBusca").fastLiveFilter("#acervo");
		
	$("select#selecionaCurso").change(function() { 
		alert("select#selecionaCurso");
		var option = $(this).val();

		if(option == -1){
			newUrl = '/' + getAppName() + "/meta/listar";
		}else{
			newUrl = '/' + getAppName() + "/meta/"+(option)+"/listar";
		}

		$(location).attr("href", newUrl);
	});
	
	$("select#selecionaComponente").change(function() { 
		alert("select#selecionaComponente");
		var option = $(this).val();

		if(option == -1){
			newUrl = '/' + getAppName() + "/meta/listar";
		}else{
			newUrl = '/' + getAppName() + "/meta/componente/"+(option)+"/listar";
		}

		$(location).attr("href", newUrl);
	});


	$(document).on("click", ".open-AddBookDialog", function() {
		alert(".open-AddBookDialog");
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