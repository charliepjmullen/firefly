<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Firefly Landing Page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<style>
.fireflylogo {
	position: absolute;
	top: 5%;
	left: 35%;
	height: 30%;
	width: 20%;
}

.intro_text_box {
	 position: absolute;
	 top: 45%;
	 left: 15%;
	 
 }
 
 p {color: white; 
 	font-size: 20px;
 	font-family: arial, sans-serif;
 	}
 	

 /* body { background: "#42a5f5" !important; } */
 html body {
    background-color: rgba(66,165,245);
 }
 
 .button { position: absolute;
	 top: 47%;
	 left: 60%;}
 
 .footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   height: 20%;
   background-color: white;
   color: white;
   text-align: center;
}
</style>
<body>

<div class = "maincontainer">
<img class = "fireflylogo" src="${pageContext.request.contextPath}/resources/images/firefly_logo.PNG">

<div class = "intro_text_box">
	<p>Welcome to Firefly, a new and exciting platform that helps you find </p>
	<p>all sorts of different trendy things to do happening in your city </p>
	<p>right now.</p>
</div>

<div class = "button">
<button onclick = "window.location.href='login'" type="button" class="btn btn-primary btn-lg">Get started finding events</button>
</div>
</div>

<div class="footer">
  <p> </p>
</div>
</body>
</html>