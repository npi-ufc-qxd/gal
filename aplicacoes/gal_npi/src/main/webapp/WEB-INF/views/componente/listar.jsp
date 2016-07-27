<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>Componentes Curriculares</title>
<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">

		<jsp:include page="../fragments/header.jsp" />
		<section id="main-content">
          	<section class="wrapper">
         		<c:if test="${not empty error}">
					<div class="alert alert-danger alert-dismissible" role="alert">
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						<c:out value="${error}"></c:out>
					</div>
				</c:if>
				<c:if test="${not empty info}">
					<div class="alert alert-info alert-dismissible" role="alert">
						<c:out value="${info}"></c:out>
						<button type="button" class="close" data-dismiss="alert">
							<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
						</button>
						
					</div>
				</c:if>
				
				<c:if test="${empty componentes}">
					<div class="alert alert-warning" role="alert">Não há
						componentes curriculares cadastrados.</div>
				</c:if>
          		    		
				<div class="row mt">
		         	<div class="col-lg-12">
          			<div class="form-panel">
          			
          		<sec:authorize access="hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO','COORDENACAO_ACADEMICA')">
					<div id="button-add" style="aligne='right'">
						<a href="<c:url value="/componente/adicionar" ></c:url>">
							<button class="btn btn-primary pull-right" style="margin-bottom: 10px;">
								<span class="glyphicon glyphicon-plus"></span> Adicionar</button>
						</a>
					</div>
				</sec:authorize>	
		
				<c:if test="${not empty componentes}">
						<sec:authorize access="hasAnyRole('COORDENACAO_ACADEMICA')">
							<table id="disciplinaTable" class="table table-striped table-orderable" no-sort-fields="3 4 5 6" default-sort="0 asc">
							 <h4>Componentes Curriculares</h4>
								<thead>
									<tr>
										<th>Nome</th>
										<th>Código</th>
										<th>Tipo</th>
										<th>Visualizar</th>
										<th>Vincular</th>
										<th>Editar</th>
										<th>Excluir</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="componente" items="${componentes}">
										<tr>
											<td class="nomeComponente" idComponente="${componente.id}">
												<c:out value="${componente.nome}"></c:out>
											</td>
											<td><c:out value="${componente.codigo}"></c:out></td>											
											<td><c:out value="${componente.tipo}"></c:out></td>
											<td style="text-align:center;">
												<a class="btn btn-info btn-xs" href="<c:url value="/componente/${componente.id}/visualizar"></c:url>">
													<span class="glyphicon glyphicon-eye-open"></span>
												</a>
											</td>
											<td style="text-align:center;">
												<a class="btn btn-success btn-xs" href="<c:url value="/componente/${componente.id}/vincular"></c:url>">
													<span class="glyphicon glyphicon-link"></span>
												</a>
											</td>
											<td style="text-align:center;">
												<a class="btn btn-primary btn-xs" href="<c:url value="/componente/${componente.id}/editar" ></c:url>">
													<span class="glyphicon glyphicon-edit"></span>
												</a>
											</td>
											<td style="text-align:center;">
												<a id="excluir" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#confirm-delete" href="#" data-href="<c:url value="/componente/${componente.id}/excluir" ></c:url>">
													<span class="glyphicon glyphicon-trash"></span>
												</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
	
					
				</sec:authorize>
				<sec:authorize access="!hasAnyRole('COORDENACAO_ACADEMICA')">
					<table id="disciplinaTable" class="table table-striped table-orderable" default-sort="0 asc">
						<thead>
							<tr>
								<th>Nome</th>
								<th>Código</th>
								<th>Tipo</th>
								<th>Visualizar</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="componente" items="${componentes}">
								<tr>
									<td class="nomeComponente" idComponente="${componente.id}">
										<c:out value="${componente.nome}"></c:out>
									</td>
									<td><c:out value="${componente.codigo}"></c:out></td>
									<td><c:out value="${componente.tipo}"></c:out></td>
									<td>
										<a class="btn btn-info btn-xs" href="<c:url value="/componente/${componente.id}/visualizar"></c:url>">
											<span class="glyphicon glyphicon-eye-open"></span>
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</sec:authorize>
			</c:if>
			</div><!-- /content-panel -->
		</div><!-- /col-md-12 -->
	</div>	
		</section>
      </section>
		<jsp:include page="../fragments/footer.jsp" />
		<script src="<c:url value="/resources/js/tabela.js" />"></script>
	</div>
	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">Excluir</div>
				<div class="modal-body">Tem certeza de que deseja excluir esse
					componente curricular?</div>
				<div class="modal-footer">
					<a href="#" class="btn btn-danger">Excluir</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
