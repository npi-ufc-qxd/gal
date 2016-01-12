<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Editar Vinculo</title>
<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />

		<form:form servletRelativeAction="/integracao/editar" method="post"
			modelAttribute="integracao" role="form" class="form-horizontal">
			
			<form:input path="estruturaCurricular.id" type="hidden" />
			<form:input path="disciplina.id" type="hidden" />
						
			<div class="form-group">
				<label class="control-label" style="font-size: 20px;">Editar
					Vinculo</label>
			</div>
			
			<div class="form-group">
				<label class="control-label" style="font-size: 16px;">${integracao.disciplina.codigo}
				 - ${integracao.disciplina.nome}</label>
			</div>
			
			<div class="form-group">
				<label for="semestreOferta" class="col-sm-2 control-label">Semestre oferta</label>
				<div class="col-sm-10">
					<form:select path="semestreOferta" class="form-control">
						<c:forEach var="i" begin="1" end="${semestreMax}">
							<form:option value="${i}">${i}º Semestre</form:option>
						</c:forEach>
					</form:select>
					<form:errors path="semestreOferta" cssClass="error" />
				</div>
			</div>
			
			<div class="form-group">
				<label for="natureza" class="col-sm-2 control-label">Natureza</label>
				<div class="col-sm-10">
					<form:select path="natureza" class="form-control">
						<form:option value="OBRIGATORIA">Obrigatória</form:option>
						<form:option value="OPTATIVA">Optativa</form:option>
					</form:select>
					<form:errors path="natureza" cssClass="error" />
				</div>
			</div>
			
			<div class="form-group">
				<label for="quantidadeAlunos" class="col-sm-2 control-label">Quantidade
					alunos</label>
				<div class="col-sm-10">
					<form:input id="quantidadedeAlunos" class="form-control numeros"
						maxlength="4" placeholder="Quantidade alunos"
						path="quantidadeAlunos" onkeypress="mascara(this,soNumeros)" onchange="mascara(this,soNumeros)"
						required="true" />
					<form:errors path="quantidadeAlunos" cssClass="error" />
				</div>
			</div>

			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit"
					value="Salvar" /> 
					
				<a	href="<c:url value="javascript:window.history.go(-1)"></c:url>"
					class="btn btn-default">Cancelar</a>
			</div>


		</form:form>
		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>