<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="datatables" uri="http://github.com/dandelion/datatables"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
	<title>Editar Estrutura Curricular</title>
	<jsp:include page="../../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container" style="width: 1000px; margin: 0 auto;">
		<jsp:include page="../../fragments/header.jsp" />
		<form:form servletRelativeAction="/curso/${curso.codigo}/estrutura/${curso.id}/editar" method="post" modelAttribute="estruturaCurricular" role="form" class="form-horizontal">
			<form:input path="id" type="hidden" />
			<div class="form-group" style="text-align: center;">
				<label class="control-label" style="font-size: 20px;">Adicionar
					Nova Estrutura Curricular</label>
			</div>



			<div class="form-group">
				<label for="codigo" class="col-sm-1 control-label"style="width:210px;">Código</label>
				<div class="col-sm-9">
					<form:input id="codigo" class="form-control" style="float:right;" placeholder="Ex.: 2010.1" path="codigo" />
					<form:errors path="codigo" cssClass="error" />
				</div>
			</div>

			<div class="form-group">
				<label for="matrizCurricular" class="col-sm-1 control-label"style="width:210px;">Matriz
					Curricular</label>
				<div class="col-sm-9">
					<form:input id="matrizCurricular" class="form-control"
						placeholder="Ex.: ENGENHARIA DE SOFTWARE - QUIXADÁ - Presencial - BACHARELADO EM ENGENHARIA DE SOFTWARE - MT - BACHARELADO"
						path="matrizCurricular" />
					<form:errors path="matrizCurricular" cssClass="error" />
				</div>
			</div>
			<div class="form-group">
				<label for="unidadeVinculacao" class="col-sm-1 control-label"style="width:210px;">Unidade de
					Vinculação</label>
				<div class="col-sm-9">
					<form:input id="unidadeVinculacao" class="form-control"
						placeholder="Ex.: Campus da UFC em Quixadá/Diretoria (11.00.01.31)"
						path="unidadeVinculacao" />
					<form:errors path="unidadeVinculacao" cssClass="error" />
				</div>
			</div>
			<div class="form-group">
				<label for="municipio" class="col-sm-1 control-label"style="width:210px;">Município de
					Funcionamento</label>
				<div class="col-sm-9">
					<form:input id="municipio" class="form-control"
						placeholder="Ex.: Quixadá-CE" path="municipio" />
					<form:errors path="municipio" cssClass="error" />
				</div>
			</div>
			<div class="form-group">
				<label for="semestreEntradaVigor" class="col-sm-1 control-label"style="width:210px;">Período Letivo de Entrada
					em Vigor</label>
				<div class="col-sm-9">
					<form:input id="semestreEntradaVigor" class="form-control"
						placeholder="Ex.: 2011.2"
						path="semestreEntradaVigor" />
					<form:errors path="semestreEntradaVigor" cssClass="error" />
				</div>
			</div>
			<div class="form-group">
				<label for="chOptMinima" class="col-sm-1 control-label"style="width:210px;">C.H. Optativa Mínima (hrs)</label>
				<div class="col-sm-9">
					<form:input id="chOptMinima" class="form-control"
						placeholder="Carga Horária Optativa Mínima"
						path="chOptMinima" />
					<form:errors path="chOptMinima" cssClass="error" />
				</div>
			</div>
			
			<div class="form-group">

				<label for="chCompOptLivres" class="col-sm-1 control-label"style="width:210px;">C.H. Máxima Comps. Optativos Livres (hrs):</label>
				<div class="col-sm-9">
					<form:input id="chCompOptLivres" class="form-control"
						placeholder="Carga Horária Máxima de Componentes Curriculares Optativos Livres"
						path="chCompOptLivres" />
					<form:errors path="chCompOptLivres" cssClass="error" />
				</div>
			</div>
			
		
			
				<label>Prazos Conclusão Períodos Letivos</label><br><br>
				
				<div class="form-group">
				<label for="prazoConclusaoMinimo" class="col-sm-1 control-label"style="width:210px;">Mínimo:</label>
					<div class="col-sm-9">
					<form:input id="prazoConclusaoMinimo" class="form-control" 
						placeholder="Mínimo"
						path="prazoConclusaoMinimo" />
					<form:errors path="prazoConclusaoMinimo" cssClass="error" />	
				</div></div>
				
				<div class="form-group">
				<label for="prazoConclusaoMedio" class="col-sm-1 control-label"style="width:210px;">Médio:</label>
					<div class="col-sm-9">
					<form:input id="prazoConclusaoMedio" class="form-control" 
						placeholder="Médio"
						path="prazoConclusaoMedio" />
					<form:errors path="prazoConclusaoMedio" cssClass="error" />
				</div></div>
				
				<div class="form-group">
				<label for="prazoConclusaoMaximo" class="col-sm-1 control-label"style="width:210px;">Máximo:</label>
					<div class="col-sm-9">
					<form:input id="prazoConclusaoMaximo" class="form-control" 
						placeholder="Máximo"
						path="prazoConclusaoMaximo" />
					<form:errors path="prazoConclusaoMaximo" cssClass="error" />
				</div></div>
					
			
			
			
			
			
				<label >Carga Horária por Período Letivo (hrs)</label><br><br>
				
				<div class="form-group">
				<label for="chPeriodoMinimo" class="col-sm-1 control-label"style="width:210px;">Mínima:</label>
					<div class="col-sm-9">
					<form:input id="chPeriodoMinimo" class="form-control"
						placeholder="Mínima"
						path="chPeriodoMinimo" />
					<form:errors path="chPeriodoMinimo" cssClass="error" />
				</div></div>
				
				<div class="form-group">
				<label for="chPeriodoMedio" class="col-sm-1 control-label"style="width:210px;">Média:</label>
					<div class="col-sm-9">
					<form:input id="chPeriodoMedio" class="form-control" 
						placeholder="Média"
					 	path="chPeriodoMedio" />
					<form:errors path="chPeriodoMedio" cssClass="error" />
				</div></div>
				
				<div class="form-group">
				<label for="chPeriodoMaximo" class="col-sm-1 control-label"style="width:210px;">Máxima:</label>
					<div class="col-sm-9">
					<form:input id="chPeriodoMaximo" class="form-control"
						placeholder="Máxima"
						path="chPeriodoMaximo" />
					<form:errors path="chPeriodoMaximo" cssClass="error" />
				</div>	
				


			<br><br><br><br>
			<div class="controls">
				<input id="criar" class="btn btn-primary" type="submit" value="Editar"/>
				<a	href="<c:url value="javascript:window.history.go(-1)"></c:url>" class="btn btn-default">Cancelar</a>
			</div>
		</form:form>
		<jsp:include page="../../fragments/footer.jsp" />
	</div>
</body>
</html>