<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>Compras</title>
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
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<c:out value="${info}"></c:out>
			</div>
		</c:if>
          	
       	<div class="col-lg-12">
       		<div class="form-panel">
          	
		<div id="button-add ">
			<a href="<c:url value="/compra/adicionar" ></c:url>">
				<button class="btn btn-primary pull-right " style="margin-bottom: 10px;">
					<span class="glyphicon glyphicon-plus"></span> Adicionar
				</button>
			</a>
		</div>

		<div style="text-align: center;">
			<label class="control-label" style="font-size: 20px;">Carrinhos de compras</label>
		</div>

		<c:if test="${empty compras}">
			<div class="alert alert-warning" role="alert">Não há carrinho de compras cadastrado.</div>
		</c:if>

		<c:if test="${not empty compras}">
			<c:set var="index" value="0" />
			<datatables:table id="comprasTable" data="${compras}" cdn="false"
				row="compra" theme="bootstrap2" cssClass="table table-bordered table-striped table-orderable"
				no-sort-fields="4" default-sort="0 asc">
				<c:set var="index" value="${index + 1}" />
				<fmt:formatDate value="${compra.criadaEm}" pattern="dd/MM/yyyy" var="criadaEm" />
				<fmt:formatDate value="${compra.atualizadaEm}" pattern="dd/MM/yyyy" var="atualizadaEm" />
				<datatables:column title="Criado Em">
					<c:out value="${criadaEm}"></c:out>
				</datatables:column>

				<datatables:column title="Atualizado Em">
					<c:out value="${atualizadaEm}"></c:out>
				</datatables:column>

				<datatables:column title="Nº do carrinho de compras">
					<c:out value="${index}º Carrinho de compras"></c:out>
				</datatables:column>
				
				<datatables:column title="Total de Itens">
					<c:out value="${compra.itens.size()}"></c:out>
				</datatables:column>
				
				<datatables:column title="Painel de Compras"  style="text-align: center;">
					<a class="btn btn-info btn-xs" 
						href="<c:url value = "/compra/${compra.id}/painel"></c:url>">
						<span class="glyphicon glyphicon-edit"></span>
					</a>
				</datatables:column>
				
				<datatables:column title="Detalhes"  style="text-align: center;">
					<a class="btn btn-info btn-xs" 
						href="<c:url value = "/compra/${compra.id}/detalhes"></c:url>">
						<span class="glyphicon glyphicon-eye-open"></span>
					</a>
				</datatables:column>
			</datatables:table>
		</c:if>
		</div>
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
