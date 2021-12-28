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
<title>Create a New Ticket!</title>
  <!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
      rel="stylesheet" 
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
      crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/style.css">

</head>
<body>
    <div class="bodyContainer"> <!-- Beginning of Container -->
    
    <h1>Create a new ticket:</h1>
    
    <form:form action="/newTicket" method="post" modelAttribute="ticket">
    
    	<form:input path="user" type="hidden" value="${user_id }"/>
    	
    	<p>
        	<form:errors path="title" class="text-danger"/><br>
        	<form:label path="title">Title of Issue: </form:label>
        	<form:input path="title"/>
        </p>
        
        <p>
        	<form:label path="priority">Priority: </form:label>
        	<form:errors path="priority" class="text-danger"/>
        	<form:select path="priority">
        	
        		<form:option value="Low">Low</form:option>
        		<form:option value="Medium">Medium</form:option>
        		<form:option value="High">High</form:option>
        		<form:option value="Critical">Critical</form:option>
        		
       		</form:select>
        </p>
        
        <p>
        	<form:errors path="description" class="text-danger"/><br>
        	<form:label path="description">Enter a Description of your Issue: </form:label>
        	<form:textarea path="description"/>
        </p>
    	
    	<a href="/home"><button type="button" class="btn btn-secondary">Cancel</button></a>
    	<input type="submit" class="btn btn-success" value="Submit"/>
    
    </form:form>
        
    </div> <!-- End of Container -->
</body>
</html>