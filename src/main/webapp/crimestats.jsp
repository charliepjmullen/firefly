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
 .rating { font-weight:bold; }
.low { color:#45FD00; }
.medium { color:#FF4500; }
.high { color:#ff0000; }
   
   .crimehubcontainer{
        position: absolute;
        top: 10%;
        left: 20%;
        height : 100%;
        width: 60%;
}

.logoimage {
    position: absolute;
    top: 0px;
    left: 0px;
    height : 100%;
    width: 22%;
}

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
/* window.onload = function() {
	var rating = document.getElementById('rating').value;

	if(rating < 4 ){
		document.getElementById("rating").style.color = "#45FD00";
	} else if(rating > 4 && rating < 6){
		document.getElementById("rating").style.color = "#E6E6E6";
    } else if(rating > 4 && rating < 6){
		document.getElementById("rating").style.color = "#ff0000";
    
} */

window.addEventListener("DOMContentLoaded", function() {
	  // Get all the ratings into an array
	  var ratings = Array.prototype.slice.call(document.querySelectorAll('.rating'));
	  
	  // Loop over the array
	  ratings.forEach(function(r){
	    // Get the text that is inside the element
	    var val = +r.textContent; // The prepended + converts the text to a number

	    // Just add the appropriate pre-made CSS class to the element
	    // depending on its text content.
	    if(val < 4 ){
	      r.classList.add("low");
	    } else if(val >= 4 && val <= 6){
	      r.classList.add("medium");
	    } else if(val > 6){
	      r.classList.add("high");
	    }
	  });
	});
function goBack() {
	window.history.back();
}



</script>

</head>
<body>
	<div id="custom-bootstrap-menu" class="navbar navbar-default "
		role="navigation">
		<div class="container-fluid">

			<div class="navbar-header">
				<a class="navbar-brand" href="/"
					style="max-width: 30%; max-height: 30%;"> <img class = "logoimage"
					src="${pageContext.request.contextPath}/resources/images/logo2.PNG"></a>

				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-menubuilder">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="container">




				<div class="collapse navbar-collapse navbar-menubuilder">

					<div id ="topnavbar">
					<ul class="nav navbar-nav navbar-right">
						<li><c:if
								test="${pageContext.request.userPrincipal.name != null}">
								<form id="logoutForm" method="POST"
									action="${contextPath}/logout">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</form>

								<a>Welcome ${pageContext.request.userPrincipal.name}</a>

							</c:if></li>
							<li><a href="javascript:goBack();">Back</a>
						<li><a onclick="document.forms['logoutForm'].submit()">Logout</a>
		                
						</li>
						
					</ul>
					
					</div>
				</div>
			</div>
		</div>
	</div>
        
    
    
    <div class ="crimehubcontainer">

    <h1>Crime Statistics Information Hub</h1>
	
	<table>
	
		
		<c:forEach var="o" items="${gardaStationList}">
			<tr>
				<td width="10%" height="50"><h2>Based on <b><c:out value="${o.gardaStation_name}" /></b> and their statistics
				                                the rating for this area is:  <span class="rating"><c:out value="${o.crime_rating}" /></span></h2></td>  
				
             </tr>
		</c:forEach>
		
</table>

<h4>How is the Crime Rating calculated?</h4>
<h4>The Crime Statistics are provided by <a href = "http://www.cso.ie/en/index.html">The Central Statistics Office</a>.There are 42 Garda Stations in Dublin and in order to get a rating we analyse the statistics of each Station over the span of 6 years and compare them 
to every other Garda Station's figures and place it on a scale of <b>1 - 10</b>. A Garda Station usually deals with 15 different crimes and offences, however we only take into account 4 different offences that we feel a person may be most concerened about
when researching areas, and these 4 offences are <b>Murder/Attempted Murder</b>, <b>Assault</b>, <b>Theft</b> and <b>Burglary</b>.</h4>


  <h3><b id = "low" class="low">Low</b> means this Area's Crime Rating is less than average</h3>
  <h3><b id = "medium" class="medium">Medium</b> means this Area's Crime Rating about average for Dublin</h3>
  <h3><b id = "high" class="high">High</b> means this Area's Crime Rating is above average</h3>
 

</div>
<br>

</body>
</html>