<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
    xmlns:th="http://www.thymeleaf.org"
    xmlns:sec="http://www.thymeleaf.org">

<head>

<title>Area Rating System</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


</head>
<body>

	<h3>Your saved Areas</h3>
	
	<table class="table table-striped">
		<tr>
			<th width="5%"class="tg-houseprice">House Price</th>
			<th width="3.5%" class="tg-crimerating">Number of Houses</th>
		</tr>
		
		<c:forEach var="o" items="${housepricesList}">
			<tr>
				<td width="10%" height="50"><c:out value="${o.housePrice}" /></td> 
                <td width="5%" height="50"><c:out value="${o.number_of_houses}" /></td>   
             </tr>
		</c:forEach>
		
</table>
</body>
</html>