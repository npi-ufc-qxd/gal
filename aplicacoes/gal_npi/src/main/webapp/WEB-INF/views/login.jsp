<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Página de Login</title>


<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
<link href="<c:url value="/resources/font-awesome/css/font-awesome.css"  />"
	rel="stylesheet" />
<link href="<c:url value="/resources/css/style.css"  />" rel="stylesheet">
<link href="<c:url value="/resources/css/style-responsive.css"  />"
	rel="stylesheet">

</head>

<body onload='document.f.j_username.focus();'>
	

	<div id="login-page">
		<div class="container">

			
			
			<form class="form-login" action="<c:url value='j_spring_security_check' />" method='POST'>
				<h2 class="form-login-heading">Login</h2>
				<div class="login-wrap">
					<input type="text" class="form-control" placeholder="Usuário" name='j_username' autofocus><br> 
					<input type="password" class="form-control" placeholder="Senha" name='j_password'><br> 	
					<input class="btn btn-theme btn-block" name="submit" type="submit" value="Login" value="Login" /><br>  
					<input class="btn btn-theme btn-block" name="reset" type="reset" value="Limpar" /><br> 
							
					<c:if test="${not empty error}">
						<div class="error">${error}</div>
					</c:if>
					<c:if test="${not empty msg}">
						<div class="msg">${msg}</div>
					</c:if>
					
					<hr>
				</div>

			</form>

		</div>
	</div>
	
<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

<!--BACKSTRETCH-->
<!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery.backstretch.min.js" />"></script>
<script>
        $.backstretch("resources/images/intro-bg.jpg", {speed: 500});
    </script>
</body>
</html>