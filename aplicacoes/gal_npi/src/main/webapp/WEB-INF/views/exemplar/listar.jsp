<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
	<title>Exemplares</title>
	<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />		
		<section id="main-content">
          	<section class="wrapper"> 
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
				<c:if test="${empty exemplares}">
					<div class="alert alert-warning" role="alert">Não há títulos cadastrados.</div>
				</c:if>
          	<div class="col-lg-12">
          	<div class="form-panel">
		
			<sec:authorize access="hasAnyRole('COORDENACAO_ACADEMICA','BIBLIOTECARIO')">
				<a href="<c:url value="/exemplar/${titulo.id}/adicionar" ></c:url>">
					<button class="btn btn-primary pull-right" style="margin-bottom: 10px;"><span class="glyphicon glyphicon-plus" ></span> Adicionar</button>
				</a>
			</sec:authorize>

		<div style="text-align: center;">
			<label class="control-label" style="font-size: 15px;"><c:out value="${titulo.nome}"></c:out></label>
		</div>
		
		<c:if test="${not empty exemplares}">
			<sec:authorize access="hasAnyRole('COORDENACAO_ACADEMICA','BIBLIOTECARIO')">
				<datatables:table id="exemplarTable" data="${exemplares}" cdn="true"
					row="exemplar" theme="bootstrap2" cssClass="table table-striped">
					<datatables:column title="Codido do Exemplar">
						<c:out value="${exemplar.codigoExemplar}"></c:out>
					</datatables:column>
					
					<datatables:column title="Editar">
						<a class="btn btn-primary btn-xs" href="<c:url value = "/exemplar/${exemplar.id}/editar"></c:url>">
							<span class="glyphicon glyphicon-edit"></span>
						</a>
					</datatables:column>
			
					<datatables:column title="Excluir">
						<a id="excluir" class="open-CodigoExemplar btn btn-danger btn-xs" 
							data-toggle="modal" data-target="#confirm-delete" href="#"
							data-id="${exemplar.codigoExemplar}"
							data-href="<c:url value="/exemplar/${exemplar.id}/excluir" ></c:url>">
							<span class="glyphicon glyphicon-trash"></span>
						</a>
					</datatables:column>
				</datatables:table>
			</sec:authorize>
			<sec:authorize access="!hasAnyRole('BIBLIOTECARIO', 'COORDENACAOACADEMICA')">
				<datatables:table id="exemplarTable" data="${exemplares}" cdn="true"
					row="exemplar" theme="bootstrap2" cssClass="table table-striped">
					
					<datatables:column title="Codido do Exemplar">
						<c:out value="${exemplar.codigoExemplar}"></c:out>
					</datatables:column>
					
				</datatables:table>
			</sec:authorize>
		</c:if>
		</div>
		</div>
		</section>
		</section>
		
		<jsp:include page="../fragments/footer.jsp" />
	</div>
	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" 
		aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header"> Excluir </div>
	            <div class="modal-body">
	                <p id="mensagem"></p>
	            </div>
	            <div class="modal-footer">
	                <a href="#" class="btn btn-danger">Excluir</a>
	                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>
