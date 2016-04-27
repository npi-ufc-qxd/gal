/*eslint-env jquery*/

$(document).ready(function(){

	/*mostra a quantidade de exemplares que um titulo possui ao excluir*/
	$(".open-AddQtdExemplares").on("click", function() {
		var acervo = $(this).data('id');
		var mensagem;
		if (acervo > 0) {
			mensagem = "Esse título possui " + acervo + " exemplares, tem certeza de que deseja exclui-lo?";
		} else {
			mensagem = "Tem certeza de que deseja excluir esse título?";
		}
		$("#mensagem").text(mensagem);
	});

	/*mostra o codigo do exemplar ao tentar exclui-lo*/
	$(".open-CodigoExemplar").on("click", function() {
		var codigo = $(this).data("id");
		var mensagem = "Tem certeza de que deseja excluir o exemplar " + codigo + " ?";
		$("#mensagem").text(mensagem);
	});

});
