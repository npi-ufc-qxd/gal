<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
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
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<c:out value="${info}"></c:out>
			</div>
		</c:if>

		<sec:authorize access="hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO')">
			<div id="button-add">
				<a href="<c:url value="/componente/adicionar" ></c:url>">
					<button class="btn btn-primary">
						<span class="glyphicon glyphicon-plus"></span> Adicionar
					</button>
				</a>
			</div>
		</sec:authorize>

		<div style="text-align: center;">
			<label class="control-label" style="font-size: 20px;">Componentes Curriculares</label>
		</div>

		<c:if test="${empty componentes}">
			<div class="alert alert-warning" role="alert">Não há
				componentes curriculares cadastrados.</div>
		</c:if>

		<c:if test="${not empty componentes}">
			<sec:authorize access="hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO')">
				<datatables:table id="disciplinaTable" data="${componentes}" cdn="false"
					row="componente" theme="bootstrap2" cssClass="table table-striped table-orderable" no-sort-fields="2 3 4" default-sort="0 asc">
					<datatables:column title="Nome">
						<a class="adark" href="<c:url value="/componente/${componente.id }/visualizar" ></c:url>" ><c:out value="${componente.nome}"></c:out></a>
					</datatables:column>
			
					<datatables:column title="Codigo">
						<c:out value="${componente.codigo}"></c:out>
					</datatables:column>
					
					<datatables:column title="CH Prática">
						<c:out value="${componente.chPratica}"></c:out>
					</datatables:column>
					<datatables:column title="CH Teórica">
						<c:out value="${componente.chTeorica}"></c:out>
					</datatables:column>
					<datatables:column title="Tipo">
						<c:out value="${componente.tipo}"></c:out>
					</datatables:column>
						
					<datatables:column title="Vincular">
						<a class="btn btn-success" href="<c:url value="/componente/${componente.id }/vincular" ></c:url>"><span class="glyphicon glyphicon-link"></span></a>
					</datatables:column>
							
					<datatables:column title="Editar">
						<a class="btn btn-primary" href="<c:url value="/componente/${componente.id }/editar" ></c:url>"><span class="glyphicon glyphicon-edit"></span></a>
					</datatables:column>
				
					<datatables:column title="Excluir">
						<a id="excluir" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#" data-href="<c:url value="/componente/${componente.id}/excluir" ></c:url>">
							<span class="glyphicon glyphicon-trash"></span>
						</a>	
					</datatables:column>
				</datatables:table>
			</sec:authorize>
			<sec:authorize access="!hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO')">
				<datatables:table id="disciplinaTable" data="${componentes}" cdn="false"
					row="componente" theme="bootstrap2" cssClass="table table-striped table-orderable" no-sort-fields="2 3 4" default-sort="0 asc">
					
					<datatables:column title="Nome">
						<a class="adark" href="<c:url value="/componente/${componente.id }/visualizar" ></c:url>" ><c:out value="${componente.nome}"></c:out></a>
					</datatables:column>
			
					<datatables:column title="Codigo">
						<c:out value="${componente.codigo}"></c:out>
					</datatables:column>
					
					<datatables:column title="CH Pratica">
						<c:out value="${componente.chPratica}"></c:out>
					</datatables:column>
					<datatables:column title="CH Teorica">
						<c:out value="${componente.chTeorica}"></c:out>
					</datatables:column>
					<datatables:column title="Tipo">
						<c:out value="${componente.tipo}"></c:out>
					</datatables:column>
				</datatables:table>
			</sec:authorize>
		</c:if>

		<jsp:include page="../fragments/footer.jsp" />
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
