<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<title>Adicionar Estrutura Curricular</title>
<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container" style="width: 1000px; margin: 0 auto;">
		<jsp:include page="../fragments/header.jsp" />
		<form:form
			servletRelativeAction="/estrutura/${curso.codigo}/adicionar"
			method="post" modelAttribute="estruturaCurricular" role="form"
			class="form-horizontal">
			<form:input path="id" type="hidden" />
			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Adicionar
					Nova Estrutura Curricular</label>
			</div>



			<div class="form-group">
				<label for="codigo" class="col-sm-1 control-label">Código</label>
				<div class="col-sm-10">
					<form:input id="codigo" class="form-control"
						placeholder="Ex.: 2010.1" path="codigo" />
					<form:errors path="codigo" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="matrizCurricular" class="col-sm-1 control-label">Matriz
					Curricular</label>
				<div class="col-sm-10">
					<form:input id="matrizCurricular" class="form-control"
						placeholder="Ex.: ENGENHARIA DE SOFTWARE - QUIXADÁ - Presencial - BACHARELADO EM ENGENHARIA DE SOFTWARE - MT - BACHARELADO"
						path="matrizCurricular" />
					<form:errors path="matrizCurricular" cssClass="error" />
				</div>
			</div>
			<div class="form-group">
				<label for="unidadeVinculacao" class="col-sm-1 control-label">Unidade
					Vinculação</label>
				<div class="col-sm-10">
					<form:input id="unidadeVinculacao" class="form-control"
						placeholder="Ex.: Campus da UFC em Quixadá/Diretoria (11.00.01.31)"
						path="unidadeVinculacao" />
					<form:errors path="unidadeVinculacao" cssClass="error" />
				</div>
			</div>
			<div class="form-group">
				<label for="municipio" class="col-sm-1 control-label">Município
					Func.</label>
				<div class="col-sm-10">
					<form:input id="municipio" class="form-control"
						placeholder="Ex.: Quixadá-CE" path="municipio" />
					<form:errors path="municipio" cssClass="error" />
				</div>
			</div>
			<div class="form-group">
				<label for="semestreEntradaVigor" class="col-sm-1 control-label">Entrada
					Vigor</label>
				<div class="col-sm-10">
					<form:input id="semestreEntradaVigor" class="form-control"
						placeholder="Período Letivo de Entrada em Vigor 		Ex.: 2011.2"
						path="semestreEntradaVigor" />
					<form:errors path="semestreEntradaVigor" cssClass="error" />
				</div>
			</div>


			<div class="controls">
			<div class="form-group"><label for="codigo" class="col-sm-1 control-label">Html</label>
				<form action="upload.do" enctype="multipart/form-data" method="post">
					<input type="file" name="file" id="file">
				</form></div>
				<input id="criar" class="btn btn-primary" type="submit"
					value="Adicionar" /> <a
					href="<c:url value="/curso/listar"></c:url>"
					class="btn btn-default">Cancelar</a>
			</div>
		</form:form>
		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>