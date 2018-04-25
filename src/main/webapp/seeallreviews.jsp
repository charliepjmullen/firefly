<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
    xmlns:th="http://www.thymeleaf.org"
    xmlns:sec="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
	<style>
		.logoimage {
    position: absolute;
    top: 0px;
    left: 0px;
    height : 100%;
    width: 22%;
}
	</style>
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
                <li><a href="/">Back To The Map</a>
                </li>
                <li><a href="#">Log Out</a>
                </li>
            </ul>
        </div>
    </div>
</div>
<h1>Reviews</h1>
<table class="table table-striped">
<c:forEach var="o" items="${reviews}">
			<tr>
			    <td width="3.5%"  height="50"></td>
				<td width="10%" height="50"><h4><c:out value="${o.username}" /></h4></td>
				 
				 <td width="3.5%"  height="50">  </td>
				 
				<td class="tg-yw4l"><h3><c:out value="${o.comment}" /></h3></td>
				
				<td></td>
				 
			
             </tr>
             <br>
		</c:forEach>
	</table>	
</body>
</html>