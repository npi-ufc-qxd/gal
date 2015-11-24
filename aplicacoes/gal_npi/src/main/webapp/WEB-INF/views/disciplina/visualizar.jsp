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
		
		<c:if test="${empty disciplina}">
			<div class="alert alert-warning" role="alert">Disciplina inexistente</div>
		</c:if>
		
		<c:if test="${not empty disciplina}">
			<div style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Disciplina</label>
			</div>
			
			<p>Nome: ${disciplina.nome}</p>
			<p>Código: ${disciplina.codigo}</p>
			
			<hr>
			
			<h4>Bibliografia Básica</h4>
			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				<c:forEach var="basica" items="${basica}">
					<div class="panel panel-default">
						<div class="disciplina-panel-heading panel-heading" role="tab">
							<h4 class="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href="#<c:out value="${basica.id}"></c:out>" aria-expanded="false" aria-controls="<c:out value="${basica.id}"></c:out>">
						        	<c:out value="${basica.nome}"></c:out>
								</a>
							</h4>
						</div>
						<div id="<c:out value="${basica.id}"></c:out>" class="panel-collapse collapse" role="tabpanel">
							<div class="panel-body">
					      		ABC
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<hr>
			
			<h4>Bibliografia Complementar</h4>
			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				<c:forEach var="complementar" items="${complementar}">
					<div class="panel panel-default">
						<div class="panel-heading disciplina-panel-heading" role="tab">
							<div class="panel-title">
								<a role="button" data-toggle="collapse" data-parent="#accordion" href="#<c:out value="${complementar.id}"></c:out>" aria-expanded="false" aria-controls="<c:out value="${complementar.id}"></c:out>">
						        	<c:out value="${complementar.nome}"></c:out>
								</a>
							</div>
						</div>
						<div id="<c:out value="${complementar.id}"></c:out>" class="panel-collapse collapse" role="tabpanel">
							<div class="panel-body">
					      		ABC
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
		</c:if>

		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>