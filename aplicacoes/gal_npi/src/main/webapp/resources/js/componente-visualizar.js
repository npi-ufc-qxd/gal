$(document).ready(function(){
	
	$("#expandirTodosAccordions").click(function(){
		alert("#expandirTodosAccordions");
		$(".panel-collapse").collapse("show");
	});
	
	$("#esconderTodosAccordions").click(function(){
		alert("#esconderTodosAccordions");
		$(".panel-collapse").collapse("hide");
	});
});