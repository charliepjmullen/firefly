<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
    xmlns:th="http://www.thymeleaf.org"
    xmlns:sec="http://www.thymeleaf.org">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
	<style>
		.logoimage {
    position: absolute;
    top: 0px;
    left: 0px;
    height : 100%;
    width: 22%;
}

.form-group-container{
    position: absolute;
    left: 10px;
	width : 50%;
}
	</style>
<script>

var address = "${address}";
var latitude = "${latitude}";
var longitude = "${longitude}";

var user = "${user}";
var comment = "${comment}";



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

<h4>Address: <c:out value="${address}"/></h4>
<h4>Latitude: <c:out value="${latitude}"/></h4>
<h4>Longitude: <c:out value="${longitude}"/></h4>
<div class="form-group-container">
<form:form method="get" action="/addreview/${address}/${latitude}/${longitude}" >
  <textarea class="form-control" rows="4" cols="50" name="comment">
Enter your Review</textarea>
  <input type="submit">
</form:form> 
</div>

<table style="width:100%">


  
</table>
</body>
</html>