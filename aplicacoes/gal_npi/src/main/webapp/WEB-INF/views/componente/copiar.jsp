<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Copiar Componente Curricular</title>
<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />
		<form:form servletRelativeAction="/componente/copiar" method="post"
			modelAttribute="componente" role="form" class="form-horizontal">

			<input id="origem" value="${id_componente_origem}" type="hidden" name="id_componente_origem"/>

			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">
				Copiar Componente Curricular</label>
			</div>

			<div class="form-group">
				<label for="codigo" class="col-sm-1 control-label">Código</label>
				<div class="col-sm-10">
					<form:input id="codigo" class="form-control"
						placeholder="Ex.: QXD0000" path="codigo" />
					<form:errors path="codigo" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="nome" class="col-sm-1 control-label">Nome</label>
				<div class="col-sm-10">
					<form:input id="nome" class="form-control" placeholder="Nome"
						path="nome" />
					<form:errors path="nome" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="tipo" class="col-sm-1 control-label">Tipo</label>
				<div class="col-sm-10">
					<form:select path="tipo" class="form-control">
						<form:option value="DISCIPLINA">Disciplina</form:option>
						<form:option value="ATIVIDADES COMPLEMENTARES">Atividade Complementar</form:option>
						<form:option value="TCC">Trabalho de Conclusão de Curso</form:option>
						<form:option value="ESTAGIO">Estágio</form:option>
					</form:select>
					<form:errors path="tipo" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="chPratica" class="col-sm-1 control-label">CH
					Prática</label>
				<div class="col-sm-10">
					<form:input id="chPratica" class="form-control"
						placeholder="Carga Horária Pŕatica" path="chPratica" />
					<form:errors path="chPratica" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="chTeorica" class="col-sm-1 control-label">CH
					Teórica</label>
				<div class="col-sm-10">
					<form:input id="chTeorica" class="form-control"
						placeholder="Carga Horária Teórica" path="chTeorica" />
					<form:errors path="chTeorica" cssClass="error" />
				</div>
			</div>

			<div class=container>
				<h4>Bibliografias</h4>
				<hr>
				<h4>Bibliografia Básica</h4>
				<c:if test="${empty bibliografia_basica}">
					<div class="alert alert-warning" role="alert">Nenhuma
						bibliografia básica a ser copiada.</div>
				</c:if>
				<c:if test="${not empty bibliografia_basica}">
					<div class="panel-group" id="accordionBasica" role="tablist"
						aria-multiselectable="true">
						<c:forEach var="basica" items="${bibliografia_basica}">
							<div class="panel panel-default">
								<div class="componente-bibliografia-panel-heading panel-heading <c:if test="${basica.cadastradoBiblioteca == false}">bibliografia-virtual-nao-cadastrada</c:if>" role="tab">
									<h4 class="panel-title">
										<a>${basica.nome}</a>
									</h4>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>

				<hr>

				<h4>Bibliografia Complementar</h4>

				<c:if test="${empty bibliografia_complementar}">
					<div class="alert alert-warning" role="alert">Nenhuma
						bibliografia complementar a ser copiada.</div>
				</c:if>
				<c:if test="${not empty bibliografia_complementar}">
					<div class="panel-group" id="accordionComplementar" role="tablist"
						aria-multiselectable="true">
						<c:forEach var="complementar" items="${bibliografia_complementar}">
							<div class="panel panel-default">
								<div class="componente-bibliografia-panel-heading panel-heading <c:if test="${complementar.cadastradoBiblioteca == false}">bibliografia-virtual-nao-cadastrada</c:if>" role="tab">
									<h4 class="panel-title">
										<a>${complementar.nome}</a>
									</h4>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
			</div>
			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit"
					value="Copiar" /> <a
					href="<c:url value="/componente/copiar"></c:url>"
					class="btn btn-default" onclick="goBack()">Cancelar</a>
			</div>
		</form:form>


		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>