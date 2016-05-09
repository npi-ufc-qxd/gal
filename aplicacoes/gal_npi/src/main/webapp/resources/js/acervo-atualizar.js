/*eslint-env jquery*/

$(document).ready(function(){
	var data = $(".data");
	if (data != null){
		data.datepicker({
			language: "pt-BR",
			autoclose: true,
			format: "dd/mm/yyyy",
		});
	}
});
