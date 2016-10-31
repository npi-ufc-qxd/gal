<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>Editar Cotação</title>
	<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />
		<section id="main-content">
          	<section class="wrapper"> 
          	<div class="col-lg-12">
          	<div class="form-panel">
		<form:form servletRelativeAction="/cotacao/editar" method="post" modelAttribute="cotacao" role="form" class="form-horizontal">
			<form:input path="id" type="hidden" />

			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Editar Cotação</label>
			</div>
			
			<div class="form-group">
				<label for="fornecedor" class="col-sm-1 control-label">Fornecedor</label>
			    <div class="col-sm-10">
			    	
			    	<form:select path="fornecedor.id" id="select-fornecedor" class="form-control">		 
			    		<form:option value="${fornecedor.id}" selected="selected">-- Selecione um Fornecedor</form:option>   		
			    		<c:forEach items="${fornecedores}" var="fornecedor">
			    			<form:option value="${fornecedor.id}">${fornecedor.nome}</form:option>
			    		</c:forEach>
			    	</form:select>
			    	<form:errors path="fornecedor.id" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
				<label for="titulo" class="col-sm-1 control-label">Título</label>
			    <div class="col-sm-10">
			    	<form:select path="titulo.id" id="select-titulo" class="form-control">		 
			    		<form:option value="${fornecedor.id}" selected="selected"> -- Selecione um título -- </form:option>   		
			    		<c:forEach items="${titulos}" var="titulo">
			    			<form:option value="${titulo.id}">${titulo.nome}</form:option>
			    		</c:forEach>
			    	</form:select>
			    	<form:errors path="titulo.id" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="valor" class="col-sm-1 control-label">Valor</label>
			    <div class="col-sm-10">
			    	<form:input id="valor" class="form-control" placeholder="Valor" path="valor" />
			    	<form:errors path="valor" cssClass="error" />
			    </div>
			</div>

			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit" value="Atualizar"/>
				<a href="<c:url value="/cotacao/listar"></c:url>" class="btn btn-default">Cancelar</a>
			</div>
		</form:form>
		</div>
		</div>
		</section>
		</section>
		<jsp:include page="../fragments/footer.jsp" />
		<script src="<c:url value="/resources/js/cotacao-adicionar.js" />"></script>
	</div>
</body>
</html>