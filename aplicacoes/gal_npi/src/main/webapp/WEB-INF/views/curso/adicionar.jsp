<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Adicionar Curso</title>
<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<jsp:include page="../fragments/header.jsp" />
	<div id="container">
		<section id="main-content">
			<section class="wrapper">
				<div class="col-lg-12">
					<div class="form-panel">
						<form:form servletRelativeAction="/curso/adicionar" method="post"
							modelAttribute="curso" role="form" class="form-horizontal">
							<div class="form-group" style="text-align: center;">
								<label class="control-label" style="font-size: 20px;">Adicionar
									Curso</label>
							</div>

							<div class="form-group">
								<label for="codigo" class="col-sm-1 control-label">Código</label>
								<div class="col-sm-10">
									<form:input id="codigo" class="form-control"
										placeholder="Código" path="codigo" />
									<form:errors path="codigo" cssClass="error" />
								</div>
							</div>

							<div class="form-group">
								<label for="nome" class="col-sm-1 control-label">Nome</label>
								<div class="col-sm-10">
									<form:input maxlength="255" id="nome" class="form-control"
										placeholder="Nome" path="nome" />
									<form:errors path="nome" cssClass="error" />
								</div>
							</div>

							<div class="form-group">
								<label for="sigla" class="col-sm-1 control-label">Sigla</label>
								<div class="col-sm-10">
									<form:input id="sigla" class="form-control" placeholder="Sigla"
										path="sigla" />
									<form:errors path="sigla" cssClass="error" />
								</div>
							</div>

							<div class="controls">
								<input id="criar" class="btn btn-primary" type="submit"
									value="Adicionar" /> <a
									href="<c:url value="/curso/listar"></c:url>"
									class="btn btn-default">Cancelar</a>
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