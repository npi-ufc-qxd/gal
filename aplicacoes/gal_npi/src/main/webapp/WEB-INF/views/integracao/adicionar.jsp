<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Vincular Disciplina</title>
<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container" style="width: 1000px; margin: 0 auto;">
		<jsp:include page="../fragments/header.jsp" />

		<form:form servletRelativeAction="/integracao/adicionar" method="post"
			modelAttribute="integracao" role="form" class="form-horizontal">
		
			<form:hidden path="estruturaCurricular.id" value="${idCurriculo}"/>
			
			<%-- <form:input id="estruturaCurricular" class="form-control"
						style="width: 150px;" type="hidden" value="${idCurriculo}"
						path="estruturaCurricular" required="true" /> --%>
			
			<div class="form-group">
				<label class="control-label" style="font-size: 20px;">Vincular
					Disciplina</label>
			</div>

			<div class="form-group">
				<label for="disciplina" class="col-sm-2 control-label">Selecione Disciplina</label>
				<div class="col-sm-10">
					<form:select id="selectDisciplina" class="form-control" placeholder="Código disciplina" path="disciplina.codigo" required="true" >

						<form:option value="nenhuma" >Selecione o componente</form:option>
						<c:forEach items="${disciplinas}" var="disciplina">
							<form:option value="${disciplina.codigo}">${disciplina.codigo} - ${disciplina.nome}</form:option>
						</c:forEach>
					</form:select>
					
<!-- 					<select class="disciplinas form-control"> -->
<!-- 					</select> -->
					
					<form:errors path="disciplina" cssClass="error" />
				</div>
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
					<form:input id="quantidadeAlunos" class="form-control numeros"
						placeholder="Quantidade alunos" maxlength="4"
						path="quantidadeAlunos" onkeypress="mascara(this,soNumeros)" onchange="mascara(this,soNumeros)"
						required="true" />
					<form:errors path="quantidadeAlunos" cssClass="error" />
				</div>
			</div>


			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit"
					value="Adicionar" /> <a
					href="<c:url value="javascript:window.history.go(-1)"></c:url>"
					class="btn btn-default">Cancelar</a>
			</div>


		</form:form>
		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>
