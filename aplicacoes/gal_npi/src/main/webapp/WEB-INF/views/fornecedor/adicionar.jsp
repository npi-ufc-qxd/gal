<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="br.ufc.npi.gal.model.TipoTitulo" %>

<!DOCTYPE html>
<html>
<head>
	<title>Adicionar Fornecedor</title>
	<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />
		<section id="main-content">
          	<section class="wrapper"> 
          	<div class="col-lg-12">
          	<div class="form-panel">
		<form:form servletRelativeAction="/fornecedor/adicionar" method="post" modelAttribute="fornecedor" role="form" class="form-horizontal">
			
			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Adicionar Título</label>
			</div>
			
			<div class="form-group">
			    <label for="nome" class="col-sm-1 control-label">Nome</label>
			    <div class="col-sm-10">
			    	<form:input id="nome" class="form-control" placeholder="Nome" path="nome"/>
			    	<form:errors path="nome" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="apelido" class="col-sm-1 control-label">Apelido</label>
			    <div class="col-sm-10">
			    	<form:input id="apelido" class="form-control" placeholder="Apelido" path="apelido" />
			    	<form:errors path="apelido" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="cnpj" class="col-sm-1 control-label">CNPJ</label>
			    <div class="col-sm-10">
			    	<form:input id="cnpj" class="form-control" placeholder="CNPJ" path="cnpj"/>
			    	<form:errors path="cnpj" cssClass="error" />
			    </div>
			</div>
			
			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit" value="Adicionar"/>
				<a href="<c:url value="/titulo/listar"></c:url>" class="btn btn-default">Cancelar</a>
			</div>
		</form:form>
		</div>
		</div>
		</section>
		</section>
		<jsp:include page="../fragments/footer.jsp" />
		<script src="<c:url value="/resources/js/titulo-adicionar.js" />"></script>
		<script src="<c:url value="/resources/js/titulo-editar.js" />"></script>
	</div>
</body>
</html>