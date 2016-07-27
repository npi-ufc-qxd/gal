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
	<div id="container">
	<jsp:include page="../fragments/header.jsp" />
		<section id="main-content">
          <section class="wrapper">
			<input id="componenteId" type="hidden" value="${componente.id}" />				
				<div id="drag-and-drop">
					<p id="nomeComponente">${componente.codigo}-${componente.nome}</p>
					<p>					
						<a class="btn btn-success" id="btn-get" href="<c:url value="/componente/listar" ></c:url>">Vincular</a>
					</p>					
						<div class="col-lg-4 col-md-4 col-sm-4">
							<div class="showback">				
								<label style="font-size: 16px;">Básica</label>
								<ul class="sortable-list" id="basica">
									<c:forEach var="basica" items="${basica}">	
										<li class="sortable-item" id="${basica.id}" style="font-size: 12px;">
											<div class="alert alert-success" style="text-align:left;cursor:pointer;">
												<c:out value="${basica.nome}" />
											</div>
										</li>							
									</c:forEach>
								</ul>
							</div>
						</div>	
						
						<div class="col-lg-4 col-md-4 col-sm-4">
							<div class="showback">
								<label style="font-size: 16px;">Complementar</label>
								<ul class="sortable-list" id="complementar">
									<c:forEach var="complementar" items="${complementar}">
										<li class="sortable-item" id="${complementar.id}" style="font-size: 12px;">
											<div class="alert alert-info" style="text-align:left;cursor:pointer;">
												<c:out value="${complementar.nome}" />
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
						
						<div class="col-lg-4 col-md-4 col-sm-4" style='overflow-x: hidden; overflow-y: auto;height:1200px;'>	
							<div class="showback" >
								<label style="font-size: 16px;">Acervo</label> 
								<br><input type="text" id="txtBusca" placeholder="Buscar acervo..." />
								<br><ul class="sortable-list" id="acervo">
									<c:forEach var="titulo" items="${titulo}">
										<li class="sortable-item" id="${titulo.id}" data-l="acervo" style="font-size: 12px;">
											<div class="alert alert-warning" style="text-align:left;cursor:pointer;">
												<c:out value="${titulo.nome}" />
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
				</div>

				
			<div class="clearer"></div>
		</section>
	</section>
	<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>






