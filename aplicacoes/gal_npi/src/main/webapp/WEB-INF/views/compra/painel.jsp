<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>Painel de Compras</title>
	<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container" >
		<jsp:include page="../fragments/header.jsp" />
	
		<section id="main-content">
          	<section class="wrapper"> 
          	
		<div class="alert alert-danger alert-dismissible" role="alert" ${(empty error) ? 'hidden' : ''} >
			<button type="button" class="close" data-for="danger">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<span class="alert-content">
				<c:out value="${error}"></c:out>
			</span>
		</div>
		<div class="alert alert-info alert-dismissible" role="alert" ${(empty info) ? 'hidden' : ''} >
			<button type="button" class="close" data-for="info" >
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<span class="alert-content">
				<c:out value="${info}"></c:out>
			</span>
		</div>
          	
       	<div class="col-lg-12">
       		<div class="form-panel">
       		
		<br /><br />
		<div style="text-align: center;">
			<label class="control-label" style="font-size: 20px;">Painel de compras</label>
		</div>

		<c:if test="${empty resultados}">
			<div class="alert alert-warning" role="alert">Não há títulos cadastrados neste carrinho.</div>
		</c:if>

		<c:if test="${not empty resultados}">
			<datatables:table id="itensTable" data="${resultados}" cdn="false"
				row="resultado" theme="bootstrap2" cssClass="table table-bordered table-striped table-orderable"
				no-sort-fields="" default-sort="0 asc">
				
				<datatables:column title="Título">
					<c:out value="${resultado.titulo.nome}"></c:out>
				</datatables:column>
				
				<datatables:column title="Acervo">
					<c:out value="${resultado.titulo.exemplares.size()}"></c:out>
				</datatables:column>
				
				<c:forEach items="${resultado.metasCalculadas}" var="meta" varStatus="indice">
					<datatables:column title="Déficit ${meta.nome}" style="text-align: center;">
							<c:choose>
								<c:when test="${resultado.titulo.tipo == 'Virtual'}">
									<c:out value="0"></c:out>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${(meta.calculo-resultado.titulo.acervo) >= 0}">
											<fmt:formatNumber type="number" maxFractionDigits="1" value="${meta.calculo-resultado.titulo.acervo}"></fmt:formatNumber>
										</c:when>
										<c:otherwise>
											<c:out value="0"></c:out>
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</datatables:column>
				</c:forEach>

				
				<datatables:column title="Quantidade">
					<c:choose>
						<c:when test="${resultado.titulo.itens.size() > 0}">
							<input class="input-quantidade" id="input-quantidade-${resultado.titulo.id}" value="${resultado.titulo.itens.get(0).quantidade}" data-titulo-id="${resultado.titulo.id}" type="number" disabled="disabled"/>
						</c:when>
						<c:otherwise>
							<input class="input-quantidade" id="input-quantidade-${resultado.titulo.id}" value="0" type="number" data-titulo-id="${resultado.titulo.id}" />
						</c:otherwise>
					</c:choose>
				</datatables:column>
				
				<datatables:column title="Valor Unitário Médio">
					<span id="valor-unitario-medio-${resultado.titulo.id}" >
						<c:out value="${resultado.titulo.valorUnitarioMedio}"></c:out>
					</span>
				</datatables:column>
				
				<datatables:column title="Valor Total Médio">
					<span id="valor-total-medio-${resultado.titulo.id}" >
						<c:choose>
							<c:when test="${resultado.titulo.itens.size() > 0}">
								<c:out value="${resultado.titulo.itens.get(0).valorTotalMedio}"></c:out>
							</c:when>
							<c:otherwise>
								<c:out value="0"></c:out>
							</c:otherwise>
						</c:choose>
					</span>
				</datatables:column>
				
				<datatables:column title="Adicionar" style="text-align: center;">
					<c:choose>
						<c:when test="${resultado.titulo.itens.isEmpty()}">
							<a class="btn btn-primary btn-xs gal-btn-add-item"
								data-titulo-id="${resultado.titulo.id}"
								href="<c:url value = "/compra/${compra.id}/item/adicionar"></c:url>">
								<span class="glyphicon glyphicon-plus"></span>
							</a>
						</c:when>
					</c:choose>
				</datatables:column>
				
				<datatables:column title="Editar" style="text-align: center;">
					<c:choose>
						<c:when test="${resultado.titulo.itens.size() > 0}">
							<a class="btn btn-primary btn-xs"
								href="<c:url value = "/compra/itam/${resultado.titulo.itens.get(0).id}/editar"></c:url>">
								<span class="glyphicon glyphicon-edit"></span>
							</a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-primary btn-xs"
								href="<c:url value = "#"></c:url>">
								<span class="glyphicon glyphicon-edit"></span>
							</a>
						</c:otherwise>
					</c:choose>
				</datatables:column>
				
				<datatables:column title="Excluir" style="text-align: center;">
					<c:choose>
						<c:when test="${resultado.titulo.itens.size() > 0}">
							<a id="excluir" class="open-AddQtdExemplares btn btn-danger btn-xs"
								data-toggle="modal" data-target="#confirm-delete" href="#"
								data-id="${resultado.titulo.itens.get(0).id}"
								data-href="<c:url value="/compra/item/${resultado.titulo.itens.get(0).id}/excluir" ></c:url>">
								<span class="glyphicon glyphicon-trash"></span>
							</a>
						</c:when>
						<c:otherwise>
							<a id="excluir" class="open-AddQtdExemplares btn btn-danger btn-xs"
								data-toggle="modal" data-target="#confirm-delete" href="#"
								data-id="" data-href="<c:url value="#" ></c:url>">
								<span class="glyphicon glyphicon-trash"></span>
							</a>
						</c:otherwise>
					</c:choose>
				</datatables:column>
				
			</datatables:table>
		</c:if>
		</div>
		</div>
		</section>
		</section>
		<jsp:include page="../fragments/footer.jsp" />
		<script src="<c:url value="/resources/js/painel-compras.js" />"></script>
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
