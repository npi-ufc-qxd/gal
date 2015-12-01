<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<div class="page-header">
	<h1>
		GAL <small>Gestão de Aquisição de Livros</small>
	</h1>
</div>
<div align="right">Olá, ${sessionScope.usuario.nome}!</div>
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
					data-toggle="dropdown">Disciplinas<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<sec:authorize access="hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO')">
							<li><a href="<c:url value='/disciplina/adicionar'/>">Adicionar</a></li>
							<li class="divider"></li>
						</sec:authorize>
						<li><a href="<c:url value='/disciplina/listar'/>">Listar</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Cursos<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<sec:authorize access="hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO')">
							<li><a href="<c:url value='/curso/adicionar'/>">Adicionar</a></li>
							<li class="divider"></li>
						</sec:authorize>
						<li><a href="<c:url value='/curso/listar'/>">Listar</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Títulos<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<sec:authorize access="hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO')">
							<li><a href="<c:url value='/titulo/adicionar'/>">Adicionar</a></li>
							<li class="divider"></li>
						</sec:authorize>
						<li><a href="<c:url value='/titulo/listar'/>">Listar</a></li>
					</ul></li>
				<sec:authorize access="hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Cálculos de Metas<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/meta/configurar'/>">Configurar</a></li>
							<li><a href="<c:url value='/meta/listar'/>">Listar</a></li>
							<li class="divider"></li>
							<li><a href="<c:url value='/meta/downloadMetaDetalhada'/>">Download</a></li>
						</ul></li>
					<li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Acervo<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="<c:url value='/acervo/atualizar'/>">Atualizar
									acervo</a></li>
							<li class="divider"></li>
							<li><a href="<c:url value='/acervo/conflitos'/>">Resolver
									Conflitos</a></li>
						</ul></li>
				</sec:authorize>
				<li><a href="<c:url value='/contatos'/>">Contato/Suporte</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value="/logout" />">Sair<span
						class="glyphicon glyphicon-off"></span></a></li>
			</ul>
		</div>
	</div>
</nav>
