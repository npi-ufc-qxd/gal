<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="br.ufc.npi.gal.model.TipoTitulo" %>

<!DOCTYPE html>
<html>
<head>
	<title>Adicionar Título</title>
	<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />
		<section id="main-content">
          	<section class="wrapper"> 
          	<div class="col-lg-12">
          	<div class="form-panel">
		<form:form servletRelativeAction="/titulo/adicionar" method="post" modelAttribute="titulo" role="form" class="form-horizontal">
			
			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Adicionar Título</label>
			</div>
			
			<div class="form-group">
			    <label for="nome" class="col-sm-1 control-label">Nome</label>
			    <div class="col-sm-10">
			    	<form:input id="nome" class="form-control" placeholder="Nome" path="nome" readonly="true"/>
			    	<form:errors path="nome" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Autor</label>
			    <div class="col-sm-10">
			    	<form:input id="autor" class="form-control" placeholder="Autor" path="autor" />
			    	<form:errors path="autor" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Título</label>
			    <div class="col-sm-10">
			    	<form:input id="nome_titulo" class="form-control" placeholder="Titulo" path="titulo"/>
			    	<form:errors path="titulo" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Título N</label>
			    <div class="col-sm-10">
			    	<form:input id="titulo_n" class="form-control" placeholder="Título N" path="titulo_n"/>
			    	<form:errors path="titulo_n" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Sub título</label>
			    <div class="col-sm-10">
			    	<form:input id="sub_titulo" class="form-control" placeholder="Sub título" path="subTitulo" />
			    	<form:errors path="subTitulo" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="isbn" class="col-sm-1 control-label">Isbn</label>
			    <div class="col-sm-10">
			    	<form:input id="isbn" class="form-control" placeholder="Isbn" path="isbn" />
			    	<form:errors path="isbn" cssClass="error" />
			    </div>
			</div>
						
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Titulo Revista</label>
			    <div class="col-sm-10">
			    	<form:input id="titulo_revista" class="form-control" placeholder="Titulo Revista" path="tituloRevista" />
			    	<form:errors path="tituloRevista" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Páginas</label>
			    <div class="col-sm-10">
			    	<form:input id="pagina" class="form-control" placeholder="Páginas" path="pagina" />
			    	<form:errors path="pagina" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Ref Artigo</label>
			    <div class="col-sm-10">
			    	<form:input id="ref_artigo" class="form-control" placeholder="Ref Artigo" path="refArtigo" />
			    	<form:errors path="refArtigo" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Edição</label>
			    <div class="col-sm-10">
			    	<form:input id="edicao" class="form-control" placeholder="Edição" path="edicao" />
			    	<form:errors path="edicao" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Publicador</label>
			    <div class="col-sm-10">
			    	<form:input id="publicador" class="form-control" placeholder="Publicador" path="publicador" />
			    	<form:errors path="publicador" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="tipo" class="col-sm-1 control-label">Tipo</label>
			    <div class="col-sm-10">
			    	<form:select path="tipo" class="form-control">
			    		<form:option value="${TipoTitulo.FISICO.descricao}">${TipoTitulo.FISICO.descricao}</form:option>
			    		<form:option value="${TipoTitulo.VIRTUAL.descricao}">${TipoTitulo.VIRTUAL.descricao}</form:option>
			    	</form:select>
			    	<form:errors path="tipo" cssClass="error" />
			    </div>
			</div>
			
			<div id="inputCadastradoBiblioteca" class="form-group" style="display: none;">
			    <div class="col-sm-4">
			    	<form:checkbox path="cadastradoBiblioteca" label="Cadastrado na Biblioteca?" style="margin:0 8px;"/>
			    	<form:errors path="cadastradoBiblioteca" cssClass="error" />
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