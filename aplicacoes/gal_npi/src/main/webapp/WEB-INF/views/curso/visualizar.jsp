<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<title>${curso.sigla} - ${curso.nome}</title>
<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />

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
		<div class="panel-body">
			<ul class="nav nav-tabs" role="tablist">
				<c:forEach items="${curso.curriculos}" var="curriculo" varStatus="ct">
	
					<c:if test="${ct.index == 0}"> <c:set var="act" value="active"></c:set> </c:if>
	
					<c:if test="${ct.index != 0}"> <c:set var="act" value=""></c:set> </c:if>
	
					<li class="${act }"><a href="#${curriculo.id }" role="tab" data-toggle="tab">${curriculo.codigo}</a></li>
	
				</c:forEach>
				<sec:authorize access="hasAnyRole('ROLE_COORDENADOR_CURSO','ROLE_BIBLIOTECARIO')">
				<div id="button-add">
					<a href="<c:url value="/estrutura/${curso.id}/adicionar" ></c:url>">
						<button class="btn btn-primary"> <span class="glyphicon glyphicon-plus"></span> Adicionar Curriculo </button>
					</a>
				</div>
				</sec:authorize>
				
			</ul>

		<div class="tab-content">
			<c:forEach items="${curso.curriculos}" var="curriculo" varStatus="count">
				
				<c:if test="${count.index == 0}"> <c:set var="active" value="active"></c:set> </c:if>
				
				<c:if test="${count.index != 0}"> <c:set var="active" value=""></c:set> </c:if>
				
				<div class="tab-pane ${active }" id="${curriculo.codigo }"></div>

				<div id="${curriculo.id}" class="tab-pane ${active }">
					<sec:authorize access="hasAnyRole('ROLE_COORDENADOR_CURSO','ROLE_BIBLIOTECARIO')">
					<div id="button-add">
						<a style="float: left;" class="btn btn-success" href="<c:url value="/integracao/${curriculo.id}/adicionar" ></c:url>">
							<span class="glyphicon glyphicon-link"></span> Vincular Disciplina
						</a>
						
						<a id="excluir" style="float: right;" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#" data-href="<c:url value="/estrutura/${curriculo.id }/excluir" ></c:url>">
							<span class="glyphicon glyphicon-trash"></span> Excluir Curriculo
						</a>
						 
						<a href="<c:url value="/estrutura/${curriculo.id }/editar" ></c:url>">
							<button class="btn btn-primary">
								<span class="glyphicon glyphicon-plus"></span> Editar Curriculo
							</button>
						</a>
					</div>
					<div class="halfContainer">
						<b>Código: </b> ${curriculo.codigo} <br>
						<b>Matriz Curricular:</b> ${curriculo.matrizCurricular}<br>
						<b>Unidade de Vinculação: </b>${curriculo.unidadeVinculacao }<br>
						<b>Município de funcionamento: </b> ${curriculo.municipio }<br>
						<b>Período Letivo de Entrada em Vigor: </b>${curriculo.semestreEntradaVigor}<br>
						<b>Carga Horária Obrigatória</b><br>
						<b>Total: </b>${curriculo.chTotalMinima }&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;
						<b>( </b>${curriculo.chObgTeorica } <b>Práticas ) / ( </b> ${curriculo.chObgPratica } <b> Teóricas )</b><br>
						
						
						<br>
						
					
					</div><div class="halfContainer">
						<b>Carga Horária Total Mínima: </b>${curriculo.chTotalMinima }<br>
						<b>Carga Horária Optativa Minima: </b>${curriculo.chOptMinima }<br>
						<b>Carga Horária Obrigatória de Atividade Acadêmica Específica: </b>${curriculo.chAtvAcademicaEspecifica }<br>
						<b>Carga Horária Máxima de Componentes Curriculares Optativos Livres: </b>${curriculo.chCompOptLivres }<br>
						<b>Prazos para Conclusão em Períodos Letivos </b><br>
						<b>Mínimo: </b>${curriculo.prazoConclusaoMinimo }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b>Médio: </b>${curriculo.prazoConclusaoMedio }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b>Máximo: </b>${curriculo.prazoConclusaoMaximo }<br>
						<b>Carga Horária por Período Letivo</b><br>
						<b>Mínima: </b>${curriculo.chPeriodoMinimo }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b>Média: </b>${curriculo.chPeriodoMedio }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b>Máxima: </b>${curriculo.chPeriodoMaximo }<br>
						
						<br>
						
					</div>
					</sec:authorize>

					<div class="panel panel-default">
						<datatables:table id="estrutura${curso.id}" data="${curriculo.curriculos}" cdn="false" row="integracao" theme="bootstrap2" cssClass="table table-striped table-orderable" no-sort-fields="1 2 4 5" default-sort="3 desc">

							<datatables:column title="Disciplina">
								<c:out value="${integracao.disciplina.nome}"></c:out>
							</datatables:column>

							<datatables:column title="Código disciplina">
								<c:out value="${integracao.disciplina.codigo}"></c:out>
							</datatables:column>


							<datatables:column title="Quantidade aluno">
								<c:out value="${integracao.quantidadeAlunos}"></c:out>
							</datatables:column>

							<datatables:column title="Semestre oferta">
								<c:out value="${integracao.semestreOferta}"></c:out>
							</datatables:column>
							
							<sec:authorize access="hasAnyRole('ROLE_COORDENADOR_CURSO','ROLE_BIBLIOTECARIO')">
							<datatables:column title="Editar">
								<a class="btn btn-primary" href="<c:url value="/integracao/${integracao.disciplina.id}/${curriculo.id}/editar" ></c:url>">
									<span class="glyphicon glyphicon-edit"></span>
								</a>
							</datatables:column>

							<datatables:column title="Excluir">
								<a id="excluir" class="btn btn-danger" data-toggle="modal" data-target="#confirm-delete" href="#" data-href="<c:url value="/integracao/${integracao.disciplina.id}/${curriculo.id}/excluir" ></c:url>">
									<span class="glyphicon glyphicon-trash"></span>
								</a>
							</datatables:column>
							</sec:authorize>
							
						</datatables:table>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	
	<jsp:include page="../fragments/footer.jsp" />
	
	<div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">Excluir</div>
				<div class="modal-body">Tem certeza de que deseja excluir esse curso?</div>
				<div class="modal-footer">
					<a href="integracao/excluir" class="btn btn-danger">Excluir</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="confirm-delete-integracao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">Excluir</div>
				<div class="modal-body">Tem certeza de que deseja excluir essa integração?</div>
				<div class="modal-footer">
					<a href="#" class="btn btn-danger">Excluir</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade " id="add-disciplina" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">Adicionar disciplina</div>
				<div class="modal-body" style="text-align: center;">
					<form:form servletRelativeAction="/integracao/adicionar" method="get" modelAttribute="integracao" role="form" class="form-horizontal">
						<input type="hidden" name="id" id="id" value="" />

						<div class="form-group">
							<label class="control-label" style="font-size: 20px;">Adicionar Disciplina</label>
						</div>

						<div class="form-group">
							<label for="disciplinaInput2" class="col-sm-2 control-label">Código Disciplina</label>
							<div class="col-sm-10">
								<form:input id="disciplinaInput2" class="form-control" style="width: 150px;" placeholder="Código disciplina" path="disciplina" required="true" />
								<form:errors path="disciplina" cssClass="error" />
							</div>
						</div>

						<div class="form-group">
							<label for="quantidadeAlunos" class="col-sm-2 control-label">Quantidade alunos</label>
							<div class="col-sm-10">
								<form:input id="quantidadedeAlunos" class="form-control numeros" style="width: 150px;" placeholder="Quantidade alunos" path="quantidadeAlunos" onkeypress="mascara(this,soNumeros)" onchange="mascara(this,soNumeros)" required="true" />
								<form:errors path="quantidadeAlunos" cssClass="error" />
							</div>
						</div>

						<div class="form-group">
							<label for="semestreOferta" class="col-sm-2 control-label">Semestre oferta</label>
							<div class="col-sm-10">
								<form:input id="semestreOferta" class="form-control numeros" style="width: 150px;" placeholder="Semestre oferta" path="semestreOferta" onkeypress="mascara(this,soNumeros)" onchange="mascara(this,soNumeros)" required="true" />
								<form:errors path="semestreOferta" cssClass="error" />
							</div>
						</div>


