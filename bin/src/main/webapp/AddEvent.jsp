<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBFPWYqo7eTVGJhmehhcndY1R8Dc-vQuXE&amp;libraries=places"></script>

   <style>
#geomap {
	width: 70%;
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

/* #forminputs .p {
	display: inline-block;
	float: left;
	clear: left;
	width: 250px;
	text-align: right;
} */

#forminputs .input {
	display: inline-block;
	float: left;
}

.logoimage {
    position: absolute;
    top: 0px;
    left: 0px;
    height : 100%;
    width: 8%;
}
</style>

<script>


var geocoder = new google.maps.Geocoder();
var map;
//var marker ="";
var markers = [];
var infowindow;
var request
var eventname;
 

/*
 * Google Map with marker
 */
function initialize() {
    var initialLat = $('.search_latitude').val();
    var initialLong = $('.search_longitude').val();
    initialLat = initialLat?initialLat:38.706501;
    initialLong = initialLong?initialLong:-9.396243;

    var latlng = new google.maps.LatLng(initialLat, initialLong);
    var options = {
        zoom: 16,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("geomap"), options);

    geocoder = new google.maps.Geocoder();

    marker = new google.maps.Marker({
        map: map,
        draggable: true,
        position: latlng
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
            select: function (event, ui) {
                $('.search_addr').val(ui.item.value);
                $('.search_latitude').val(ui.item.lat);
                $('.search_longitude').val(ui.item.lon);
                var latlng = new google.maps.LatLng(ui.item.lat, ui.item.lon);
                marker.setPosition(latlng);
                /* initialize(); */
            }
            
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
                map.setZoom(16);
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
	alert("User must be logged in to view reports");
}

function pendingApproval(){
	alert("Thank you for submitting your event! It is pending approval and will be posted soon!");
	window.location.href = "/";
	
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
             _token: $('meta[name="csrf-token"]').attr('content') }, 
            datatype: 'json'
    //alert(status);
});
  }

	function saveAreaToUser(){

		   $('.search_latitude').val(marker.getPosition().lat());
		   var Lat = marker.getPosition().lat();
		   console.log(Lat);
		   
	       $('.search_longitude').val(marker.getPosition().lng());
		   var Long = marker.getPosition().lng();
		   console.log(Long);

//		   $('.search_addr').val(results[0].formatted_address);
//		   var Address = results[0].formatted_address;
//		   console.log(Address);

			var areaName = document.getElementById("addressBox").value;
		  

	       //alert("Lat: " + Lat + " " + "Long: " + Long); 
		$.ajax({
	     type: "POST",
	     url: "/saveAreaToProfile",
	     data: { latitude: Lat, 
                 longitude: Long,  
                 areaName: areaName
		}, // parameters
     datatype: 'json'
    //alert(status);
});
	}

 
    
	function createMarker(place) {
	  
	   infowindow = new google.maps.InfoWindow();
	  var placeLoc = place.geometry.location;
	  
	  var reportmarker = new google.maps.Marker({
	    map: map,
	    position: place.geometry.location
	  });

	  markers.push(reportmarker);
	  google.maps.event.addListener(reportmarker, 'click', function() {
	    infowindow.setContent( place.name + ": " + place.rating);
	    infowindow.open(map, this);
	  });
	}

	//<![CDATA[
    function clearMarkers() {
    	 for(i=0; i<markers.length; i++){
    	        markers[i].setMap(null);
      }
    }
    //]]>
</script>
</head>



<body>
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

       
	
	<form>
		<div class="form-group input-group">
			<input type="text" id="search_location" class="form-control"
				placeholder="Where are you planning to hold your event? Search here or drag the marker below." />
			<div class="input-group-btn">
				<button class="btn btn-default get_map" type="submit"
					onclick="callAllFunctions();">Find Event Venue</button>
			</div>
		</div>
	</form>	

<!-- display google map -->
<div id="geomap"></div>

<div id="forminputs">
<table>
<tr>
<!-- display selected location information -->
<th>
<h4>Create Event</h4>
<p><input type="hidden" name = "addressBox" id = "addressBox" class="search_addr" size="45"/></p>

<div class="form-group-container">

<form:form method="get" action="/addevent" >
<!-- Latitude --><p><input type="hidden" class="search_latitude" size="30" name = "latitude"/></p>
<!-- Latitude --><p><input type="hidden" class="search_longitude" size="30" name = "longitude"/></p>
 <!-- Event Name --> <label><input type="text" class="form-control" placeholder = "Event Name" size="30" name = "eventname"/></label>
 <!-- Event Description --> <label><textarea class="form-control" placeholder = "Tell us some information about your event" rows="4" cols="50" name="description"></textarea></label>
 <!-- Event Address --> <label><input type="text" name = "addressBox" placeholder = "Address" id = "addressBox" class="form-control search_addr" size="45" /></label>
 <!-- Event Date --><input type="date" class="form-control" placeholder = "Enter a date" name="eventdate">
 <!-- Event Start Time --><label for="appt-time">Start Time:</label>
                          <input type="time" class="form-control" id="start-time" name="start-time"/>
 <!-- Event End Time --><label for="appt-time">End Time:</label>
  						<input type="time" class="form-control" id="end-time" name="end-time"/>
  <input type="submit" onclick = "pendingApproval();">
</form:form> 
</div>

</table>
</div>
</body>

</html>