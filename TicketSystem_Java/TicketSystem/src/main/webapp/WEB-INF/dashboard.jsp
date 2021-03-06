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
<title><c:out value="${userName }">Placeholder</c:out>'s dashboard!</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/style.css">

</head>
<body>
    <div class="bodyContainer"> <!-- Beginning of Container -->
    
    <div class="headerRow">
    	<h1>Welcome, <c:out value="${userName }">Placeholder</c:out>!!!</h1>
    	<a class="btn btn-info" href="/logout" role="button" id="logoutBtn">Logout</a>
    </div>
    
    <p>Here's some stuff for you!</p>
    
    <a class="btn btn-warning" href="/createTicket" role="button" id="newTicketBtn">+ New Ticket</a>
    
    <table class="table">
    	<thead>
    		<tr>
    			<th scope="col">Ticket #:</th>
    			<th scope="col">Title (Issue):</th>
    			<th scope="col">Priority:</th>
    			<th scope="col">Actions:</th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="issue" items="${allTickets }">
    			<tr>
    				<td><c:out value="${issue.id }">#test</c:out></td>
    				<td><a href="/tickets/${issue.id }"><c:out value="${issue.title }">Placeholder</c:out></a></td>
    				<td><c:out value="${issue.priority }">Placeholder</c:out></td>
    				<td>Button1(edit) | <a class="btn btn-danger" href="/deleteConfirmation/${issue.id}/confirmed" role="button">Delete</a></td>
    			</tr>
    		</c:forEach>
    	</tbody>
    </table>
        
    </div> <!-- End of Container -->
</body>
</html>