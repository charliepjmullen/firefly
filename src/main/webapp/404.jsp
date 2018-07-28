<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Page not found - Firefly</title>

<style>
.logoimage {
    position: absolute;
    top: 0px;
    left: 0px;
    height : 100%;
    width: 8%;
}

.errorcontainer{
    position: absolute;
    top: 100px;
    left: 200px;
    height : 100%;
    width: 60%;
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
    <img class ="logoimage" src="${pageContext.request.contextPath}/resources/images/firefly_logo.PNG">
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
<div class = "errorcontainer">
<h1>Oops!</h1>
<h3>We can't seem to find the page you're looking for.</h3>
<p>Error code: 404</p>
</div>
</body>
</html>