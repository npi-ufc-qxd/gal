<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>${curso.sigla}-${curso.nome}</title>
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
		<div class="panel-body">
			<h4 class="center">${curso.sigla} - ${curso.nome}</h4>
			<ul class="nav nav-tabs" role="tablist">
				<c:forEach items="${curso.curriculos}" var="curriculo"
					varStatus="ct">
					<c:if test="${ct.index == 0}">
						<c:set var="act" value="active"></c:set>
					</c:if>
					<c:if test="${ct.index != 0}">
						<c:set var="act" value=""></c:set>
					</c:if>
					<li class="${act }"><a href="#${curriculo.id }" role="tab"
						data-toggle="tab">${curriculo.codigo}</a></li>
				</c:forEach>
				<sec:authorize
					access="hasAnyRole('COORDENADOR_CURSO','COORDENACAO_ACADEMICA')">
					<div id="button-add">
						<a
							href="<c:url value="/curso/${curso.codigo}/estrutura/adicionar" ></c:url>">
							<button class="btn btn-primary pull-left">
								<span class="glyphicon glyphicon-plus"></span> Adicionar
								Curriculo
							</button>
						</a>
						<form id="importarCurriculo" method="POST"
							action="<c:url value="/curso/${curso.codigo}/estrutura/importar"></c:url>"
							enctype="multipart/form-data" style="float: right;">
							<input type="file" name="file" id="fileupload" accept="text/html"
								class="file" />
							<script type="text/javascript">
								document.getElementById("fileupload").onchange = function() {
									document
											.getElementById("importarCurriculo")
											.submit();
								}
							</script>
						</form>
					</div>
				</sec:authorize>
			</ul>
			<div class="tab-content">
				<c:forEach items="${curso.curriculos}" var="curriculo"
					varStatus="count">
					<c:if test="${count.index == 0}">
						<c:set var="active" value="active"></c:set>
					</c:if>
					<c:if test="${count.index != 0}">
						<c:set var="active" value=""></c:set>
					</c:if>
					<div class="tab-pane ${active }" id="${curriculo.codigo }"></div>
					<div id="${curriculo.id}" class="tab-pane ${active }">
						<sec:authorize
							access="hasAnyRole('COORDENADOR_CURSO','COORDENACAO_ACADEMICA')">
							<div id="button-add">
								<a style="float: left;" class="btn btn-success pull-left btn-sm"
									href="<c:url value="/integracao/${curriculo.id}/adicionar" ></c:url>">
									<span class="glyphicon glyphicon-link"></span> Vincular
									Componente Curricular
								</a>
							<div class=" pull-right">	
								
								<a href="<c:url value="/curso/${curso.codigo}/estrutura/${curriculo.id }/relatorioGeral" ></c:url>">
									<button class="btn btn-primary btn-sm">
										<span class="glyphicon glyphicon-file"></span> Relatório Geral
									</button>
								</a>
								
								<a href="<c:url value="/curso/${curso.codigo}/estrutura/${curriculo.id }/editar" ></c:url>">
									<button class="btn btn-primary btn-sm">
										<span class="glyphicon glyphicon-edit"></span> Editar Curriculo
									</button>
								</a>
								
								<a id="excluir" class="btn btn-danger btn-sm"
									data-toggle="modal" data-target="#confirm-delete" href="#"
									data-href="<c:url value="/curso/${curso.codigo}/estrutura/${curriculo.id }/excluir" ></c:url>">
									<span class="glyphicon glyphicon-trash"></span> Excluir Curriculo
								</a> 
							</div>			
							</div>
							<div>
								<div class="halfContainer">
									<b>Código: </b> ${curriculo.codigo} <br> 
									<b>Matriz Curricular:</b> ${curriculo.matrizCurricular}<br> 
									<b>Unidade de Vinculação: </b>${curriculo.unidadeVinculacao }<br> 
									<b>Município de funcionamento: </b> ${curriculo.municipio }<br> 
									<b>Período Letivo de Entrada em Vigor: </b>${curriculo.semestreEntradaVigor}<br>
									<b>Carga Horária Optativa Minima: </b>${curriculo.chOptMinima }<b>hrs</b><br>
									<b>Carga Horária Máxima de Componentes Curriculares Optativos Livres: </b>${curriculo.chCompOptLivres }<b>hrs</b><br>
									<br>
								</div>
								<div class="halfContainer">
									<div class="littleBox">
										<b>Prazos para Conclusão em Períodos Letivos </b><br> <b>Mínimo:
										</b>${curriculo.prazoConclusaoMinimo }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<b>Médio: </b>${curriculo.prazoConclusaoMedio }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<b>Máximo: </b>${curriculo.prazoConclusaoMaximo }<br>
									</div>
									<div class="littleBox" style="border-top: 0px">
										<b>Carga Horária por Período Letivo</b><br> <b>Mínima:
										</b>${curriculo.chPeriodoMinimo }<b> hrs</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<b>Média: </b>${curriculo.chPeriodoMedio }<b> hrs</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<b>Máxima: </b>${curriculo.chPeriodoMaximo }<b> hrs</b><br>
									</div>
									<hr width="102%">
									<div class="littleBox">
										<b>Carga Horária Obrigatória</b><br> <b>Total: </b>${curriculo.chObrigatoria}<b>
											hrs</b>&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp; <b>( </b>${curriculo.chObgPratica }<b>
											hrs</b> <b>Práticas ) / ( </b> ${curriculo.chObgTeorica }<b>
											hrs</b> <b> Teóricas )</b><br>
									</div>
									<div style="padding: 0px 12px;">
										<b>Carga Horária Total Mínima: </b>${curriculo.chTotalMinima }<b>
											hrs</b><br> <b>Carga Horária Obrigatória de Atividade
											Acadêmica Específica: </b>${curriculo.chAtvAcademicaEspecifica }<b>
											hrs</b><br>
									</div>
									<br>
								</div>
							</div>
						</sec:authorize>
						<sec:authorize
							access="hasAnyRole('COORDENADOR_CURSO','COORDENACAO_ACADEMICA')">
							<div class="panel panel-default">
								<datatables:table id="${curso.id}"
									data="${curriculo.curriculos}" cdn="false" row="integracao"
									theme="bootstrap2"
									cssClass="table table-striped table-orderable"
									no-sort-fields="1 2 4 5" default-sort="3 desc">
									<datatables:column title="Componente">
										<c:out value="${integracao.componente.nome}"></c:out>
									</datatables:column>
									<datatables:column title="Código componente">
										<c:out value="${integracao.componente.codigo}"></c:out>
									</datatables:column>
									<datatables:column title="Natureza">
										<c:out value="${integracao.natureza}"></c:out>
									</datatables:column>
									<datatables:column title="Quantidade aluno">
										<c:out value="${integracao.quantidadeAlunos}"></c:out>
									</datatables:column>
									<datatables:column title="Semestre oferta">
										<c:out value="${integracao.semestreOferta}"></c:out>
									</datatables:column>
									<datatables:column title="Editar" style="text-align:center;">
										<a class="btn btn-primary btn-xs"
											href="<c:url value="/integracao/${integracao.componente.id}/${curriculo.id}/editar" ></c:url>">
											<span class="glyphicon glyphicon-edit "></span>
										</a>
									</datatables:column >
									<datatables:column title="Excluir" style="text-align:center;">
										<a id="excluir" class="btn btn-danger btn-xs" data-toggle="modal"
											data-target="#confirm-delete" href="#"
											data-href="<c:url value="/integracao/${integracao.componente.id}/${curriculo.id}/excluir" ></c:url>">
											<span class="glyphicon glyphicon-trash"></span>
								
										</a>
									</datatables:column>
								</datatables:table>
							</div>
						</sec:authorize>
						<sec:authorize
							access="!hasAnyRole('COORDENADOR_CURSO','COORDENACAO_ACADEMICA')">
							<div class="panel panel-default">
								<datatables:table id="estrutura${curso.id}"
									data="${curriculo.curriculos}" cdn="false" row="integracao"
									theme="bootstrap2"
									cssClass="table table-striped table-orderable"
									no-sort-fields="1 2" default-sort="3 desc">
									<datatables:column title="Componente">
										<c:out value="${integracao.componente.nome}"></c:out>
									</datatables:column>
									<datatables:column title="Código componente">
										<c:out value="${integracao.componente.codigo}"></c:out>
									</datatables:column>
									<datatables:column title="Quantidade aluno">
										<c:out value="${integracao.quantidadeAlunos}"></c:out>
									</datatables:column>
									<datatables:column title="Semestre oferta">
										<c:out value="${integracao.semestreOferta}"></c:out>
									</datatables:column>
								</datatables:table>
							</div>
						</sec:authorize>
					</div>
				</c:forEach>
			</div>
		</div>
		</div>
		</div>
		</section>
		</section>

		<jsp:include page="../fragments/footer.jsp" />
		<div class="modal fade" id="confirm-delete" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">Excluir</div>
					<div class="modal-body">Tem certeza de que deseja excluir
						essa estrutura curricular?</div>
					<div class="modal-footer">
						<a href="integracao/excluir" class="btn btn-danger">Excluir</a>
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="confirm-delete-integracao" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">Excluir</div>
					<div class="modal-body">Tem certeza de que deseja excluir
						essa integração?</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-danger">Excluir</a>
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade " id="add-disciplina" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog ">
				<div class="modal-content">
					<div class="modal-header">Adicionar Componente Curricular</div>
					<div class="modal-body" style="text-align: center;">
						<form:form servletRelativeAction="/integracao/adicionar"
							method="get" modelAttribute="integracao" role="form"
							class="form-horizontal">
							<input type="hidden" name="id" id="id" value="" />
							<div class="form-group">
								<label class="control-label" style="font-size: 20px;">Adicionar
									Componente Curricular</label>
							</div>
							<div class="form-group">
								<label for="componenteInput2" class="col-sm-2 control-label">Código
									Componente</label>
								<div class="col-sm-10">
									<form:input id="componenteInput2" class="form-control"
										style="width: 150px;"
										placeholder="Código componente curricular" path="componente"
										required="true" />
									<form:errors path="componente" cssClass="error" />
								</div>
							</div>
							<div class="form-group">
								<label for="quantidadeAlunos" class="col-sm-2 control-label">Quantidade
									alunos</label>
								<div class="col-sm-10">
									<form:input id="quantidadedeAlunos"
										class="form-control numeros" style="width: 150px;"
										placeholder="Quantidade alunos" path="quantidadeAlunos"
										onkeypress="mascara(this,soNumeros)"
										onchange="mascara(this,soNumeros)" required="true" />
									<form:errors path="quantidadeAlunos" cssClass="error" />
								</div>
							</div>
							<div class="form-group">
								<label for="semestreOferta" class="col-sm-2 control-label">Semestre
									oferta</label>
								<div class="col-sm-10">
									<form:input id="semestreOferta" class="form-control numeros"
										style="width: 150px;" placeholder="Semestre oferta"
										path="semestreOferta" onkeypress="mascara(this,soNumeros)"
										onchange="mascara(this,soNumeros)" required="true" />
									<form:errors path="semestreOferta" cssClass="error" />
								</div>
							</div>
							<div class="modal fade " id="add-disciplina" tabindex="-1"
								role="dialog" aria-labelledby="myLargeModalLabel"
								aria-hidden="true">
								<div class="modal-dialog ">
									<div class="modal-content">
										<div class="modal-header">Adicionar componente
											curricular</div>
										<div class="modal-body" style="text-align: center;">
											<form:form servletRelativeAction="/integracao/adicionar"
												method="get" modelAttribute="integracao" role="form"
												class="form-horizontal">
												<input type="hidden" name="id" id="id" value="" />
												<div class="form-group">
													<label class="control-label" style="font-size: 20px;">Adicionar
														Componente Curricular</label>
												</div>
												<div class="form-group">
													<label for="componenteInput3"
														class="col-sm-2 control-label">Código Componente
														Curricular</label>
													<div class="col-sm-10">
														<form:input id="componenteInput3" class="form-control"
															style="width: 150px;"
															placeholder="Código componente curricular"
															path="componente" required="true" />
														<form:errors path="componente" cssClass="error" />
													</div>
												</div>
												<div class="form-group">
													<label for="quantidadeAlunos"
														class="col-sm-2 control-label">Quantidade alunos</label>
													<div class="col-sm-10">
														<form:input id="quantidadedeAlunos"
															class="form-control numeros" style="width: 150px;"
															placeholder="Quantidade alunos" path="quantidadeAlunos"
															onkeypress="mascara(this,soNumeros)"
															onchange="mascara(this,soNumeros)" required="true" />
														<form:errors path="quantidadeAlunos" cssClass="error" />
													</div>
												</div>
												<div class="form-group">
													<label for="semestreOferta" class="col-sm-2 control-label">Semestre
														oferta</label>
													<div class="col-sm-10">
														<form:input id="semestreOferta"
															class="form-control numeros" style="width: 150px;"
															placeholder="Semestre oferta" path="semestreOferta"
															onkeypress="mascara(this,soNumeros)"
															onchange="mascara(this,soNumeros)" required="true" />
														<form:errors path="semestreOferta" cssClass="error" />
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
										<div class="modal-body">Tem certeza de que deseja
											excluir?</div>
										<div class="modal-footer">
											<a href="#" class="btn btn-danger">Excluir</a>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">Cancelar</button>
										</div>
									</div>
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
