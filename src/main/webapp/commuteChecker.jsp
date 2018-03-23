<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Area Rating System</title>
    
    <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBFPWYqo7eTVGJhmehhcndY1R8Dc-vQuXE&amp;libraries=geometry&amp;"></script>
	
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">

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

/* Nav Side Bar  */
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
*/
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

 
	var geocoder = new google.maps.Geocoder();
	//var marker ="";
	var markers = [];
	var infowindow;
	var request;
	var loc1 = new google.maps.LatLng(53.334828, -6.269547);
	var loc2 = new google.maps.LatLng(53.339980, -6.235837);
	var map;


	

		/*
		 * Google Map with marker
		 */
		function initialize() {

			//2nd Attempt

			directionsDisplay = new google.maps.DirectionsRenderer();

			var myOptions = {
				center : new google.maps.LatLng(53.349805, -6.260310),
				zoom : 12,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			map = new google.maps.Map(document.getElementById("geomap"),
					myOptions);

			
			var directionsService = new google.maps.DirectionsService();

			  var directionsDisplay = new google.maps.DirectionsRenderer({
			    map: map
			  });

			  var geocoder = new google.maps.Geocoder();

			  var pointA, pointB;

			  google.maps.event.addListener(directionsDisplay, 'directions_changed', function() {
				    computeTotalDistance(directionsDisplay.directions);
				  });

			  geocoder.geocode({
			    'address': document.getElementById('addressFrom').value
			  }, function(results, status) {
			    if (status != "OK") return;
			    var location = results[0].geometry.location;
			    pointA = new google.maps.LatLng(location.lat(), location.lng());
			    var markerA = new google.maps.Marker({
			      position: pointA,
			      title: "point A",
			      label: "A",
			      map: map
			    });
			    geocoder.geocode({
			      'address': document.getElementById('addressTo').value
			    }, function(results, status) {
			      if (status != "OK") return;
			      var location = results[0].geometry.location;
			      pointB = new google.maps.LatLng(location.lat(), location.lng());
			      var markerB = new google.maps.Marker({
			        position: pointB,
			        title: "point B",
			        label: "B",
			        map: map
			      });
			      calculateAndDisplayRoute(directionsService, directionsDisplay, pointA, pointB);
		
			    });
			    
			  });
			 
			}


/* 		function calcRoute() {

			/* var location1 = document.getElementById("latlong1");
			var location2 = document.getElementById("latlong1"); 
			var location1 = convertAddress1();
			var location2 = convertAddress2();

			  
			    var ret = location1.replace('(','').replace(')','');
			   
			    var res = ret.split(',');
			    var lat1 = res[0];
			    var lng1 = res[1];
			    
			var start = new google.maps.LatLng(lat1, lng1);
			var end = new google.maps.LatLng(location2.lat, location2.lng);

			
			var bounds = new google.maps.LatLngBounds();
			bounds.extend(start);
			bounds.extend(end);
			map.fitBounds(bounds);
			var request = {
				origin : start,
				destination : end,
				travelMode : google.maps.TravelMode.DRIVING
			};
			directionsService
					.route(request,
							function(response, status) {
								if (status == google.maps.DirectionsStatus.OK) {
									directionsDisplay.setDirections(response);
									directionsDisplay.setMap(map);
								} else {
									alert("Directions Request from "
											+ start.toUrlValue(6) + " to "
											+ end.toUrlValue(6) + " failed: "
											+ status);
								}
							});
		} */

		


	/*
	 * autocomplete location search
	 */

	var PostCodeid1 = '#addressFrom';
	$(function() {
		$(PostCodeid1).autocomplete({
			source : function(request, response) {
				geocoder.geocode({
					'address' : request.term,
					componentRestrictions : {
						country : "ie"
					}
				}, function(results, status) {
					response($.map(results, function(item) {
						return {
							label : item.formatted_address,
							value : item.formatted_address,
							lat : item.geometry.location.lat(),
							lon : item.geometry.location.lng()
						};
					}));
				});
			}
		});
	});

	var PostCodeid2 = '#addressTo';
	$(function() {
		$(PostCodeid2).autocomplete({
			source : function(request, response) {
				geocoder.geocode({
					'address' : request.term,
					componentRestrictions : {
						country : "ie"
					}
				}, function(results, status) {
					response($.map(results, function(item) {
						return {
							label : item.formatted_address,
							value : item.formatted_address,
							lat : item.geometry.location.lat(),
							lon : item.geometry.location.lng()
						};
					}));
				});
			}
		});
	});



/* 	 function convertAddress1() {
			var geocoder,location1;
			var address = document.getElementById("forminput1").value;
			geocoder = new google.maps.Geocoder();
		    geocoder.geocode( { 'address': address}, function(results, status) {
		      if (status == google.maps.GeocoderStatus.OK) {
		    	   location1 = (results[0].geometry.location);
		    	   alert("Location : "+ location1);
		      }
		      else {
		        alert("Geocode was not successful for the following reason: " + status);
		      }
		    });
		    return location1;
	 } 
	 
	 	 function convertAddress2() {
		      var geocoder, location2;
		      var address = document.getElementById("forminput2").value;
		      geocoder = new google.maps.Geocoder();
		      geocoder.geocode( { 'address': address}, function(results, status) {
		         if (status == google.maps.GeocoderStatus.OK) {
		           
		        	  location2 = (results[0].geometry.location);
					   
				    alert("Location : "+ location2);
		         }
		         else {
		           alert("Geocode was not successful for the following reason: " + status);
	             }
	          });

	          return location2;
	} */

	function calculateAndDisplayRoute(directionsService, directionsDisplay, pointA, pointB) {
	 		  directionsService.route({
	 		    origin: pointA,
	 		    destination: pointB,
	 		    travelMode: google.maps.TravelMode.WALKING
	 		  }, function(response, status) {
	 		    if (status == google.maps.DirectionsStatus.OK) {
	 		      directionsDisplay.setDirections(response);
	 		    } else {
	 		      window.alert('Directions request failed due to ' + status);
	 		    }
	 		  });
	 		}

	function computeTotalDistance(result) {
		  var total = 0;
		  var time= 0;
		  var from=0;
		  var to=0;
		  var total2=0;
		  var myroute = result.routes[0];
		  for (var i = 0; i < myroute.legs.length; i++) {
		    total += myroute.legs[i].distance.value;
		    time +=myroute.legs[i].duration.text;
		    from =myroute.legs[i].start_address;
		    to =myroute.legs[i].end_address;


		  }
		  time = time.replace('hours','H');
		  time = time.replace('mins','M');
		  total = total / 1000.
		  /* document.getElementById('from').innerHTML = from + '-'+to;
		  document.getElementById('duration').innerHTML = time ;*/
		  total2 =Math.round( total); 
		  alert(time + " " + total2 +"KM" );
		}

	google.maps.event.addDomListener(window, 'load', initialize);
	
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

	<div class="nav-side-menu">
		<div class="brand">Brand Logo</div>
		<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
			data-target="#menu-content"></i>

		<div class="menu-list">

			<ul id="menu-content" class="menu-content collapse out">
				<li><a href="#"> <i class="fa fa-bar-chart fa-lg"></i> Area
						Stats
				</a></li>

				<li data-toggle="collapse" data-target="#products"
					class="collapsed active"><a ><i
						class="fa fa-area-chart fa-lg"></i> General <span class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="products">
					<li><a href="#">Address</a></li>
					<li><a href="#">Latitude</a></li>
					<li><a href="#">Longitude</a></li>
					<li><a href="#">House Price</a></li>
					<li><a href="#">Crime Rating</a></li>
				</ul>


				<li data-toggle="collapse" data-target="#service" class="collapsed">
					<a href="#"><i class="fa fa-graduation-cap fa-lg"></i>
						Education <span class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="service">
					<li>Creche</li>
					<li>Primary Schoool</li>
					<li>Secondary School</li>
				</ul>

				<li data-toggle="collapse" data-target="#food" class="collapsed">
					<a href="#"><i class="fa fa-cutlery fa-lg"></i> Food <span
						class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="food">
					<li>Cafe</li>
					<li>Restaurant</li>
				</ul>


				<li data-toggle="collapse" data-target="#new" class="collapsed">
					<a href="#"><i class="fa fa fa-beer fa-lg"></i> Bars <span
						class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="new">
					<li>Pubs</li>
					<li>Cocktails</li>
					<li>Cheap</li>
					<li>Expensive</li>
				</ul>

				<li data-toggle="collapse" data-target="#fitness" class="collapsed">
					<a href="#"><i class="fa fa-heart fa-lg"></i> Fitness <span
						class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="fitness">
					<li>Gym</li>
					<li>Yoga</li>
					<li>Pilates</li>
				</ul>

				<li data-toggle="collapse" data-target="#leisure" class="collapsed">
					<a href="#"><i class="fa fa-gift fa-lg"></i> Leisure <span
						class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="leisure">
					<li>Parks</li>
					<li>Cinema</li>
				</ul>
				
				<li data-toggle="collapse" data-target="commute" class="collapsed">
					<a href="commuteCheckerPage"><i class="fa fa-car fa-lg"></i> Check The Commute </a>
				</li>
				
				<li data-toggle="collapse" data-target="savedareas" class="collapsed">
					<a href="savedAreasMap"><i class="fa fa-home fa-lg"></i> My Saved Areas </a>
				</li>
			</ul>
		</div>
	</div>

<br>
<div id = "inputbox">
	<form id="myForm">
 <input type="text" id="addressFrom" class="forminput1" value = "${areaName}" placeholder="Set Starting Location" style ="width: 50%"/>
 <!-- <input type="text" id="addressTo" class="forminput2"placeholder="Set Destination" width="35%" style ="width: 35%"/>  -->
 <input list="places" id="addressTo" class="forminput2" placeholder="Set Destination" style ="width: 50%"/>
<datalist id="places">
  <!--  <option value = "123 Fake St, Dublin, Ireland">Home</option> -->
   <c:forEach var="o" items="${savedCommutes}">
					<option value="${o.address}"><c:out value="${o.addressnickname}" /></option>
   </c:forEach>
</datalist>
 
<%--    <select>
   <c:forEach var="o" items="${savedCommutes}">
					<option value="${o.address}"><c:out value="${o.address}" /></option>
   </c:forEach>
   </select> --%>
   
 

 
  <select>
					<option value="walking">Walking</option>
					<option value="cycling">Cycling</option>
					<option value="driving">Driving</option>
					<option value="publictransport">Public Transport</option>
			   </select>
 <!--  <input type="button" onclick="calculateAndDisplayRoute();" value="Calculate Commute"><br> -->
  <input type="button" id="routebtn" value="Calculate Commute" onclick="initialize()"/><br> 
</form>
</div>
<br>


<!-- display google map -->
<div id="geomap"></div>






</body>
</html>