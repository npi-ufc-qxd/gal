<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>Vincular Bibliografia</title>
<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container" style="width: 1000px; margin: 0 auto;">
		<jsp:include page="../fragments/header.jsp" />
		<input id="componenteId" type="hidden" value="${componente.id}" />
		<div id="center-wrapper">
			<div id="drag-and-drop">
				<p id="nomeComponente">${componente.codigo}-${componente.nome}</p>
				<p>
					<button class="btn btn-default" onclick="goBack()">
						Voltar
					</button>
					<a class="btn btn-success" id="btn-get"
						href="<c:url value="/componente/listar" ></c:url>">Vincular</a>
				</p>
				<div class="column left first">
					<label style="font-size: 16px;">Básica</label>
					<ul class="sortable-list" id="basica">

						<c:forEach var="basica" items="${basica}">
							<li class="sortable-item" id="${basica.id}" style="font-size: 12px;"><c:out
									value="${basica.nome}" /></li>
						</c:forEach>
					</ul>
				</div>

				<div class="column left">
					<label style="font-size: 16px;">Complementar</label>
					<ul class="sortable-list" id="complementar">
						<c:forEach var="complementar" items="${complementar}">
							<li class="sortable-item" id="${complementar.id}" style="font-size: 12px;"><c:out
									value="${complementar.nome}" /></li>
						</c:forEach>
					</ul>

				</div>

				<div class="column left">
					<label style="font-size: 16px;">Acervo</label> <input type="text"
						id="txtBusca" placeholder="Buscar acervo..." />
					<ul class="sortable-list" id="acervo">
						<c:forEach var="titulo" items="${titulo}">
							<li class="sortable-item" id="${titulo.id}" data-l="acervo"
								style="font-size: 12px;"><c:out value="${titulo.nome}" /></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="clearer"></div>
		</div>
		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>






