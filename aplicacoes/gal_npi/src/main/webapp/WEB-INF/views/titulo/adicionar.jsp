<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>Adicionar Título</title>
	<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />
		<form:form servletRelativeAction="/titulo/adicionar" method="post" modelAttribute="titulo" role="form" class="form-horizontal">
			
			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Adicionar Título</label>
			</div>
			
			<div class="form-group">
			    <label for="nome" class="col-sm-1 control-label">Nome</label>
			    <div class="col-sm-10">
			    	<form:input id="nome" class="form-control" placeholder="Nome" path="nome" disabled="true"/>
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
			    	<form:input id="titulo" class="form-control" placeholder="Titulo" path="titulo" />
			    	<form:errors path="titulo" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">titulo N</label>
			    <div class="col-sm-10">
			    	<form:input id="titulo_n" class="form-control" placeholder="titulo N" path="titulo_n"/>
			    	<form:errors path="titulo_n" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Sub titulo</label>
			    <div class="col-sm-10">
			    	<form:input id="sub_titulo" class="form-control" placeholder="Sub titulo" path="subTitulo"/>
			    	<form:errors path="subTitulo" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="isbn" class="col-sm-1 control-label">Isbn</label>
			    <div class="col-sm-10">
			    	<form:input id="isbn" class="form-control" placeholder="Isbn" path="isbn"/>
			    	<form:errors path="isbn" cssClass="error" />
			    </div>
			</div>
						
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">titulo Revista</label>
			    <div class="col-sm-10">
			    	<form:input id="titulo_revista" class="form-control" placeholder="titulo Revista" path="tituloRevista"/>
			    	<form:errors path="tituloRevista" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Paginas</label>
			    <div class="col-sm-10">
			    	<form:input id="pagina" class="form-control" placeholder="pagina" path="pagina"/>
			    	<form:errors path="pagina" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Ref Artigo</label>
			    <div class="col-sm-10">
			    	<form:input id="ref_artigo" class="form-control" placeholder="Ref Artigo" path="refArtigo"/>
			    	<form:errors path="refArtigo" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Edicao</label>
			    <div class="col-sm-10">
			    	<form:input id="edicao" class="form-control" placeholder="Edicao" path="edicao"/>
			    	<form:errors path="edicao" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Publicador</label>
			    <div class="col-sm-10">
			    	<form:input id="publicador" class="form-control" placeholder="Publicador" path="publicador"/>
			    	<form:errors path="publicador" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="tipo" class="col-sm-1 control-label">Tipo</label>
			    <div class="col-sm-10">
			    	<form:select path="tipo" class="form-control">
			    		<form:option value="Físico">Físico</form:option>
			    		<form:option value="Virtual">Virtual</form:option>
			    	</form:select>
			    	<form:errors path="tipo" cssClass="error" />
			    </div>
			</div>
			
			
			
			
			
			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit" value="Adicionar"/>
				<a href="<c:url value="/titulo/listar"></c:url>" class="btn btn-default">Cancelar</a>
			</div>
		</form:form>
		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>