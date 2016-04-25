<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<title>Componente Curricular</title>
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
		
		<button class="btn btn-default" onclick="goBack()">
			Voltar
		</button>
		
		<c:if test="${empty componente}">
			<div class="alert alert-warning" role="alert">Componente curricular inexistente</div>
		</c:if>
		
		<c:if test="${not empty componente}">
			<div style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Componente Curricular</label>
			</div>
			
			<p>Nome: <b>${componente.nome}</b></p>
			<p>Código: <b>${componente.codigo}</b></p>
			<p>Tipo: <b>${componente.tipo}</b></p>
			
			<sec:authorize access="hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO')">
				<div id="button-add">
					<a href="<c:url value="/componente/${componente.id}/copiar" ></c:url>">
						<button class="btn btn-primary">
							<span class="glyphicon glyphicon-copy"></span> Copiar Componente Curricular
						</button>
					</a>
				</div>
			</sec:authorize>
			
			<hr>
			
			<h4>Integrações Curriculares</h4>
			<c:if test="${empty curriculos}">
				<div class="alert alert-warning" role="alert">Este componente curicular não possui integrações curriculares cadastradas</div>
			</c:if>
			
			<c:if test="${not empty curriculos}">
				<div class="row">
					<div class="col-md-8">
						<table class="table table-condensed table-striped table-bordered">
							<thead>
								<tr>
									<th>Curso</th>
									<th>Semestre de Oferta</th>
									<th>Quantidade de Alunos</th>
									<th>Horas Práticas</th>
									<th>Horas Teóricas</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach var="curriculo" items="${curriculos}">
									<tr>
										<td>${curriculo.estruturaCurricular.curso.nome}</td>
										<td>${curriculo.semestreOferta}</td>
										<td>${curriculo.quantidadeAlunos}</td>
										<td>${curriculo.componente.chPratica}</td>
										<td>${curriculo.componente.chTeorica}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</c:if>
			
			<hr>
			
			<h4>Bibliografias</h4>
			<button id="expandirTodosAccordions" class="btn btn-default btn-xs">Expandir Todas</button>
			<button id="esconderTodosAccordions" class="btn btn-default btn-xs">Esconder Todas</button>
			
			<hr>
			
			<h4>Bibliografia Básica</h4>
			<c:if test="${empty bibliografia_basica}">
				<div class="alert alert-warning" role="alert">Este componente curricular não possui bibliografia básica cadastrada.</div>
			</c:if>
			<c:if test="${not empty bibliografia_basica}">
				<div class="panel-group" id="accordionBasica" role="tablist" aria-multiselectable="true">
					<c:forEach var="basica" items="${bibliografia_basica}">
						<div class="panel panel-default">
							<div class="componente-bibliografia-panel-heading panel-heading <c:if test="${basica.cadastradoBiblioteca == false}">bibliografia-virtual-nao-cadastrada</c:if>" role="tab">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse" href="#${basica.id}" aria-expanded="false" aria-controls="${basica.id}">
							        	${basica.nome}
									</a>
								</h4>
							</div>
							<div id="${basica.id}" class="panel-collapse collapse" role="tabpanel">
								<div class="componente-bibliografia-panel-body panel-body">
						      		<p><b>Acervo</b>: ${basica.acervo}</p>
						      		<p><b>Tipo</b>: ${basica.tipo} <c:if test="${basica.cadastradoBiblioteca == false}">- Não cadastrado na biblioteca</c:if></p>
						      		<div class="row">
						      			<div class="col-md-5">
											<table class="table table-condensed table-striped table-bordered">
												<thead>
													<tr>
														<th>Meta</th>
														<th>Valor da Meta</th>
														<th>Déficit</th>
													</tr>
												</thead>
												
												<tbody>
													<c:forEach var="titulo" items="${metasCalculadas}">
										      			<c:if test="${titulo.key == basica.nome}">
										      				<c:forEach var="meta" items="${titulo.value}">
										      					<tr>
											      					<td>${meta.nome}</td>
											      					<td><fmt:formatNumber type="number" maxFractionDigits="1" value="${meta.calculo}"></fmt:formatNumber></td>
											      					<td>
											      						<c:choose>
												      						<c:when test="${(meta.calculo - basica.acervo) > 0}">
												      							<fmt:formatNumber type="number" maxFractionDigits="1" value="${meta.calculo - basica.acervo}"></fmt:formatNumber>
												      						</c:when>
												      						<c:otherwise>
												      							0
												      						</c:otherwise>
											      						</c:choose>
											      					</td>
										      					</tr>
										      				</c:forEach>
										      			</c:if>
										      		</c:forEach>
												</tbody>
											</table>
										</div> <!-- .col-md-5 -->
									</div> <!-- .row -->
								</div> <!-- .componente-bibliografia-panel-body -->
							</div> <!-- .panel-collapse -->
						</div> <!-- .panel -->
					</c:forEach>
				</div> <!-- .panel-group -->
			</c:if>
			
			<hr>
			
			<h4>Bibliografia Complementar</h4>
			<c:if test="${empty bibliografia_complementar}">
				<div class="alert alert-warning" role="alert">Este componente curricular não possui bibliografia complementar cadastrada.</div>
			</c:if>
			<c:if test="${not empty bibliografia_complementar}">
				<div class="panel-group" id="accordionComplementar" role="tablist" aria-multiselectable="true">
					<c:forEach var="complementar" items="${bibliografia_complementar}">
						<div class="panel panel-default">
							<div class="componente-bibliografia-panel-heading panel-heading <c:if test="${complementar.cadastradoBiblioteca == false}">bibliografia-virtual-nao-cadastrada</c:if>" role="tab">
								<div class="panel-title">
									<a role="button" data-toggle="collapse" href="#${complementar.id}" aria-expanded="false" aria-controls="${complementar.id}">
							        	${complementar.nome}
									</a>
								</div>
							</div>
							<div id="${complementar.id}" class="panel-collapse collapse" role="tabpanel">
								<div class="componente-bibliografia-panel-body panel-body">
						      		<p><b>Acervo</b>: ${complementar.acervo}</p>
						      		<p><b>Tipo</b>: ${complementar.tipo} <c:if test="${complementar.cadastradoBiblioteca == false}">- Não cadastrado na biblioteca</c:if></p>
						      		<div class="row">
						      			<div class="col-md-5">
											<table class="table table-condensed table-striped table-bordered">
												<thead>
													<tr>
														<th>Meta</th>
														<th>Valor da Meta</th>
														<th>Déficit</th>
													</tr>
												</thead>
												
												<tbody>
													<c:forEach var="titulo" items="${metasCalculadas}">
										      			<c:if test="${titulo.key == complementar.nome}">
										      				<c:forEach var="meta" items="${titulo.value}">
										      					<tr>
											      					<td>${meta.nome}</td>
											      					<td><fmt:formatNumber type="number" maxFractionDigits="1" value="${meta.calculo}"></fmt:formatNumber></td>
											      					<td>
											      						<c:choose>
												      						<c:when test="${(meta.calculo - complementar.acervo) > 0}">
												      							<fmt:formatNumber type="number" maxFractionDigits="1" value="${meta.calculo - complementar.acervo}"></fmt:formatNumber>
												      						</c:when>
												      						<c:otherwise>
												      							0
												      						</c:otherwise>
											      						</c:choose>
											      					</td>
										      					</tr>
										      				</c:forEach>
										      			</c:if>
										      		</c:forEach>
												</tbody>
											</table>
										</div> <!-- .col-md-5 -->
									</div> <!-- .row -->
								</div> <!-- .componente-bibliografia-panel-body -->
							</div> <!-- .panel-collapse -->
						</div> <!-- .panel -->
					</c:forEach>
				</div> <!-- .panel-group -->
			</c:if>
			
		</c:if>

		<jsp:include page="../fragments/footer.jsp" />
		<script src="<c:url value="/resources/js/componente-visualizar.js" />"></script>
	</div>
</body>
</html>