<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="br.ufc.npi.gal.model.EnumNatureza" %>

<!DOCTYPE html>
<html>
<head>
<title>Vincular Componente Curricular</title>
<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />
		<section id="main-content">
          	<section class="wrapper"> 
          	<div class="col-lg-12">
          	<div class="form-panel">
		<form:form servletRelativeAction="/integracao/adicionar" method="post"
			modelAttribute="integracao" role="form" class="form-horizontal">

			<form:input id="estruturaCurricular" class="form-control"
				style="width: 150px;" type="hidden" value="${idCurriculo}"
				path="estruturaCurricular" required="true" />

			<h4 class="center negrito">Vincular Componente Curricular</h4>

			<div class="form-group">

				<label for="componente" class="col-sm-3 control-label">Selecione Componente</label>
				<div class="col-sm-9">
					
					<form:select id="selectComponente" class="form-control select-filter"
						placeholder="Código componente" path="componente" required="true">
						<form:option value="nenhuma">Selecione o componente</form:option>
						<c:forEach items="${componentes}" var="componente">
							<form:option value="${componente.codigo}">${componente.codigo} - ${componente.nome}</form:option>
						</c:forEach>
					</form:select>

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
					<form:input id="quantidadeAlunos" class="form-control numeros"
						placeholder="Quantidade alunos" maxlength="4"
						path="quantidadeAlunos" onkeypress="mascara(this,soNumeros)"
						onchange="mascara(this,soNumeros)" required="true" />
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
			    	<form:checkbox id="influenciarCalculo" path="influenciarCalculo" checked="true"/>
			    	<form:errors path="influenciarCalculo" cssClass="error" />
			    </div>
			</div>

			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit" value="Adicionar" />
				<a href="<c:url value="javascript:window.history.go(-1)"></c:url>" class="btn btn-default">
					Cancelar
				</a>
			</div>

		</form:form>
		</div>
		</div>
		</section>
		</section>
		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>
