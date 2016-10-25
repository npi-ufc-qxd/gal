<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<title>Cotações</title>
		<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />
	
		<section id="main-content">
          	<section class="wrapper"> 
          	
         <c:if test="${not empty error}">
			<div class="alert alert-danger alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<c:out value="${error}"></c:out>
			</div>
		</c:if>
		<c:if test="${not empty info}">
			<div class="alert alert-info alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<c:out value="${info}"></c:out>
			</div>
		</c:if>
          	
          	<div class="col-lg-12">
          	<div class="form-panel">
          	
		<sec:authorize
			access="hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO','COORDENACAO_ACADEMICA')">
			<div id="button-add ">
				<a href="<c:url value="/cotacao/adicionar" ></c:url>">
					<button class="btn btn-primary pull-right " style="margin-bottom: 10px;">
						<span class="glyphicon glyphicon-plus"></span> Adicionar
					</button>
				</a>
			</div>
		</sec:authorize>

		<div style="text-align: center;">
			<label class="control-label" style="font-size: 20px;">Cotações</label>
		</div>
		
		<select id="selecionaTitulo" class="select-filter">
				<option value="-1">Todos os Títulos</option>
				<c:forEach items="${titulos}" var="titulo">
					<option value="${titulo.id}">${titulo.nome}</option>
				</c:forEach>
		</select>
		
		<select id="selecionaFornecedor" class="select-filter">
				<option value="-1">Todos os Fornecedores</option>
				<c:forEach items="${fornecedores}" var="fornecedor">
					<option value="${fornecedor.id}">${fornecedor.nome}</option>
				</c:forEach>
		</select>

		<c:if test="${empty cotacoes}">
			<div class="alert alert-warning" role="alert">Não há cotações
				cadastradas.</div>
		</c:if>

		<c:if test="${not empty cotacoes}">
			<sec:authorize access="hasAnyRole('BIBLIOTECARIO','COORDENACAO_ACADEMICA')">
			
				<datatables:table id="cotacoesTable" data="${cotacoes}" cdn="false"
					row="cotacao" theme="bootstrap2" cssClass="table table-bordered table-striped table-orderable"
					no-sort-fields="3 4 5" default-sort="0 asc">
					<datatables:column title="Nome">
						<c:out value="${cotacao.fornecedor.nome}"></c:out>
					</datatables:column>

					<datatables:column title="Título">
						<c:out value="${cotacao.titulo.nome}"></c:out>
					</datatables:column>

					<datatables:column title="Valor">
						<c:out value="${cotacao.valor}"></c:out>
					</datatables:column>
					
					<datatables:column title="Editar" style="text-align: center;">
						<a class="btn btn-primary btn-xs"
							href="<c:url value = "/cotacao/${cotacao.id}/editar"></c:url>">
							<span class="glyphicon glyphicon-edit"></span>
						</a>
					</datatables:column>
					
					<datatables:column title="Excluir" style="text-align: center;">
						<a id="excluir" class="open-AddQtdExemplares btn btn-danger btn-xs"
							data-toggle="modal" data-target="#confirm-delete" href="#"
							data-href="<c:url value="/cotacao/${cotacao.id}/excluir" ></c:url>">
							<span class="glyphicon glyphicon-trash"></span>
						</a>
					</datatables:column>					
				</datatables:table>
			</sec:authorize>
			
			<sec:authorize
				access="!hasAnyRole('BIBLIOTECARIO','COORDENACAO_ACADEMICA')">
				<datatables:table id="tituloTable" data="${cotacoes}" cdn="false"
					row="cotacao" theme="bootstrap2"
					cssClass="table table-striped table-orderable" no-sort-fields="3"
					default-sort="0 asc">
					<datatables:column title="Fornecedor" style="text-align: center;">
						<c:out value="${cotacao.fornecedor.nome}"></c:out>
					</datatables:column>

					<datatables:column title="Título" style="text-align: center;">
						<c:out value="${cotacao.titulo.nome}"></c:out>
					</datatables:column>

					<datatables:column title="Valor" style="text-align: center;">
						<c:out value="${cotacao.valor}"></c:out>
					</datatables:column>
					
					<datatables:column title="Editar" style="text-align: center;">
						<a class="btn btn-primary btn-xs"
							href="<c:url value = "/cotacao/${cotacao.id}/editar"></c:url>">
							<span class="glyphicon glyphicon-edit"></span>
						</a>
					</datatables:column>
				</datatables:table>
			</sec:authorize>
		</c:if>
		</div>
		</div>
		</section>
		</section>
		<jsp:include page="../fragments/footer.jsp" />
		<script src="<c:url value="/resources/js/tabela.js" />"></script>
	</div>
	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">Excluir</div>
				<div class="modal-body">
					<p id="mensagem"></p>
				</div>
				<div class="modal-footer">
					<a href="#" class="btn btn-danger">Excluir</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
