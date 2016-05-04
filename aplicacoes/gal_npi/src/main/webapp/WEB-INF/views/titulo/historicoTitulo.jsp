<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Historico</title>
<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />
		<c:if test="${not empty error}">
			<div class="alert alert-info alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<c:out value="${error}"></c:out>
			</div>
		</c:if>
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<c:if test="${empty error}">
					<table class="table table-condensed table-striped table-bordered">
						<thead>
							<tr>
								<th>Quem alterou</th>
								<th>Data</th>
								<th>O que foi alterado</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="tituloMudanca" items="${tituloMudancas}">
								<tr>
									<td>${tituloMudanca.username}</td>
									<td>${tituloMudanca.data}</td>
									<td>${tituloMudanca.mudanca}</td>
								</tr>
							</c:forEach>	
						</tbody>
					</table>
				</c:if>
			</div>
		</div>
		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>