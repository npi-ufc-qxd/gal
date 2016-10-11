<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<title>Fornecedores</title>
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
          	
		<div id="button-add ">
			<a href="<c:url value="/fornecedor/adicionar" ></c:url>">
				<button class="btn btn-primary pull-right " style="margin-bottom: 10px;">
					<span class="glyphicon glyphicon-plus"></span> Adicionar
				</button>
			</a>
		</div>

		<div style="text-align: center;">
			<label class="control-label" style="font-size: 20px;">Fornecedores</label>
		</div>

		<c:if test="${empty fornecedores}">
			<div class="alert alert-warning" role="alert">Não há fornecedores
				cadastrados.</div>
		</c:if>

		<c:if test="${not empty fornecedores}">
			<datatables:table id="fornecedorTable" data="${fornecedores}" cdn="false"
				row="fornecedor" theme="bootstrap2" cssClass="table table-bordered table-striped table-orderable"
				no-sort-fields="3" default-sort="0 asc">
				<datatables:column title="Nome">
					<c:out value="${fornecedor.nome}"></c:out>
				</datatables:column>

				<datatables:column title="Apelido">
					<c:out value="${fornecedor.apelido}"></c:out>
				</datatables:column>

				<datatables:column title="CNPJ">
					<c:out value="${fornecedor.cnpj}"></c:out>
				</datatables:column>
				<datatables:column title="Excluir" style="text-align: center;">
					<a id="excluir" class="btn btn-danger btn-xs exlcuir"
						data-toggle="modal" data-target="#confirm-delete" href="<c:url value="/fornecedor/${fornecedor.id}/excluir" ></c:url>"
						data-id="${fornecedor.id}"
						data-href="<c:url value="/fornecedor/${fornecedor.id}/excluir" ></c:url>">
						<span class="glyphicon glyphicon-trash"></span>
					</a>
				</datatables:column>
			</datatables:table>
		</c:if>
		</div>
		</div>
		</section>
		</section>
		<jsp:include page="../fragments/footer.jsp" />
		<script src="<c:url value="/resources/js/tabela.js" />"></script>
		
		<!-- Codigos para a tela de confirmação -->
		<!-- 
		<script src="<c:url value="/resources/js/fornecedor-listar.js" />"></script>		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		 -->
	</div>
	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">Excluir</div>
				<div class="modal-body">
					<p id="mensagem">Deseja realmente exluir este fornecedor?</p>
				</div>
				<div class="modal-footer">
					<a id="linkExcluir" href="#" class="btn btn-danger">Excluir</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
