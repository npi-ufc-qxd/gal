<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
	<title>Editar Estrutura Curricular</title>
	<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container" style="width: 1000px; margin: 0 auto;">
		<jsp:include page="../fragments/header.jsp" />
		<form:form servletRelativeAction="/estrutura/${curso.id}/editar" method="post" modelAttribute="estruturaCurricular" role="form" class="form-horizontal">
			<form:input path="id" type="hidden" />
			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Editar Estrutura Curricular</label>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Ano e Semestre</label>
			    <div class="col-sm-10">
			    	<form:input id="codigo" class="form-control" placeholder="ano Semestre" path="codigo"/>
			    	<form:errors path="codigo" cssClass="error" />
			    </div>
			</div>
			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit" value="Editar"/>
				<a href="<c:url value="/curso/listar"></c:url>" class="btn btn-default">Cancelar</a>
			</div>
		</form:form>
		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>