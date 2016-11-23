/*eslint-env jquery*/

$(document).ready(function(){
	$("#select-titulo").select2();
	
	$(".input-qtd").keyup(function(){
		var qtd = $(this).val();
		var tituloId = $(this).data("titulo-id");
		var valorUnitarioMedio = parseFloat($("#valor-unitario-medio-"+tituloId).text().trim());
		$("#valor-total-medio-"+tituloId).text(qtd*valorUnitarioMedio);
	});
	
	$(".close").click(function() {
		console.log("here");
		var target = $(this).data("for");
	   $(".alert-"+target).hide();
	})
	
	$(".gal-btn-add-item").on("click", function(event) {
		event.preventDefault();
		
		var botao = $(event.currentTarget); 
		var url = botao.attr("href");
		var tituloId = botao.data("titulo-id");
		var qtd = $("#input-qtd-"+tituloId).val();
		
		var response = $.ajax({
		    url: url,
		    type: 'POST',
		    data : {
		    	'quantidade' : qtd,
		    	'tituloId' : tituloId
		    }
		});
		
	    response.done(function(message) {
	    	$("#input-qtd-"+tituloId).prop('disabled', true);
	    	$(".alert-info").show();
	    	botao.hide();
	    	$(".alert-info > .alert-content").text(message);
	    });

	    response.fail(function(e) {
	    	$(".alert-danger").show();
	    	$(".alert-danger > .alert-content").text(e.responseText);
	    });

	});

});
