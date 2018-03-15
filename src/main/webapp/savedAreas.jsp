<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
    xmlns:th="http://www.thymeleaf.org"
    xmlns:sec="http://www.thymeleaf.org">

<head>

<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
}



</style>

<title>Area Rating System</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
	
<script>
function goBack() {
    window.history.back();
}
</script>
</head>
<body>
    <div id="custom-bootstrap-menu-savedareas" class="navbar navbar-default " role="navigation">
    <div class="container-fluid">
        <div class="navbar-header"><a class="navbar-brand" href="/" style="max-width: 30%;">
    <img src="${pageContext.request.contextPath}/resources/images/logo2.PNG">
 </a>
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse navbar-menubuilder">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="javascript:goBack();">Back To The Map</a>
                </li>
                <li><a href="#">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</div>
	<h3>Your saved Areas</h3>
	
	<table class="table table-striped">
		<tr>
			<!--  <th class="tg-area">Area ID</th>
			<!--<th width="5%"></th> -->
			<th width="10%"class="tg-address">Address</th>
			
			<th width="5%"class="tg-houseprice">House Price</th>
			
			<th width="3.5%" class="tg-crimerating">Crime Rating</th>
			 
			<th width="3.5%" class="tg-schools">Schools</th>
			 
			<th width="3.5%" class="tg-university">Park</th>
			 
			<th width="3.5%" class="tg-bars">Bars</th>
			 
			<th width="3.5%" class="tg-restaurant">Gym</th>
			 
			<th width="3.5%" class="tg-sportsleisure">Restaurant</th>
			
			<th width="3.5%" class="tg-blank"> </th>
			
			<th width="3.5%" class="tg-blank"> </th>
			 


		</tr>
<!-- 		<tr>
			<td class="tg-yw4l"></td>
			<td class="tg-yw4l"></td>
			<td class="tg-yw4l"></td>
			<td class="tg-yw4l"></td>
			<td class="tg-yw4l"></td>
			<td class="tg-yw4l"></td>
			<td class="tg-yw4l"></td>
			<td class="tg-yw4l"></td>
			<td class="tg-yw4l"></td>
		</tr> -->

		<c:forEach var="o" items="${savedAreas}">
			<tr>
				<td width="10%" height="50"><c:out value="${o.areaName}" /></td>
				 
                <td width="5%" height="50" class="tg-yw4l"></td>
                 
                <td width="3.5%" height="50"  class="tg-yw4l"></td>
                 
				<td width="3.5%" height="50"  class="tg-yw4l"><c:out value="${o.schools}" /></td>
				 
				<td width="3.5%"  height="50"  class="tg-yw4l"><c:out value="${o.university}" /></td>
				 
				<td width="3.5%" height="50"  class="tg-yw4l"><c:out value="${o.bars}" /></td>
				 
				<td width="3.5%"  height="50"  class="tg-yw4l"><c:out value="${o.gym}" /></td>
				 
				<td width="3.5%" height="50"  class="tg-yw4l"><c:out value="${o.restaurant}" /></td>
				 
				<td width="5%" height="50"  class="tg-yw4l"><a href = "welcome"> View on the map</a></td>
				
			   <!--  <td width="3%" height="50"  class="tg-yw4l">  <button type="button" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-remove"></span> Remove 
                </button></td> -->
                
                <td width="3%" height="50"  class="tg-yw4l">      
			    	 <form th:action="@{deletearea}" method="post" th:object="${area}">
			    	 <!--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> -->
              		<button type="submit" value="Submit" class="btn btn-danger">Delete</button>
                  </form>
                </td>
             </tr>
		</c:forEach>
		
		

</table>
</body>
</html>