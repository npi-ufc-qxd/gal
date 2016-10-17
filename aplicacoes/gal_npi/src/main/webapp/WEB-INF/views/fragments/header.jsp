<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<section id="container">
	<!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
	<!--header start-->
	<header class="header black-bg">
		<div class="sidebar-toggle-box">
			<div class="fa fa-bars tooltips" data-placement="right"
				data-original-title="Toggle Navigation"  ></div>
		</div>
		<!--logo start-->
		<a href="<c:url value='/'/>" class="logo"><b>GAL</b></a>
		<!--logo end-->

		<div class="top-menu">
			<ul class="nav pull-right top-menu">
				
				<sec:authorize access="isAuthenticated()">
					<li><a class="logout" href="<c:url value="/logout" />">Sair<span
						class="glyphicon glyphicon-off"></span></a></li>						
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<li><a class="logout" href="<c:url value="/login" />">Login&nbsp;<span
						class="glyphicon glyphicon-user"></span></a></li>
				</sec:authorize>	
			</ul>
		</div>
	</header>
	<!--header end-->

	<!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
	<!--sidebar start-->
	<aside>
		<div id="sidebar" class="nav-collapse ">
			<!-- sidebar menu start-->
			<ul class="sidebar-menu" id="nav-accordion">
				<sec:authorize access="isAuthenticated()">
					<h5 class="centered">${pageContext.request.userPrincipal.name}</h5>
				</sec:authorize>
				<li><a href="<c:url value='/componente/listar'/>">Componentes Curriculares</a></li>

				<li><a href="<c:url value='/curso/listar'/>">Cursos</a></li>
				
				<li><a href="<c:url value='/titulo/listar'/>">Titulos</a></li>

				<li class="sub-menu"><a href="javascript:;"><span>Cálculo de Metas</span></a>
					<ul class="sub">
						<sec:authorize access="hasAnyRole('BIBLIOTECARIO','COORDENACAO_ACADEMICA')">
							<li><a href="<c:url value='/meta/configurar'/>">Configurar</a></li>
						</sec:authorize>
							<li><a href="<c:url value='/meta/listar'/>">Listar</a></li>
						<sec:authorize access="hasAnyRole('BIBLIOTECARIO', 'COORDENADOR_CURSO','COORDENACAO_ACADEMICA')">		
							<li><a href="<c:url value='/meta/downloadMetaDetalhada'/>">Download</a></li>
						</sec:authorize>	
					</ul>
				</li>
				<sec:authorize access="hasAnyRole('BIBLIOTECARIO','COORDENACAO_ACADEMICA')">
					<li class="sub-menu"><a href="javascript:;"> <span>Acervo</span></a>
						<ul class="sub">
							<li><a href="<c:url value='/acervo/atualizar'/>">Atualizar Acervo</a></li>
							<li><a href="<c:url value='/acervo/conflitos'/>">Resolver Conflitos</a></li>
						</ul>
					</li>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('BIBLIOTECARIO','COORDENACAO_ACADEMICA','COORDENADOR_CURSO')">
					<li class="sub-menu"><a href="<c:url value="/fornecedor/listar" />">Fornecedores</a></li>
				</sec:authorize>		

			</ul>
			<!-- sidebar menu end-->
		</div>
	</aside>
	<!--sidebar end-->
	

</section>