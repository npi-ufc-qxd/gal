<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="page-header">
	<h1>
		GAL <small>Gestão de Aquisição de Livros</small>
	</h1>
</div>
<sec:authorize access="isAuthenticated()">
	<div align="right">Olá, ${pageContext.request.userPrincipal.name}!</div>
</sec:authorize>
<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/inicio'/>">Início</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Componentes Curriculares<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<sec:authorize access="hasAnyRole('COORDENACAO_ACADEMICA')">
							<li><a href="<c:url value='/componente/adicionar'/>">Adicionar</a></li>
							<li class="divider"></li>
						</sec:authorize>
						<li><a href="<c:url value='/componente/listar'/>">Listar</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Cursos<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<sec:authorize access="hasAnyRole('COORDENACAO_ACADEMICA')">
							<li><a href="<c:url value='/curso/adicionar'/>">Adicionar</a></li>
							<li class="divider"></li>
						</sec:authorize>
						<li><a href="<c:url value='/curso/listar'/>">Listar</a></li>
					</ul>
				</li>				
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Títulos<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<sec:authorize access="hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO','COORDENACAO_ACADEMICA')">
							<li><a href="<c:url value='/titulo/adicionar'/>">Adicionar</a></li>
							<li class="divider"></li>
						</sec:authorize>
						<li><a href="<c:url value='/titulo/listar'/>">Listar</a></li>
					</ul>
				</li>	
				<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Cálculos de Metas<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<sec:authorize access="hasAnyRole('BIBLIOTECARIO','COORDENACAO_ACADEMICA')">
							<li><a href="<c:url value='/meta/configurar'/>">Configurar</a></li>
						</sec:authorize>
							<li><a href="<c:url value='/meta/listar'/>">Listar</a></li>
						<sec:authorize access="hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO','COORDENACAO_ACADEMICA')">
							<li class="divider"></li>
							<li><a href="<c:url value='/meta/downloadMetaDetalhada'/>">Download</a></li>
						</sec:authorize>
					</ul>
				</li>
				<li>
				<sec:authorize access="hasAnyRole('BIBLIOTECARIO','COORDENACAO_ACADEMICA')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Acervo<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/acervo/atualizar'/>">Atualizar
									acervo</a></li>
							<li class="divider"></li>
							<li><a href="<c:url value='/acervo/conflitos'/>">Resolver
									Conflitos</a></li>
						</ul>
					</li>
				</sec:authorize>		
				<li><a href="<c:url value='/contatos'/>">Contato/Suporte</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="isAuthenticated()">
					<li><a href="<c:url value="/logout" />">Sair<span
						class="glyphicon glyphicon-off"></span></a></li>						
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<li><a href="<c:url value="/login" />">Login&nbsp;<span
						class="glyphicon glyphicon-user"></span></a></li>
				</sec:authorize>			
			</ul>
		</div>
	</div>
</nav>
