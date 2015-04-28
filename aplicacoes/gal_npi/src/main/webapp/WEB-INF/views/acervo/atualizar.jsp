<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Atualização do Acervo</title>
<jsp:include page="../fragments/htmlHead.jsp" />
</head>
<body>
	<div id="container">
		<jsp:include page="../fragments/header.jsp" />
		<form:form modelAttribute="acervoDocumento" servletRelativeAction="/acervo/upload" method="post" enctype="multipart/form-data">
			<div  >
				<div class="input-group date"> 
					<input id="fim" class="data" />
				</div>
				<div class="input-group date">
					<input id="fim" class="data" />
				</div>
			</div>

			<p>			
				<label for="file">Arquivo para fazer upload</label> 
				<input type="file" name="file" multiple="multiple"/> 
				<input type="submit" name="submit" value="Upload" />

			</p>
		</form:form>
		<jsp:include page="../fragments/footer.jsp" />
	</div>
</body>
</html>
