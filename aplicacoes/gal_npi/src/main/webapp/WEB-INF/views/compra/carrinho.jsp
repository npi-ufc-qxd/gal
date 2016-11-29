<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
	<title>Carrinho de Compra</title>
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
          	
		<div style="text-align: center;">
			<label class="control-label" style="font-size: 20px;">Carrinho de Compra</label>
		</div>
		
		<table id="example" class="display nowrap" cellspacing="0" width="100%">
	        <thead>
	            <tr>
	                <th>Título</th>
	                <th>Quantidade</th>
	                <th>Valor Médio</th>
	            </tr>
	        </thead>
	        <tfoot>
	            <tr>
	         	   	<th>Título</th>
	                <th>Quantidade</th>
	                <th>Valor Médio</th>
	            </tr>
	        </tfoot>
	        <tbody>
	            <tr>
	                <td>Tiger Nixon</td>
	                <td>System Architect</td>
	                <td>Edinburgh</td>
	            </tr>
	            <tr>
	                <td>Garrett Winters</td>
	                <td>Accountant</td>
	                <td>Tokyo</td>
	            </tr>
	            <tr>
	                <td>Ashton Cox</td>
	                <td>Junior Technical Author</td>
	                <td>San Francisco</td>
	            </tr>
		</table>
		
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
	<script type="text/javascript">
		$(document).ready(function() {
		    var table = $('#example').DataTable( {
		    	lengthChange: false,
		        dom: 'Bfrtip',
		        buttons: [
		        	{
		        		extend : 'excel',
		        		text : 'Importar para XLS'
		        	}
		          
		        ]
		    } );
	
		    table.buttons().container()
		        .appendTo( '#example_wrapper .col-sm-6:eq(0)');
		} );
	</script>
</body>
</html>