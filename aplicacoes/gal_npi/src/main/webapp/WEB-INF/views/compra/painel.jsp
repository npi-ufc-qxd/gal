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
	<title>Painel de Compras</title>
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
       		
       		<form:form servletRelativeAction="/compra/${compra.id}/item/adicionar" method="post" modelAttribute="item" role="form" class="form-horizontal">
			
			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Adicionar Item</label>
			</div>
			
			<div class="form-group">
				<label for="titulo" class="col-sm-1 control-label">Título</label>
			    <div class="col-sm-10">
			    	<form:select path="titulo.id" id="select-titulo" class="form-control">		 
			    		<form:option value="" selected="selected"> -- Selecione um título -- </form:option>   		
			    		<c:forEach items="${titulos}" var="titulo">
			    			<form:option value="${titulo.id}">${titulo.nome}</form:option>
			    		</c:forEach>
			    	</form:select>
			    	<form:errors path="titulo.id" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="quantidade" class="col-sm-1 control-label">Quantidade</label>
			    <div class="col-sm-10">
			    	<form:input id="quantidade" class="form-control" placeholder="Quantidade" path="quantidade" />
			    	<form:errors path="quantidade" cssClass="error" />
			    </div>
			</div>

			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit" value="Adicionar"/>
			</div>
		</form:form>
		<br /><br />
		<div style="text-align: center;">
			<label class="control-label" style="font-size: 20px;">Carrinho de compras</label>
		</div>

		<c:if test="${empty compra.itens}">
			<div class="alert alert-warning" role="alert">Não há itens cadastrados neste carrinho.</div>
		</c:if>

		<c:if test="${not empty compra.itens}">
			<datatables:table id="itensTable" data="${compra.itens}" cdn="false"
				row="item" theme="bootstrap2" cssClass="table table-bordered table-striped table-orderable"
				no-sort-fields="" default-sort="0 asc">
				
				<datatables:column title="Título">
					<c:out value="${item.titulo.nome}"></c:out>
				</datatables:column>

				<datatables:column title="Quantidade real">
					<c:out value="0"></c:out>
				</datatables:column>
				
				<datatables:column title="Comprando">
					<c:out value="${item.quantidade}"></c:out>
				</datatables:column>
				
				<datatables:column title="Valor Unitário Médio">
					<c:out value="0"></c:out>
				</datatables:column>
				
				<datatables:column title="Valor Total Médio">
					<c:out value="0"></c:out>
				</datatables:column>
			</datatables:table>
		</c:if>
		</div>
		</div>
		</section>
		</section>
		<jsp:include page="../fragments/footer.jsp" />
		<script src="<c:url value="/resources/js/painel-compras.js" />"></script>
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
