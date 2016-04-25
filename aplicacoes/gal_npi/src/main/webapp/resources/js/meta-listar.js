$(document).ready(function(){
	
	$("select#selecionaCurso").change(function() { 
		var option = $(this).val();

		if(option == -1){
			newUrl = '/' + getAppName() + "/meta/listar";
		}else{
			newUrl = '/' + getAppName() + "/meta/"+(option)+"/listar";
		}

		$(location).attr("href", newUrl);
	});
	
	$("select#selecionaComponente").change(function() { 
		var option = $(this).val();

		if(option == -1){
			newUrl = '/' + getAppName() + "/meta/listar";
		}else{
			newUrl = '/' + getAppName() + "/meta/componente/"+(option)+"/listar";
		}

		$(location).attr("href", newUrl);
	});
	
});