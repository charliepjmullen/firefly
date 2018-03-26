<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
    xmlns:th="http://www.thymeleaf.org"
    xmlns:sec="http://www.thymeleaf.org">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>House Price</title>

   <style>
 #geomap {
	width: 80%;
	height: 700px;
	float: right;
}

#inputbox {
    float: right; }

#forminputs .p {
	display: inline-block;
	float: left;
	clear: left;
	width: 200px;
	text-align: right;
}

#forminputs .input {
	display: inline-block;
	float: left;
}

/* Nav Side Bar  
.nav-side-menu {
	overflow: auto;
	font-family: verdana;
	font-size: 12px;
	font-weight: 200;
	background-color: #2e353d;
	position: fixed;
	top: 0px;
	width: 300px;
	height: 100%;
	color: #e1ffff;
}

.nav-side-menu .brand {
	background-color: #23282e;
	line-height: 50px;
	display: block;
	text-align: center;
	font-size: 14px;
}

.nav-side-menu .toggle-btn {
	display: none;
}

.nav-side-menu ul, .nav-side-menu li {
	list-style: none;
	padding: 0px;
	margin: 0px;
	line-height: 35px;
	cursor: pointer;
	/*    
    .collapsed{
       .arrow:before{
                 font-family: FontAwesome;
                 content: "\f053";
                 display: inline-block;
                 padding-left:10px;
                 padding-right: 10px;
                 vertical-align: middle;
                 float:right;
            }
     }

}

.nav-side-menu ul :not(collapsed) .arrow:before, .nav-side-menu li :not(collapsed) .arrow:before
	{
	font-family: FontAwesome;
	content: "\f078";
	display: inline-block;
	padding-left: 10px;
	padding-right: 10px;
	vertical-align: middle;
	float: right;
}

.nav-side-menu ul .active, .nav-side-menu li .active {
	border-left: 3px solid #d19b3d;
	background-color: #4f5b69;
}

.nav-side-menu ul .sub-menu li.active, .nav-side-menu li .sub-menu li.active
	{
	color: #d19b3d;
}

.nav-side-menu ul .sub-menu li.active a, .nav-side-menu li .sub-menu li.active a
	{
	color: #d19b3d;
}

.nav-side-menu ul .sub-menu li, .nav-side-menu li .sub-menu li {
	background-color: #181c20;
	border: none;
	line-height: 28px;
	border-bottom: 1px solid #23282e;
	margin-left: 0px;
}

.nav-side-menu ul .sub-menu li:hover, .nav-side-menu li .sub-menu li:hover
	{
	background-color: #020203;
}

.nav-side-menu ul .sub-menu li:before, .nav-side-menu li .sub-menu li:before
	{
	font-family: FontAwesome;
	content: "\f105";
	display: inline-block;
	padding-left: 10px;
	padding-right: 10px;
	vertical-align: middle;
}

.nav-side-menu li {
	padding-left: 0px;
	border-left: 3px solid #2e353d;
	border-bottom: 1px solid #23282e;
}

.nav-side-menu li a {
	text-decoration: none;
	color: #e1ffff;
}

.nav-side-menu li a i {
	padding-left: 10px;
	width: 20px;
	padding-right: 20px;
}

.nav-side-menu li:hover {
	border-left: 3px solid #d19b3d;
	background-color: #4f5b69;
	-webkit-transition: all 1s ease;
	-moz-transition: all 1s ease;
	-o-transition: all 1s ease;
	-ms-transition: all 1s ease;
	transition: all 1s ease;
}

@media ( max-width : 767px) {
	.nav-side-menu {
		position: relative;
		width: 100%;
		margin-bottom: 10px;
	}
	.nav-side-menu .toggle-btn {
		display: block;
		cursor: pointer;
		position: absolute;
		right: 10px;
		top: 10px;
		z-index: 10 !important;
		padding: 3px;
		background-color: #ffffff;
		color: #000;
		width: 40px;
		text-align: center;
	}
	.brand {
		text-align: left !important;
		font-size: 22px;
		padding-left: 20px;
		line-height: 50px !important;
	}
}

@media ( min-width : 767px) {
	.nav-side-menu .menu-list .menu-content {
		display: block;
	}
} 


</style>

<script>

function goBack() {
	window.history.back();
}

/* /* $.ajax({
    type: "POST",
    url: "/parseHousePrice",
    data: { latitude: Lat, 
            longitude: Long,  
          }, 
    datatype: 'json'
})
.done(function( data, textStatus, jqxhr ) {    
$("#housepriceID").val(data.houseprice);
$("#housepricesize").val(data.housepricelistsize);

});  */

</script>

</head>
<body>
 <div id="custom-bootstrap-menu-savedareas" class="navbar navbar-default " role="navigation">
    <div class="container-fluid">
        <div class="navbar-header"><a class="navbar-brand" href="/" style="max-width: 30%;">
    <img src="${pageContext.request.contextPath}/resources/images/logo2.PNG">
 </a>

        </div>
        <div class="collapse navbar-collapse navbar-menubuilder">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="javascript:goBack();">Back</a>
                </li>
                <li><a href="#">Log Out</a>
                </li>
            </ul>
        </div> 
    </div> -
</div>
        
    
    
    
<%--  <table>
    <c:forEach items="${housepricesList}" var="HousePrice"> 
        <tr>
            <td><c:out value="${HousePrice.housePrice}"/></td>
            <td><c:out value="${HousePrice.number_of_houses}"/></td>
        </tr>
    </c:forEach>
</table>  --%>
 <h3>House Price Information Hub</h3>
	
	<table>
	
		
		<c:forEach var="o" items="${housePrice}">
			<tr>
				<td width="10%" height="50"><h3>The average house price for this area is <c:out value="${o.housePrice}" /> based on <c:out value="${o.number_of_houses}" /> houses in this area</h3></td>  
             </tr>
		</c:forEach>
		
		<tr><p>Based on Dublin's average property price (380579.4) this house is </p></tr>
</table>
<br>
<h4>How is the average price calculated?</h4>
<p>The house prices are provided by The Property Services Regulatory Authority. Over 30,000 (33,183) records of Dublin based property prices</p>
<p> are stored locally in a PostgreSQL database with a PostGIS extension, which when queried will return the average house prices of all</p>
<p>the properties within a 1 kilometre radius of the searched area. This current dataset is up to date of of 21/03/2018</p>
<br>
<br>
<br>

<p>Here is a visular representation of the Property Price Register. The large yellow and green markers represent properties worth </p>
<p>over 1,000,000 Euro in value.</p>

<img src="${pageContext.request.contextPath}/resources/images/HousePriceMarkers.PNG" alt="House Price Markers" >
</body>
</html>