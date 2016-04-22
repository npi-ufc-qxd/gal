<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="br.ufc.npi.gal.model.EnumNatureza" %>

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
			<form:input path="componente.id" type="hidden" />
						
			<h4 class="center">Editar Vínculo</h4>
			
			<div class="form-group">
				<label class="control-label" style="font-size: 16px;">
					${integracao.componente.codigo} - ${integracao.componente.nome}
				</label>
			</div>

			<div class="form-group">
				<label for="componente.codigo" class="col-sm-3 control-label">Código Componente Curricular</label>
				<div class="col-sm-9">
					<form:input id="componente.codigo" class="form-control"
						placeholder="Código componente curricular" disabled="true"
						path="componente.codigo" required="true" /> 
					<form:errors path="componente" cssClass="error" /> 
				</div>
			</div>
			
			<div class="form-group">
				<label for="semestreOferta" class="col-sm-3 control-label">Semestre oferta</label>
				<div class="col-sm-9">
					<form:select path="semestreOferta" class="form-control">
						<c:forEach var="i" begin="1" end="${semestreMax}">
							<form:option value="${i}">${i}º Semestre</form:option>
						</c:forEach>
					</form:select>
					<form:errors path="semestreOferta" cssClass="error" />
				</div>
			</div>
			
			<div class="form-group">
				<label for="natureza" class="col-sm-3 control-label">Natureza</label>
				<div class="col-sm-9">
					<form:select path="natureza" class="form-control">
						<form:option value="${EnumNatureza.OBRIGATORIA.descricao}">${EnumNatureza.OBRIGATORIA.descricao}</form:option>
						<form:option value="${EnumNatureza.OPTATIVA.descricao}">${EnumNatureza.OPTATIVA.descricao}</form:option>
					</form:select>
					<form:errors path="natureza" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="quantidadeAlunos" class="col-sm-3 control-label">Quantidade de alunos</label>
				<div class="col-sm-9">
					<form:input id="quantidadedeAlunos" class="form-control numeros"
						maxlength="4" placeholder="Quantidade alunos"
						path="quantidadeAlunos" onkeypress="mascara(this,soNumeros)" onchange="mascara(this,soNumeros)"
						required="true" />
					<form:errors path="quantidadeAlunos" cssClass="error" />
				</div>
			</div>
			
			<div class="form-group">
				<label for="observacoes" class="col-sm-3 control-label">Observações</label>
				<div class="col-sm-9">
					<form:textarea id="observacoes" class="form-control" rows="2"
						placeholder="Observações" path="observacoes" />
					<form:errors path="observacoes" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="influenciarCalculo" class="col-sm-3 control-label">Influenciar no Cálculo de Metas?</label>
			    <div class="col-sm-1 fix-checkbox">
			    	<form:checkbox id="influenciarCalculo" path="influenciarCalculo"/>
			    	<form:errors path="influenciarCalculo" cssClass="error" />
			    </div>
			</div>

			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit" value="Salvar" /> 
				<a href="<c:url value="javascript:window.history.go(-1)"></c:url>" class="btn btn-default">
					Cancelar
				</a>
			</div>
		</form:form>
		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>