<div class="modal fade " id="add-disciplina" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">Adicionar disciplina</div>
				<div class="modal-body" style="text-align: center;">
					<form:form servletRelativeAction="/integracao/adicionar" method="get" modelAttribute="integracao" role="form" class="form-horizontal">
						<input type="hidden" name="id" id="id" value="" />

						<div class="form-group">
							<label class="control-label" style="font-size: 20px;">Adicionar Disciplina</label>
						</div>

						<div class="form-group">
							<label for="disciplinaInput3" class="col-sm-2 control-label">Código Disciplina</label>
							<div class="col-sm-10">
								<form:input id="disciplinaInput3" class="form-control" style="width: 150px;" placeholder="Código disciplina" path="disciplina" required="true" />
								<form:errors path="disciplina" cssClass="error" />
							</div>
						</div>

						<div class="form-group">
							<label for="quantidadeAlunos" class="col-sm-2 control-label">Quantidade alunos</label>
							<div class="col-sm-10">
								<form:input id="quantidadedeAlunos" class="form-control numeros" style="width: 150px;" placeholder="Quantidade alunos" path="quantidadeAlunos" onkeypress="mascara(this,soNumeros)" onchange="mascara(this,soNumeros)" required="true" />
								<form:errors path="quantidadeAlunos" cssClass="error" />
							</div>
						</div>

						<div class="form-group">
							<label for="semestreOferta" class="col-sm-2 control-label">Semestre oferta</label>
							<div class="col-sm-10">
								<form:input id="semestreOferta" class="form-control numeros" style="width: 150px;" placeholder="Semestre oferta" path="semestreOferta" onkeypress="mascara(this,soNumeros)" onchange="mascara(this,soNumeros)" required="true" />
								<form:errors path="semestreOferta" cssClass="error" />
							</div>
						</div>

						<div class="controls">
							<input id="criar" class="btn btn-primary" type="submit" value="Adicionar" /> 
							<a href="<c:url value="/curso/listar"></c:url>" class="btn btn-default">Cancelar</a>
						</div>

					</form:form>
				</div>

				<div class="modal-body">Tem certeza de que deseja excluir?</div>

				<div class="modal-footer">
					<a href="#" class="btn btn-danger">Excluir</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>
						<div class="controls">
							<input id="criar" class="btn btn-primary" type="submit" value="Adicionar" /> 
							<a href="<c:url value="/curso/listar"></c:url>" class="btn btn-default">Cancelar</a>
						</div>


					</form:form>
				</div>



				<div class="modal-body">Tem certeza de que deseja excluir?</div>

				<div class="modal-footer">
					<a href="#" class="btn btn-danger">Excluir</a>
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				</div>

			</div>
		</div>
	</div>
	</div>
</body>
</html>