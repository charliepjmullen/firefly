<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Firefly</title>
    
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" /> 

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBFPWYqo7eTVGJhmehhcndY1R8Dc-vQuXE&amp;libraries=places"></script>
    
<style>
 html body {
    background-color: rgba(66,165,245);
 }
 
 #forminputs .p {
	display: inline-block;
	float: left;
	clear: left;
	width: 80%;
	text-align: right;
}

#forminputs .input {
	display: inline-block;
	float: left;
	width: 95%;
}

#addressbartable{float:right;}
#topnavbar{float: right;}


body {
	margin: 0px;
	padding: 0px;
}

h1 {color: white; }

.form-group2 {
	width: 95.5%;
	float: right;
}

 .map {
	margin: 5px;
	padding: 5px;
	width : 95%;
	height : 10%;
}

.inputboxes{
	float: right;
		margin: 10px;
	   padding: 10px;
}

.logoimage {
    position: absolute;
    top: 0px;
    left: 0px;
    height : 100%;
    width: 8%;
}

#introtext {
	    position: absolute;
    top: 5%;
    left: 10%;
    height : 100%;
   
}

#maincontainer{
	position: absolute;
	width: 80%;
	left: 8%;
 }
 
 
 </style>
 
 
<body>
<div id="custom-bootstrap-menu" class="navbar navbar-default "
		role="navigation">
		<div class="container-fluid">

			 <div class="navbar-header">
				<a class="navbar-brand" href="/"
					style="max-width: 30%; max-height: 30%;"> <img class = "logoimage"
					src="${pageContext.request.contextPath}/resources/images/Logo.PNG"></a>

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

							 </c:if>
						</li>
						<li>
						     <br>
							 <form method="POST" action="${contextPath}/login" >
        						<div class="form-group ${error != null ? 'has-error' : ''}">
            					<span>${message}</span>
            					<input name="username" type="text"  placeholder="Username" autofocus="true"/>
            					<input name="password" type="password"  placeholder="Password"/>
            					<span>${error}</span>
            					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            					<button  type="submit">Log In</button>
        						</div>
    						 </form>
    						 
    					</li>

                        <li><a href="registration">Register</a></li>
					</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

<div id = "maincontainer">
<h1>For our Users</h1>

<h4>	As an event platform, we can provide you with the marketing needed, for you to
address your target audience. It would also facilitate the process for our customers to
attend your event, as they can sign up/purchase tickets in the same platform they get to
know your event. Most importantly, there is no need for you to be very experienced in the hosting area, nor in the marketing area for you to become a host. With the will to host an event and little to no investment needed to post it on Firefly, 
we are sure your event will be a success.
</h4>

<ul>
  <li>Our product puts your organization's event right in front of your customers eyes. Your brand gains more recognition to the people who matter most.</li>
  <li>According to Statistica, marketing revenue exceeds over 200 billion dollars. Save money by posting your events/activities, free of charge. </li>
  <li>Your brand will not compete against massive corporations for attention, it is local and tailored to your target demographic. Help your brand gain recognition in your city.</li>
  <li>Your events help gain traffic to your organization or your personal brand. Events gather exposure and puts positive </li>
</ul>  

<h1>For our Hosts</h1>
<h4>	Firefly aims to help you find out what to do. Whether you are bored and want to get out of the house, or you want to try something different, Firefly is the app to use. From the biggest music festivals, to a poetry reading, you can find anything there is to do around your area. Firefly allows independent and smaller organizations to post an event, so that you can know what is happening and where to go all in real time. You don't have to know what you want to do, only that you want to do something, we'll do the rest. Be a tourist in your own town!
</h4>

<ul>
  <li>Find events! Ever felt lost, not knowing how to find cool things to do? On The Fly solves that problem with our real time event platform. See a dog show two miles away or discover your neighbor down the street has a garage band event.</li>
  <li>Explore your city! It's hard to know what you don't know. We make it easy to discover parts of your city you've yet to discover. Find the underground event only the locals know! </li>
  <li>Meet with like minded people! Have a bike that is sitting in the garage? Find bikers near you! Want to play basketball tonight? Let those around you know!</li>
</ul>  
</div>
</body>
</html>