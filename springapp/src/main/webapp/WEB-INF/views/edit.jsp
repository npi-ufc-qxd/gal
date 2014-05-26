<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=iso-8859-1"
    pageEncoding="iso-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 
    Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <title>Editar Disciplina</title>
    
<jsp:include page="fragments/headTag.jsp" />

    <body>
 
 		<section id = "caixaFormulario">
 		
 		<form:form modelAttribute="disciplina" id="formulario" action="editDisciplinaForm.htm" method = "post">
        <h2>Editar Disciplina </h2>
        
	
		 <form:label path="nome">Nome:</form:label><br>
		 <form:input path="nome"/><br>
		 
		  <form:label path="code">Codigo:</form:label><br>
		  <form:input path="code"/><br>
		  
		<form:errors path="*" cssClass="errorBox" element="div" />
		 
		
		<input type="submit" value="Submit"/>
 
 	   </form:form>
 
 		</section>
        
    </body>