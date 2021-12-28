<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- c:out ; c:forEach ; c:if -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
   <!-- Formatting (like dates) -->
 <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
   <!-- form:form -->
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
   <!-- for rendering errors on PUT routes -->
 <%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${ticket.title }"/>'s Info</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/style.css">

</head>
<body>
    <div class="bodyContainer"> <!-- Beginning of Container -->
        
        <h1>Title: <c:out value="${ticket.title }"/></h1>
        
        <p>Priority: <c:out value="${ticket.priority }"/></p>
        
        <p>Description: <c:out value="${ticket.description }"/></p>
        
        <a href="/ticket/${id}/edit"><button type="button" class="btn btn-warning">&lt; Edit</button></a>
        
        <a href="/home"><button type="button" class="btn btn-secondary">Go Back</button></a>
        
        
    </div> <!-- End of Container -->
</body>
</html>