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

<title> On The Fly  </title>

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
	width: 95%;
	height: 510px;
	float: right;
	margin: 5px;
	padding: 5px
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
</style>

<script>
var geocoder = new google.maps.Geocoder();
var map;
var marker;
var events = [
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.706501, -9.396243, 4],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.706860, -9.395716, 5],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.679595, -9.336017, 4],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.707176, -9.143523, 5],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.693796, -9.424955, 4],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.707326,-9.396020, 5],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.707170,-9.143393, 5],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.732471,-9.472477, 5],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.698220, -9.380154, 5],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.706168, -9.145108, 5],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.706018, -9.396328, 5],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.702264, -9.180573, 5],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.725384, -9.135841, 5],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.705866,-9.140303, 5],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.719186, -9.132839, 5],  
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.713905,-9.193173, 5],
    ['<p><b>Please Log In or Regsiter to view details on this great event </b></p>' + '<p><a href = "/register"  > Register Here</a></p>', 38.707674,-9.135615, 5],
  ];



/*
 * Google Map with marker
 */
function initialize() {
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
            },

            
        });
    });

   
    
    /*
     * Point location on google map
     */
    $('.get_map').click(function (e) {
        var address = $(PostCodeid).val();
        geocoder.geocode({'address': address}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                map.setZoom(15);
                marker.setPosition(results[0].geometry.location);
                $('.search_addr').val(results[0].formatted_address);
                $('.search_latitude').val(marker.getPosition().lat());
                $('.search_longitude').val(marker.getPosition().lng());
            } else {
                alert("Geocode was not successful for the following reason: " + status);
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
	alert("User must be logged in to view details on these ratings, check the crime statistics, house price and much more!");
}



  function sendLatLong(){

	   $('.search_latitude').val(marker.getPosition().lat());
       $('.search_longitude').val(marker.getPosition().lng());

      var Lat = marker.getPosition().lat();
      console.log(Lat);

      var Long = marker.getPosition().lng();
      console.log(Long);
	  

      //alert("Lat: " + Lat + " " + "Long: " + Long); 
  	$.ajax({
       type: "POST",
       url: "/results",
       data: { latitude: Lat, 
               longitude: Long,  
              }, 
       datatype: 'json'
      //alert(status);
  });
    

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

</script>
</head>

<body>


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

		<form>
		<div class="form-group2 input-group">
			<input type="text" id="search_location" class="form-control"
				placeholder="Search an area or put in an address " />
			<div class="input-group-btn">
				<button class="btn btn-default get_map" type="submit"
					onclick="callAllFunctions();">Locate</button>
			</div>
		</div>
	</form>
	<br>
			
		
		<div id="geomap"></div>


</body>
</html>
