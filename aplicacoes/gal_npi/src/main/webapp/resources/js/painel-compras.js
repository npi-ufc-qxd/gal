/*eslint-env jquery*/

$(document).ready(function(){
	$("#select-titulo").select2();
	
	$(".input-quantidade").keyup(function(){
		var quantidade = $(this).val();
		var tituloId = $(this).data("titulo-id");
		var valorUnitarioMedio = parseFloat($("#valor-unitario-medio-"+tituloId).text().trim());
		$("#valor-total-medio-"+tituloId).text(quantidade*valorUnitarioMedio);
	});
	
	$(".close").click(function() {
		var target = $(this).data("for");
		$(".alert-"+target).hide();
	});
	
	$(".gal-btn-add-item").on("click", function(event) {
		event.preventDefault();
		
		var botao = $(event.currentTarget); 
		var url = botao.attr("href");
		var tituloId = botao.data("titulo-id");
		var quantidade = $("#input-quantidade-"+tituloId).val();
		
		var response = $.ajax({
			url,
			type: 'POST',
			data : {
				'quantidade' : quantidade.toString(),
		    	'tituloId' : tituloId.toString()
			}
		});
		
		response.done(function(message) {
			$("#input-quantidade-"+tituloId.toString()).prop('disabled', true);
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
