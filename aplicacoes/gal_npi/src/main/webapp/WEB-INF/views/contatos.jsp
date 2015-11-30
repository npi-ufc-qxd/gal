<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Contatos</title>
<jsp:include page="fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container" >
		<jsp:include page="fragments/header.jsp" />

		<div id="informacao">
			<p>Atendimento presencial: Bloco 2, Térreo, de Segunda a Sexta</p>
			<p>Contato: npi@quixada.ufc.br</p>
		</div>

		<jsp:include page="fragments/footer.jsp" />
	</div>

</body>
</html>


