<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<title>Relatório Geral - ${estrutura.curso.nome}</title>
<jsp:include page="../../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container" style="width: 1000px; margin: 0 auto;">
		<jsp:include page="../../fragments/header.jsp" />
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

		<button class="btn btn-default" onclick="goBack()">Voltar</button>

		<c:if test="${empty estrutura}">
			<div class="alert alert-warning" role="alert">Estrutura
				Curricular inexistente</div>
		</c:if>

		<c:if test="${not empty estrutura}">
			<div style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Estrutura
					Curricular</label>
			</div>
			<br>
			<div class="halfContainer">
				<b>Código: </b> ${estrutura.codigo} <br> <b>Matriz
					Curricular:</b> ${estrutura.matrizCurricular}<br> <b>Unidade
					de Vinculação: </b>${estrutura.unidadeVinculacao }<br> <b>Município
					de funcionamento: </b> ${estrutura.municipio }<br> <b>Período
					Letivo de Entrada em Vigor: </b>${estrutura.semestreEntradaVigor}<br>
				<b>Carga Horária Optativa Minima: </b>${estrutura.chOptMinima }<b>
					hrs</b><br> <b>Carga Horária Máxima de Componentes
					Curriculares Optativos Livres: </b>${estrutura.chCompOptLivres }<b>
					hrs</b><br> <br>
			</div>
			<div class="halfContainer">
				<div class="littleBox">
					<b>Prazos para Conclusão em Períodos Letivos </b><br> <b>Mínimo:
					</b>${estrutura.prazoConclusaoMinimo }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>Médio: </b>${estrutura.prazoConclusaoMedio }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>Máximo: </b>${estrutura.prazoConclusaoMaximo }<br>
				</div>
				<div class="littleBox" style="border-top: 0px">
					<b>Carga Horária por Período Letivo</b><br> <b>Mínima: </b>${estrutura.chPeriodoMinimo }<b>
						hrs</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Média: </b>${estrutura.chPeriodoMedio }<b>
						hrs</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Máxima: </b>${estrutura.chPeriodoMaximo }<b>
						hrs</b><br>
				</div>
				<hr width="102%">
				<div class="littleBox">
					<b>Carga Horária Obrigatória</b><br> <b>Total: </b>${estrutura.chObrigatoria}<b>
						hrs</b>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp; <b>( </b>${estrutura.chObgPratica }<b>
						hrs</b> <b>Práticas ) / ( </b> ${estrutura.chObgTeorica }<b> hrs</b> <b>
						Teóricas )</b><br>
				</div>
				<div style="padding: 0px 12px;">
					<b>Carga Horária Total Mínima: </b>${estrutura.chTotalMinima }<b>
						hrs</b><br> <b>Carga Horária Obrigatória de Atividade
						Acadêmica Específica: </b>${estrutura.chAtvAcademicaEspecifica }<b>
						hrs</b><br>
				</div>
				<br> <br>
			</div>

			<h4>Integrações Curriculares</h4>
			<c:if test="${empty estrutura.curriculos}">
				<div class="alert alert-warning" role="alert">Esta Estrutura
					Curricular não possui Integrações Curriculares cadastradas</div>
			</c:if>
			<c:if test="${not empty estrutura.curriculos}">
				<table
					class="table table-orderable table-condensed table-striped table-bordered"
					default-sort="3 asc" paging="false" searching="false">

					<thead>
						<tr>
							<th>Componente Curricular</th>
							<th>Código</th>
							<th>Quantidade de Alunos</th>
							<th>Semestre de Oferta</th>
							<th>Observações</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="curriculo" items="${estrutura.curriculos}">
							<tr>
									<td><a
										href="<c:url value="/integracao/${curriculo.componente.id }/${estrutura.id}/editar" ></c:url>">${curriculo.componente.nome}</a></td>
								<td align="center">${curriculo.componente.codigo}</td>
								<td align="right">${curriculo.quantidadeAlunos}</td>
								<td align="right">${curriculo.semestreOferta}</td>
								<c:if test="${not empty curriculo.observacoes}">
									<td width="200px">${curriculo.observacoes}</td>
								</c:if>
								<c:if test="${empty curriculo.observacoes}">
									<td width="200px" align="center">-</td>
								</c:if>
							</tr>
							
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</c:if>
		<jsp:include page="../../fragments/footer.jsp" />
	</div>

</body>
</html>