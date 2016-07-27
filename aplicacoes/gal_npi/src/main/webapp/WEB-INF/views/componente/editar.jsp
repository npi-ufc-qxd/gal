<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Editar Componente Curricular</title>
	<jsp:include page="../fragments/htmlHead.jsp" />
</head>

<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />
		<section id="main-content">
          	<section class="wrapper"> 
          		<div class="col-lg-12">
        	  	<div class="form-panel">

		<form:form modelAttribute="componente" id="reg" servletRelativeAction="/componente/editar" method="post" role="form" class="form-horizontal">
			<h4 class="center negrito">Editar Componente Curricular</h4>
			
			<form:input path="id" type="hidden" />
			
			
			<div class="form-group">
				<label for="codigo" class="col-sm-1 control-label">Código</label>
				<div class="col-sm-10">
					<form:input id="codigo" class="form-control" placeholder="Ex.: QXD0000"
						path="codigo" />
					<form:errors path="codigo" cssClass="error" />
				</div>
			</div>
			<div class="form-group">
				<label for="nome" class="col-sm-1 control-label">Nome</label>
				<div class="col-sm-10">
					<form:input id="nome" class="form-control" placeholder="Nome"
						path="nome" />
					<form:errors path="nome" cssClass="error" />
				</div>
			</div>
			<div class="form-group">
				<label for="tipo" class="col-sm-1 control-label">Tipo</label>
				<div class="col-sm-10">
					<form:select path="tipo" class="form-control">
						<form:option value="DISCIPLINA">Disciplina</form:option>
						<form:option value="ATIVIDADES COMPLEMENTARES">Atividade Complementar</form:option>
						<form:option value="TCC">Trabalho de Conclusão de Curso</form:option>
						<form:option value="ESTAGIO">Estágio</form:option>
					</form:select>
					<form:errors path="tipo" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="chPratica" class="col-sm-1 control-label">CH
					Prática</label>
				<div class="col-sm-10">
					<form:input id="chPratica" class="form-control"
						placeholder="Carga Horária Pŕatica" path="chPratica" />
					<form:errors path="chPratica" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="chTeorica" class="col-sm-1 control-label">CH
					Teórica</label>
				<div class="col-sm-10">
					<form:input id="chTeorica" class="form-control"
						placeholder="Carga Horária Teórica" path="chTeorica" />
					<form:errors path="chTeorica" cssClass="error" />
				</div>
			</div>
			
			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit" value="Salvar"/>
				<button class="btn btn-default" onclick="goBack()">Cancelar</button>
			</div>
		</form:form>
		</div>
		</div>
		</section>
		</section>
		<jsp:include page="../fragments/footer.jsp" />
	</div>

</body>
</html>