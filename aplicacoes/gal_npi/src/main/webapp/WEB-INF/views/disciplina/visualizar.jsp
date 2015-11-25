<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<title>Disciplina</title>
	<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		
		<jsp:include page="../fragments/header.jsp" />
		
		<c:if test="${not empty error}">
			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<c:out value="${error}"></c:out>
			</div>
		</c:if>
		
		<c:if test="${not empty info}">
			<div class="alert alert-info alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<c:out value="${info}"></c:out>
			</div>
		</c:if>
		
		<button class="btn btn-default btn-sm" onclick="goBack()">
			<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
			Voltar para Disciplinas
		</button>
		
		<c:if test="${empty disciplina}">
			<div class="alert alert-warning" role="alert">Disciplina inexistente</div>
		</c:if>
		
		<c:if test="${not empty disciplina}">
			<div style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Disciplina</label>
			</div>
			
			<p>Nome: <b>${disciplina.nome}</b></p>
			<p>Código: <b>${disciplina.codigo}</b></p>
			
			<hr>
			
			<button id="expandirTodosAccordions" class="btn btn-default btn-xs">Expandir Todos</button>
			<button id="esconderTodosAccordions" class="btn btn-default btn-xs">Esconder Todos</button>
			
			<hr>
			
			<h4>Bibliografia Básica</h4>
			<c:if test="${empty bibliografia_basica}">
			
			</c:if>
			<c:if test="${not empty bibliografia_basica}">
				<div class="panel-group" id="accordionBasica" role="tablist" aria-multiselectable="true">
					<c:forEach var="basica" items="${bibliografia_basica}">
						<div class="panel panel-default">
							<div class="disciplina-panel-heading panel-heading" role="tab">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse" href="#${basica.id}" aria-expanded="false" aria-controls="${basica.id}">
							        	${basica.nome}
									</a>
								</h4>
							</div>
							<div id="${basica.id}" class="panel-collapse collapse" role="tabpanel">
								<div class="panel-body">
						      		Acervo: ${basica.acervo}
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
			
			<hr>
			
			<h4>Bibliografia Complementar</h4>
			<c:if test="${empty bibliografia_complementar}">
			
			</c:if>
			<c:if test="${not empty bibliografia_complementar}">
				<div class="panel-group" id="accordionComplementar" role="tablist" aria-multiselectable="true">
					<c:forEach var="complementar" items="${bibliografia_complementar}">
						<div class="panel panel-default">
							<div class="disciplina-panel-heading panel-heading" role="tab">
								<div class="panel-title">
									<a role="button" data-toggle="collapse" href="#${complementar.id}" aria-expanded="false" aria-controls="${complementar.id}">
							        	${complementar.nome}
									</a>
								</div>
							</div>
							<div id="${complementar.id}" class="panel-collapse collapse" role="tabpanel">
								<div class="panel-body">
						      		Acervo: ${complementar.acervo}
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
			
		</c:if>

		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>