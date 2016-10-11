<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<title>Títulos</title>
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
				<a href="<c:url value="/titulo/adicionar" ></c:url>">
					<button class="btn btn-primary pull-right " style="margin-bottom: 10px;">
						<span class="glyphicon glyphicon-plus"></span> Adicionar
					</button>
				</a>
			</div>
		</sec:authorize>

		<div style="text-align: center;">
			<label class="control-label" style="font-size: 20px;">Títulos</label>
		</div>

		<c:if test="${empty titulos}">
			<div class="alert alert-warning" role="alert">Não há títulos
				cadastrados.</div>
		</c:if>

		<c:if test="${not empty titulos}">
			<sec:authorize access="hasAnyRole('BIBLIOTECARIO','COORDENACAO_ACADEMICA')">
			
				<datatables:table id="tituloTable" data="${titulos}" cdn="false"
					row="titulo" theme="bootstrap2" cssClass="table table-bordered table-striped table-orderable"
					no-sort-fields="3 4 5" default-sort="0 asc">
					<datatables:column title="Nome">
						<c:out value="${titulo.nome}"></c:out>
					</datatables:column>

					<datatables:column title="ISBN">
						<c:out value="${titulo.isbn}"></c:out>
					</datatables:column>

					<datatables:column title="Tipo">
						<c:out value="${titulo.tipo}"></c:out>
					</datatables:column>
				
					<datatables:column title="Editar" style="text-align: center;">
						<a class="btn btn-primary btn-xs"
							href="<c:url value = "/titulo/${titulo.id}/editar"></c:url>">
							<span class="glyphicon glyphicon-edit"></span>
						</a>
					</datatables:column>
					
					<datatables:column title="Historico" style="text-align: center;">
						<a class="btn btn-info btn-xs" 
							href="<c:url value = "/titulo/${titulo.id}/historicoTitulo"></c:url>">
							<span class="glyphicon glyphicon-eye-open"></span>
						</a>
					</datatables:column>
				
					<datatables:column title="Excluir" style="text-align: center;">
						<a id="excluir" class="open-AddQtdExemplares btn btn-danger btn-xs"
							data-toggle="modal" data-target="#confirm-delete" 
							data-id="${titulo.acervo}"
							href="<c:url value="/titulo/${titulo.id}/excluir" ></c:url>">
							<span class="glyphicon glyphicon-trash"></span>
						</a>
					</datatables:column>

					<datatables:column title="Exemplar" style="text-align: center;">
						<a href="<c:url value="/exemplar/${titulo.id}/listar" ></c:url>">
							<button class="btn btn-primary btn-xs">
								<span class="glyphicon glyphicon-list"></span> Exemplares
							</button>
						</a>
					</datatables:column>
					
				</datatables:table>
			</sec:authorize>
			<sec:authorize
				access="!hasAnyRole('BIBLIOTECARIO','COORDENACAO_ACADEMICA')">
				<datatables:table id="tituloTable" data="${titulos}" cdn="false"
					row="titulo" theme="bootstrap2"
					cssClass="table table-striped table-orderable" no-sort-fields="3"
					default-sort="0 asc">
					<datatables:column title="Nome" style="text-align: center;">
						<c:out value="${titulo.nome}"></c:out>
					</datatables:column>

					<datatables:column title="ISBN" style="text-align: center;">
						<c:out value="${titulo.isbn}"></c:out>
					</datatables:column>

					<datatables:column title="Tipo" style="text-align: center;">
						<c:out value="${titulo.tipo}"></c:out>
					</datatables:column>

					<datatables:column title="Exemplar" style="text-align: center;">
						<a href="<c:url value="/exemplar/${titulo.id}/listar" ></c:url>">
							<button class="btn btn-primary">
								<span class="glyphicon glyphicon-list"></span> Exemplares
							</button>
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
		<script src="<c:url value="/resources/js/titulo-listar.js" />"></script>
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
