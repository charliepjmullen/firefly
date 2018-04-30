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

.logoimage {
    position: absolute;
    top: 0px;
    left: 0px;
    height : 100%;
    width: 22%;
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
    <img class ="logoimage" src="${pageContext.request.contextPath}/resources/images/logo2.PNG">
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

			<th width="10%"class="tg-address">Address</th>
			
			<th width="5%"class="tg-houseprice">House Price</th>

			 
			<th width="3.5%" class="tg-schools">Schools</th>
			 
	
			<th width="3.5%" class="tg-bars">Bars</th>
			 
			<th width="3.5%" class="tg-restaurant">Gym</th>
			 
			<th width="3.5%" class="tg-sportsleisure">Restaurant</th>
			
			<th width="3.5%" class="tg-blank"> </th>
			
			<th width="3.5%" class="tg-blank"> </th>
			 


		</tr>


		<c:forEach var="o" items="${savedAreas}">
			<tr>
				<td width="10%" height="50"><c:out value="${o.areaName}" /></td>
				 
                <td width="5%" height="50" class="tg-yw4l"><c:out value="${o.house_price}" /></td>
                 

				<td width="3.5%" height="50"  class="tg-yw4l"><c:out value="${o.schools}" /></td>
				 
				 
				<td width="3.5%" height="50"  class="tg-yw4l"><c:out value="${o.bars}" /></td>
				 
				<td width="3.5%"  height="50"  class="tg-yw4l"><c:out value="${o.gym}" /></td>
				 
				<td width="3.5%" height="50"  class="tg-yw4l"><c:out value="${o.restaurant}" /></td>
				 
				 <td width="3.5%" height="50">
 				 <a href="<c:url value='/map/${o.areaId}' />">
   				View on Map
  				</a>
                </td>
                
                <td width="3.5%" height="50">
 				 <a href="<c:url value='/deletearea/${o.areaId}' />">
   				Delete
  				</a>
                </td>
                
                
             </tr>
		</c:forEach>
		
		

</table>
</body>
</html>