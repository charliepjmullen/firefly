<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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

<title>On The Fly </title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />



<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBFPWYqo7eTVGJhmehhcndY1R8Dc-vQuXE&amp;libraries=places"></script>


<style>
#geomap {
	width: 84%;
	height: 500px;
	float: right;
	margin: 5px;
	padding: 5px;
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
	width: 70%;
}

#addressbartable {
	float: right;
}

#topnavbar {
	float: right;
}

/* Nav Side Bar  */
.nav-side-menu {
	overflow: auto;
	font-family: verdana;
	font-size: 12px;
	font-weight: 200;
	background-color: #2e353d;
	position: fixed;
	top: 10px;
	width: 15%;
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

body {
	margin: 0px;
	padding: 0px;
}

.form-group {
	width: 100%;
	float: right;
	top: 5px;
	left: 35px;
}

.form-group2 {
	float: right;
}

.map {
	margin: 5px;
	padding: 5px;
}

.inputboxes {
	float: left;
	margin: 10px;
	padding: 10px;
}

.logoimage {
	position: absolute;
	top: 0px;
	left: 0px;
	height: 100%;
	width: 8%;
}

.location-form-table {
	width: 80%;
	float: right;
	right: 0px;
}

.input-group-btn2 {
	height: 50%;
	right: 5px;
}
</style>

<script>


var geocoder = new google.maps.Geocoder();
var map;
//var marker ="";
var markers = [];
var infowindow;
var request
/* var searchbox = document.getElementById("search_location").value;  */
  var events = [
      ['<p><b>European Innovation Academy </b></p>' + '<p> Address: Av. Amaral, 2765-192 Estoril</p>' +  '<p> The extreme accelerator from idea to a start-up in 15 days!</p>' + '<p>When: Today </p>' + '<p>Duration: 10:00 - 20:00</p> ' + '<p>Hosted by: <a href = "#"> EIA</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.706501, -9.396243, 4],
      ['<p><b>Walk with WhereToRun EIA  </b></p>' + '<p> Address: EIA HQ</p>' +  '<p> Come join us for a 30min walk of distress to Cascais after keynotes </p>' + '<p>When: Tuesday, July 31 </p>' + '<p>Duration: 12:00 - 13:00</p>' + '<p> <a href = "https://www.facebook.com/events/295223034386373" target="_blank"> FB Event</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.706860, -9.395716, 5],
      ['<p><b>Volleyball, Yoga and Afro House Party </b></p>' + '<p> Address: Carcavelos Beach</p>' +  '<p> Join EIA Members and Friends for a sunset unique party in one of the best beaches in Lisbon</p>' + '<p>When: Saturday 28 July </p>' + '<p>Duration: 19:00 - 00:00</p> ' + '<p><a href = "https://www.facebook.com/events/1839831662744025/" target="_blank" > FB Event</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.679595, -9.336017, 4],
      ['<p><b>Outjazz </b></p>' + '<p> Address: Eduardo VII Park</p>' +  '<p> Enjoy Somersby or Beer under sunny Lisbon to the sound of underground jazzy bands</p>' + '<p>When: 29 July </p>' + '<p>Duration: 17:00 - late</p>' + '<p><a href = "https://www.facebook.com/OutJazz/" target="_blank" > FB Event</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.707176, -9.143523, 5],
      ['<p><b>EDP Cool Jazz</b></p>' + '<p> Address: Hipódromo Municipal Manuel Possolo, Cascais</p>' +  '<p> Listen to the music of your favourite artists or find new talent at one of the most chilled music festivals of lisbon for 30 Euro</p>' + '<p>When: 28 - 31 July </p>' + '<p>Duration: 17:00 - 2:00</p> ' + '<p><a href = "https://www.facebook.com/events/353556418449515" target="_blank"> FB Event</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.693796, -9.424955, 4],
      ['<p><b> Fiartil - Feira de Artesanato do Estoril </b></p>' + '<p> Address: Av. Amaral, 2765-192 Estoril</p>' +  '<p> Showing a secret movie outside in Cascais Park</p>' + '<p>When: Today </p>' + '<p>Duration: 20:30 - 00:00</p>' + '<p>Hosted by: <a href = "#"> Cascais garden</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.707326,-9.396020, 5],
      ['<p><b> Erasmus Tuesday Party at Musicbox</b></p>' + '<p> Address: Rua nova do carvalho, nº 24, 1200-292 Lisbon</p>' +  '<p> We hope that you guys had the best time with us! This time we invite you for a closing party of Musicbox tuesday Parties! FREE entrance ALL night long with your ELL card! </p>' + '<p>When: Tuesday 31 July </p>' + '<p>Duration: 20:30 - 00:00</p>' + '<p><a href = "https://www.facebook.com/events/118140258854700" target="_blank" >FB Event</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.707170,-9.143393, 5],
      ['<p><b> Praia de Guincho </b></p>' + '<p> Address: Praia de Guincho</p>' +  '<p> One of Lisbons favourite beaches for surfing </p>' + '<p>When: Everyday </p>' + '<p><a href = "http://beachcam.meo.pt/livecams/praia-do-guincho/" target="_blank"> Check out live footage of the beach to see the waves!</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.732471,-9.472477, 5],
      ['<p><b> Skate Park</b></p>' + '<p> Address: R. António Ferro, 2765-218 São João do Estoril</p>' +  '<p> Local Outdoor Free Skate Park </p>' + '<p>When: Everyday </p>' + '<p><a href = "http://beachcam.meo.pt/livecams/parque-das-geracoes-skatepark/" target="_blank"> Check out live footage of the skate park!</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.698220, -9.380154, 5],
      ['<p><b> Boat Party </b></p>' + '<p> Address: Cais do Sodre</p>' +  '<p> Karen the Volunteer from EIA is throwing a boat party for 20 Euro. Open bar for the first hour. Text her number to sign up +351 933 016 919 </p>' + '<p>When: 28th July </p>' + '<p>Duration: 15:00 - 19:00</p>' + '<p><button type="button">I am interested in this event</button></p>', 38.706168, -9.145108, 5],
      ['<p><b> Beach and Chill Trip Party </b></p>' + '<p> Address: Estoril</p>' +  '<p> Discover the best beaches in Portugal with your fellow EIA colleagues. Meeting up at the Congress Centre. Price 80 Euros. Contact Karen the Volunteer to book +351 933 016 919 </p>' + '<p>When: 29th July </p>' + '<p>Duration: 8:00 - 21:00</p>' +  '<p><a href = "http://activities.uou.pt" target="_blank"> Check out the link for more details!</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.706018, -9.396328, 5],
      ['<p><b> Village Underground Lisbon </b></p>' + '<p> Address: Carris Museum</p>' +  '<p> Have no plans this weekend? Chill out and grab a few drinks at this amazing spot </p>' + '<p>When: Everyday </p>' + '<p><a href = "https://www.facebook.com/villageundergroundlisboa/" target="_blank"> Check out their facebook page for details on opening hours </a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.702264, -9.180573, 5],
      ['<p><b> Rio Maravilha </b></p>' + '<p> Address: LX Factory</p>' +  '<p>  Discover the most underground, tredy and fashionable Portuguese boutiques in a very bohemian styled market </p>' + '<p>When: Everyday (but tuesday) </p>' + '<p><a href = "https://www.facebook.com/regueiraodosanjos/" target="_blank"> Check out their page for opening hours</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.725384, -9.135841, 5],
      ['<p><b> Waterfront Promenade is Lisbon </b></p>' + '<p> Address: Ribeira das Naus</p>' +  '<p> This waterfront area between Praca do Comercio and Cais do Sodre was where many of the Portuguese explorers ships were built. Today, after a redevelopment in 2013, it is a spacious landscaped promenade that invites you to sit in the sun.  </p>' + '<p>When: Everyday </p>' + '<p><a href = "https://www.lisbonlux.com/lisbon/ribeira-das-naus.html" target="_blank"> Check out the link for more info</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.705866,-9.140303, 5],
      ['<p><b> Miradouro Nossa Senhora Do Monte </b></p>' + '<p> Address: Miradouro Nossa Senhora Do Monte</p>' +  '<p> Take a deep breath, grab some beers and appreciate the best view of sunny Lisbon right next to one of the most historical and beautiful neighborhoods of the city </p>' + '<p>When: Everyday </p>' + '<p><a href = "https://www.tripadvisor.com/Attraction_Review-g189158-d1992589-Reviews-Miradouro_da_Senhora_do_Monte-Lisbon_Lisbon_District_Central_Portugal.html" target="_blank"> Check out the link for more info</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.719186, -9.132839, 5],  
      ['<p><b> Brunch Eletronic </b></p>' + '<p> Address: LX Factory</p>' +  '<p> Go to one of the best techno parties in the city! </p>' + '<p>When: 29th July </p>' + '<p>Duration: 14:00 - 22:00</p>' + '<p><a href = "https://www.facebook.com/events/174300519886689/" target="_blank"> FB Event</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.713905,-9.193173, 5],
      ['<p><b> Brunch Eletronic - Afterparty </b></p>' + '<p> Address: Praça Coercio 72, 1100-048 Lisbon</p>' +  '<p> Go to the official after party of the best techno parties in the city! </p>' + '<p>When: 29th July </p>' + '<p>Duration: 22:00 - 05:00</p>' + '<p><a href = "https://www.facebook.com/events/1946436422085634/"  target="_blank"> FB Event</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.707674,-9.135615, 5],
    ];
  

/* window.onload = function() {
    if(!window.location.hash) {
        window.location = window.location + '#loaded';
        window.location.reload();
    }
} */
/*
 * Google Map with marker
 */

 function loadDatabase(){
	var pg = require('pg');
	var connectionString = "postgres://postgres:root@localhost:5432/fireflypgdb";
	var client = new pg.Client(conString);
	client.connect();
	alert("Connected");
	
	 }

function initialize() {

	getAddress();
	 if(document.getElementById('search_location').value != ''){
		 var PostCodeid = '#search_location';
		 var address = $(PostCodeid).val();
	        geocoder.geocode({'address': address}, function (results, status) {
	            if (status == google.maps.GeocoderStatus.OK ) {
	                map.setCenter(results[0].geometry.location);
	                map.setZoom(14);
	                marker.setPosition(results[0].geometry.location);
	                $('.search_addr').val(results[0].formatted_address);
	                $('.search_latitude').val(marker.getPosition().lat());
	                $('.search_longitude').val(marker.getPosition().lng());
		            callAllfunctions2();
	            }
	        });
	 }


	
    var initialLat = $('.search_latitude').val();
    var initialLong = $('.search_longitude').val();
    initialLat = initialLat?initialLat:38.706838; 
    initialLong = initialLong?initialLong:-9.396743;

    var latlng = new google.maps.LatLng(initialLat, initialLong);
    var options = {
        zoom: 11,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("geomap"), options);

    geocoder = new google.maps.Geocoder();

    marker = new google.maps.Marker({
        map: map,
        draggable: true,
        position: latlng,
        icon: {url:'http://maps.google.com/mapfiles/ms/icons/blue-dot.png'}
    });

    
    google.maps.event.addListener(marker, "dragend", function () {
        var point = marker.getPosition();
        map.panTo(point);
        geocoder.geocode({'latLng': marker.getPosition()}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker.setPosition(results[0].geometry.location);
                $('.search_addr').val(results[0].formatted_address);
                $('.search_latitude').val(marker.getPosition().lat());
                $('.search_longitude').val(marker.getPosition().lng());
            }
        });
    }); 


    var marker2, i;
    var infowindow2 = new google.maps.InfoWindow();

    for (i = 0; i < events.length; i++) {  
      marker2 = new google.maps.Marker({
        position: new google.maps.LatLng(events[i][1], events[i][2]),
        map: map
      });

      google.maps.event.addListener(marker2, 'click', (function(marker2, i) {
        return function() {
          infowindow2.setContent(events[i][0]);
          infowindow2.open(map, marker2);
        }
      })(marker2, i));
    }

    

}

$(document).ready(function () {
    //load google map
    
    initialize();
    
    
    /*
     * autocomplete location search
     */

     
    var PostCodeid = '#search_location';
    $(function () {
        $(PostCodeid).autocomplete({
            source: function (request, response) {
                geocoder.geocode({
                    'address': request.term,
                    componentRestrictions: {country: "pt"}
                }, function (results, status) {
                    response($.map(results, function (item) {
                        return {
                            label: item.formatted_address,
                            value: item.formatted_address,
                            lat: item.geometry.location.lat(),
                            lon: item.geometry.location.lng()
                        };
                    }));
                });
            }
            
        });
    });

   
    
    /*
     * Point location on google map
     */
    $('.get_map').click(function (e) {
        var address = $(PostCodeid).val();
        geocoder.geocode({'address': address}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK ) {
                map.setCenter(results[0].geometry.location);
                map.setZoom(14);
                marker.setPosition(results[0].geometry.location);
                $('.search_addr').val(results[0].formatted_address);
                $('.search_latitude').val(marker.getPosition().lat());
                $('.search_longitude').val(marker.getPosition().lng());
            } 
        });
        e.preventDefault();
    });

    //Add listener to marker for reverse geocoding
    google.maps.event.addListener(marker, 'drag', function () {
        geocoder.geocode({'latLng': marker.getPosition()}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    $('.search_addr').val(results[0].formatted_address);
                    $('.search_latitude').val(marker.getPosition().lat());
                    $('.search_longitude').val(marker.getPosition().lng());
                }
            }
        });
    });
});



function loginAlert(){
	alert("User must be logged in to view reports");
}

function profileAlert(){
	alert("Profile feature coming soon!");
}

	
 //<![CDATA[
 	 
	 function callback(results, status) {
		
	  if (status === google.maps.places.PlacesServiceStatus.OK) {
		  if(marker)
	           	marker.setMap(null)
		 for (var i = 0; i < results.length; i++) {
		      createMarker(results[i]);
		    }
	  }
	} 


	

	//<![CDATA[
    function clearMarkers() {
    	 for(i=0; i<markers.length; i++){
    	        markers[i].setMap(null);
      }
    }
    //]]>

 
 function storeAddress(){

	 if(typeof(Storage) !==  "undefined"){
		//Store
			addressstorage = document.getElementById("search_location").value;
			localStorage.setItem("address", addressstorage)
		 }
	 }

 function getAddress(){
	 var address = localStorage.getItem("address");
	 document.getElementById("search_location").value = address;
	 }

 function searchnewArea(){
	 localStorage.clear();
	 location.reload();
	 
	 }
 

  	function validateSearch(){

   		var address = document.getElementById("addressBox").value;
  		var searchRequest = document.getElementById("search_location").value;
		var isInPortugal;

		if (searchRequest.includes("Portugal") || searchRequest.includes("portugal")){
			isInPortugal = true;
    		}  
		else { isInPortugal = false;}

		if (searchRequest == null || searchRequest ==" " || address == null || address ==" " || isInPortugal == false)
		 {
            alert("We're only 2 weeks old and so are based in Portugal for now! We'll be coming to your city soon!");
            location.reload();
		 }
	}   
		  
</script>
</head>



<body>



	<div class="nav-side-menu">
		<div class="brand">Firefly</div>
		<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
			data-target="#menu-content"></i>

		<div class="menu-list">

			<ul id="menu-content" class="menu-content collapse out">
				<li><a href="/"> <i class="glyphicon glyphicon-menu-hamburger"></i> Event Menu
				</a></li>

				
								<li data-toggle="collapse" data-target="#findevents"
					class="collapsed active"><a href = "#"><i
						class="fa fa-search"></i> Find Events <span class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="findevents">

					<li><a href="#">Local Events</a></li>
					<li><a href="#">Future Events</a></li>
				</ul>
				
				<li data-toggle="collapse" data-target="#addevents"
					class="collapsed active"><a href = "addeventpage"><i
						class="	fa fa-calendar"></i> Add an Event <span class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="#addevents">

				</ul>
				
					<li data-toggle="collapse" data-target="#profile"
					class="collapsed active"><a href = "javascript:profileAlert();"><i
						class=" fa fa-user"></i> Profile <span class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="#addevents">

				</ul>


	

			</ul>
		</div>
	</div>

	<div id="custom-bootstrap-menu" class="navbar navbar-default "
		role="navigation">
		<div class="container-fluid">

			<div class="navbar-header">
				 <a class="navbar-brand" href="/"
					style="max-width: 30%; max-height: 30%;"> <img
					class="logoimage"
					src="${pageContext.request.contextPath}/resources/images/Logo.PNG"> </a>
				
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-menubuilder">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="container">




				<div class="collapse navbar-collapse navbar-menubuilder">

					<div id="topnavbar">
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
							
							<li><a onclick="document.forms['logoutForm'].submit()">Logout</a>

							</li>

						</ul>

					</div>
				</div>
			</div>
		</div>
	</div>



	<table class="location-form-table">
		<tr>
			<td>
				<form>
					<div class="form-group input-group">

						<input type="text" id="search_location" class="form-control"
							placeholder="Search an area or put in an address " />
						<div class="input-group-btn">
							<button class="btn btn-default get_map" type="submit"
								onclick="validateSearch();">Locate</button>
						</div>
					</div>
			</td>
			<td style="width: 50px">

			<td>
				<div class="form-group2 input-group">
					<input type="hidden" name="addressBox" id="addressBox"
						class="search_addr" size="45" class="form-control"
						placeholder="Address" />
				
				</div>
			</td>
			
		</tr>
	</table>
	<div id="geomap"></div>

</body>
</html>