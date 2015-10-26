<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
	<title>Editar Conflito</title>
	<jsp:include page="../fragments/htmlHead.jsp" />
</head>

<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />
		
		<c:if test="${not empty info}">
			<div class="alert alert-info alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
				<c:out value="${info}"></c:out>
			</div>
		</c:if>

		<form:form modelAttribute="exemplar" id="reg" servletRelativeAction="/acervo/editar" method="post" role="form" class="form-horizontal">
			<div class="form-group" style="text-align: center;">
					<label class="control-label" style="font-size: 20px;">Editar Conflito</label>
			</div>
			
			<form:input path="id" type="hidden" />
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Título</label>
			    <div class="col-sm-8">
			    	<form:input id="titulo" class="form-control" placeholder="Titulo" path="titulo" />
			    	<form:errors path="titulo" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="tipo" class="col-sm-1 control-label">Tipo</label>
			    <div class="col-sm-8">
			    	<form:select path="tipo" class="form-control">
			    		<form:option value="">Vazio</form:option>
			    		<form:option value="0">Físico</form:option>
			    		<form:option value="1">Virtual</form:option>
			    	</form:select>
			    	<form:errors path="tipo" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">ISBN</label>
			    <div class="col-sm-8">
			    	<form:input id="isbn" class="form-control" placeholder="isbn" path="isbn" />
			    	<form:errors path="isbn" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Autor</label>
			    <div class="col-sm-8">
			    	<form:input id="autor" class="form-control" placeholder="autor" path="autor" />
			    	<form:errors path="autor" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Código</label>
			    <div class="col-sm-8">
			    	<form:input id="codigo" class="form-control" placeholder="Código" path="codigoExemplar"/>
			    	<form:errors path="codigoExemplar" cssClass="error" />

			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Titulo_n</label>
			    <div class="col-sm-8">
			    	<form:input id="titulo_n" class="form-control" placeholder="titulo_n" path="titulo_n"/>
			    	<form:errors path="titulo_n" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Sub_titulo</label>
			    <div class="col-sm-8">
			    	<form:input id="sub_titulo" class="form-control" placeholder="sub_titulo" path="subTitulo"/>
			    	<form:errors path="subTitulo" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Titulo_revista</label>
			    <div class="col-sm-8">
			    	<form:input id="titulo_revista" class="form-control" placeholder="titulo_revista" path="tituloRevista"/>
			    	<form:errors path="tituloRevista" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Paginas</label>
			    <div class="col-sm-8">
			    	<form:input id="pagina" class="form-control" placeholder="pagina" path="pagina"/>
			    	<form:errors path="pagina" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Publicador</label>
			    <div class="col-sm-8">
			    	<form:input id="publicador" class="form-control" placeholder="publicador" path="publicador"/>
			    	<form:errors path="publicador" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Ref_artigo</label>
			    <div class="col-sm-8">
			    	<form:input id="ref_artigo" class="form-control" placeholder="ref_artigo" path="refArtigo"/>
			    	<form:errors path="refArtigo" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Edicao</label>
			    <div class="col-sm-8">
			    	<form:input id="edicao" class="form-control" placeholder="edicao" path="edicao"/>
			    	<form:errors path="edicao" cssClass="error" />
			    </div>
			</div>
			
			<div class="form-group">
			    <label for="codigo" class="col-sm-1 control-label">Descrição Erro</label>
			    <div class="col-sm-8">
			    	<form:input id="descricaoErro" class="form-control" placeholder="descricaoErro" path="descricaoErro" disabled="true"/>
			    	<form:errors path="descricaoErro" cssClass="error" />
			    </div>
			</div>
			
			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit" value="Resolver Conflito"/>
				<a href="<c:url value="/acervo/resolver_conflitos"></c:url>" class="btn btn-default">Cancelar</a>
			</div>
		</form:form>
		<jsp:include page="../fragments/footer.jsp" />
	</div>

</body>
</html>

