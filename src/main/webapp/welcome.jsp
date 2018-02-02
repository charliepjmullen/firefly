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
	width: 100%;
	height: 400px;
}

#forminputs .p {
	display: inline-block;
	float: left;
	clear: left;
	width: 250px;
	text-align: right;
}

#forminputs .input {
	display: inline-block;
	float: left;
}
</style>

<script>


var geocoder = new google.maps.Geocoder();
var map;
//var marker ="";
var markers = [];
var infowindow;
var request

/*
 * Google Map with marker
 */
function initialize() {
    var initialLat = $('.search_latitude').val();
    var initialLong = $('.search_longitude').val();
    initialLat = initialLat?initialLat:53.350140;
    initialLong = initialLong?initialLong:-6.266155;

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
                    componentRestrictions: {country: "ie"}
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
                initialize();
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
	alert("User must be logged in to view reports");
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
     datatype: 'json',
     data: { latitude: Lat, longitude: Long }, // parameters
    
    //alert(status);
})
  }

	function saveAreaToUser(){

		   $('.search_latitude').val(marker.getPosition().lat());
		   var Lat = marker.getPosition().lat();
		   console.log(Lat);
		   
	       $('.search_longitude').val(marker.getPosition().lng());
		   var Long = marker.getPosition().lng();
		   console.log(Long);

		   $('.search_addr').val(results[0].formatted_address);
		   var Address = results[0].formatted_address;
		   console.log(Address);


		  

	       //alert("Lat: " + Lat + " " + "Long: " + Long); 
		$.ajax({
	     type: "POST",
	     url: "/saveAreaToProfile",
	     datatype: 'json',
	     data: { latitude: Lat, longitude: Long, address: Address }, // parameters
	
			

})  
	}

  function getCafe(){

	  $('.search_latitude').val(marker.getPosition().lat());
	   $('.search_longitude').val(marker.getPosition().lng());

	   var Lat = marker.getPosition().lat();
	   console.log(Lat);
	   var Long = marker.getPosition().lng();
	   console.log(Long);
			 
	   var cafeLocation = {lat: Lat, lng: Long};

	   var service = new google.maps.places.PlacesService(map);
	   service.nearbySearch({
		   location: cafeLocation,
		   radius: 500,
	       type: ['restaurant']
       }, cafeCallback);

	  
  	} 

  	function getBars(){

  		var barRating;
  		
  	   $('.search_latitude').val(marker.getPosition().lat());
        $('.search_longitude').val(marker.getPosition().lng());

       var Lat = marker.getPosition().lat();
       console.log(Lat);

       var Long = marker.getPosition().lng();
       console.log(Long);

	   var barLocation = {lat: Lat, lng: Long};

	   var service = new google.maps.places.PlacesService(map);
	   service.nearbySearch({
		   location: barLocation,
		   radius: 500,
	       type: ['bar']
       }, barCallback);
   	}

  	function getSchools(){

  		var restaurantRating;
  		
  	   $('.search_latitude').val(marker.getPosition().lat());
        $('.search_longitude').val(marker.getPosition().lng());

       var Lat = marker.getPosition().lat();
       console.log(Lat);

       var Long = marker.getPosition().lng();
       console.log(Long);

      var schoolLocation = {lat: Lat, lng: Long};
       
	   var service = new google.maps.places.PlacesService(map);
	   service.nearbySearch({
		   location: schoolLocation,
		   radius: 500,
	       type: ['school']
       }, schoolCallback);
   	}

  	function getActivities(){

  	   $('.search_latitude').val(marker.getPosition().lat());
        $('.search_longitude').val(marker.getPosition().lng());

       var Lat = marker.getPosition().lat();
       console.log(Lat);

       var Long = marker.getPosition().lng();
       console.log(Long);

       var gymLocation = {lat: Lat, lng: Long};
       
	   var service = new google.maps.places.PlacesService(map);
	   service.nearbySearch({
		   location: gymLocation,
		   radius: 500,
	       type: ['gym']
       }, gymCallback);
   	}

    function getUniversity(){
    	  $('.search_latitude').val(marker.getPosition().lat());
          $('.search_longitude').val(marker.getPosition().lng());

         var Lat = marker.getPosition().lat();
         console.log(Lat);

         var Long = marker.getPosition().lng();
         console.log(Long);

         var UniLocation = {lat: Lat, lng: Long};

  	   var service = new google.maps.places.PlacesService(map);
	   service.nearbySearch({
		   location: UniLocation,
		   radius: 500,
	       type: ['park']
       }, uniCallback);
        }
   	

  	function callAllFunctions(){
  		getCafe();
		sendLatLong();
		getBars();
		getActivities();
		getSchools();	
		getUniversity();
  	  	}


  	
    function getCafe(){

  	  $('.search_latitude').val(marker.getPosition().lat());
  	   $('.search_longitude').val(marker.getPosition().lng());

  	   var Lat = marker.getPosition().lat();
  	   console.log(Lat);
  	   var Long = marker.getPosition().lng();
  	   console.log(Long);
  			 
  	   var cafeLocation = {lat: Lat, lng: Long};

  	   var service = new google.maps.places.PlacesService(map);
  	   service.nearbySearch({
  		   location: cafeLocation,
  		   radius: 500,
  	       type: ['restaurant']
         }, cafeCallback);

  	  
    	} 

    	function getBars(){

    		var barRating;
    		
    	   $('.search_latitude').val(marker.getPosition().lat());
          $('.search_longitude').val(marker.getPosition().lng());

         var Lat = marker.getPosition().lat();
         console.log(Lat);

         var Long = marker.getPosition().lng();
         console.log(Long);

  	   var barLocation = {lat: Lat, lng: Long};

  	   var service = new google.maps.places.PlacesService(map);
  	   service.nearbySearch({
  		   location: barLocation,
  		   radius: 500,
  	       type: ['bar']
         }, barCallback);
     	}

    	function getSchools(){

    		var restaurantRating;
    		
    	   $('.search_latitude').val(marker.getPosition().lat());
          $('.search_longitude').val(marker.getPosition().lng());

         var Lat = marker.getPosition().lat();
         console.log(Lat);

         var Long = marker.getPosition().lng();
         console.log(Long);

        var schoolLocation = {lat: Lat, lng: Long};
         
  	   var service = new google.maps.places.PlacesService(map);
  	   service.nearbySearch({
  		   location: schoolLocation,
  		   radius: 500,
  	       type: ['school']
         }, schoolCallback);
     	}

    	function getActivities(){

    	   $('.search_latitude').val(marker.getPosition().lat());
          $('.search_longitude').val(marker.getPosition().lng());

         var Lat = marker.getPosition().lat();
         console.log(Lat);

         var Long = marker.getPosition().lng();
         console.log(Long);

         var gymLocation = {lat: Lat, lng: Long};
         
  	   var service = new google.maps.places.PlacesService(map);
  	   service.nearbySearch({
  		   location: gymLocation,
  		   radius: 1000,
  	       type: ['gym']
         }, gymCallback);
     	}

      function getUniversity(){
      	  $('.search_latitude').val(marker.getPosition().lat());
            $('.search_longitude').val(marker.getPosition().lng());

           var Lat = marker.getPosition().lat();
           console.log(Lat);

           var Long = marker.getPosition().lng();
           console.log(Long);

           var UniLocation = {lat: Lat, lng: Long};

    	   var service = new google.maps.places.PlacesService(map);
  	   service.nearbySearch({
  		   location: UniLocation,
  		   radius: 1000,
  	       type: ['park']
         }, uniCallback);
          }
     	

    	function callAllFunctions(){
    		getCafe();
  		sendLatLong();
  		getBars();
  		getActivities();
  		getSchools();	
  		getUniversity();
    	  	}


    	
    	function cafeCallback(results, status){
   	    var totalRating = 0,
  	        ratedCount = 0; // used to count how many places have a rating

  	    results.forEach(function( place ) {
  	        if (place.rating !== undefined) {
  	            ratedCount++; 
  	            totalRating += place.rating;
  	        }
  	    });

  	    //Calculating the average rating from the list of gyms
  	    // use the counter to get the average since not all results were used for the totalRating
  	    var averageRating = results.length == 0 ? 0 : totalRating / ratedCount;
  	    var averageRatingRounded = averageRating.toFixed(1);

  	    // Passing the rating to a TextBox
  	    var averageRatingTB = document.getElementById('restaurantAvgRating');
  	    averageRatingTB.value = averageRatingRounded;

    	  	}


    	
    	function barCallback(results1, status1){
   	    var totalRating = 0,
          ratedCount = 0; 

      results1.forEach(function( place ) {
          if (place.rating !== undefined) {
              ratedCount++; 
              totalRating += place.rating;
          }
      });

      
      var averageRating = results1.length == 0 ? 0 : totalRating / ratedCount; 
      var averageRatingRounded = averageRating.toFixed(1);
    		 var averageBarRatingTB = document.getElementById('barAvgRating');
    		 averageBarRatingTB.value = averageRatingRounded;
    	  	}




    	
    	function gymCallback(results2, status2) {
    	    var totalRating = 0,
    	        ratedCount = 0; 

    	    results2.forEach(function( place ) {
    	        if (place.rating !== undefined) {
    	            ratedCount++; 
    	            totalRating += place.rating;
    	        }
    	    });

    	    
    	    var averageRating = results2.length == 0 ? 0 : totalRating / ratedCount; 
    	    var averageRatingRounded = averageRating.toFixed(1);

    	    
    	    var averageGymRatingTB = document.getElementById('gymAvgRating');
    	    averageGymRatingTB.value = averageRatingRounded;
    	}

   	function schoolCallback(results3, status3){
   	    var totalRating = 0,
          ratedCount = 0; 

      		results3.forEach(function( place ) {
         		if (place.rating !== undefined) {
              ratedCount++; 
              totalRating += place.rating;
          }
      });

      
      	var averageRating = results3.length == 0 ? 0 : totalRating / ratedCount; 
      	var averageRatingRounded = averageRating.toFixed(1);
    		 var averageSchoolRatingTB = document.getElementById('schoolAvgRating');
    		 averageSchoolRatingTB.value = averageRatingRounded;
    	}

   	function uniCallback(results4, status4){
   	    var totalRating = 0,
        ratedCount = 0; 

    		results4.forEach(function( place ) {
       		if (place.rating !== undefined) {
            ratedCount++; 
            totalRating += place.rating;
        }
    });

    
    	var averageRating = results4.length == 0 ? 0 : totalRating / ratedCount; 
    	var averageRatingRounded = averageRating.toFixed(1);
  		 var averageSchoolRatingTB = document.getElementById('parkAvgRating');
  		 averageSchoolRatingTB.value = averageRatingRounded;
  	}

  	function SchoolsReport(){
	  	 $('.search_latitude').val(marker.getPosition().lat());
   	 $('.search_longitude').val(marker.getPosition().lng());

  	 var Lat = marker.getPosition().lat();
   	 console.log(Lat);
   	 var Long = marker.getPosition().lng();
       console.log(Long);
       var location = {lat: Lat, lng: Long};
	     var service = new google.maps.places.PlacesService(map);
	     
       service.nearbySearch({
	     	location: location,
	  	    radius: 500,
          type: ['school']
 		 }, callback);
	}

  	function RestaurantReport(){

  	  $('.search_latitude').val(marker.getPosition().lat());
  	   $('.search_longitude').val(marker.getPosition().lng());

  	   var Lat = marker.getPosition().lat();
  	   console.log(Lat);
  	   var Long = marker.getPosition().lng();
  	   console.log(Long);
  			 
  	   var location = {lat: Lat, lng: Long};

  	   var service = new google.maps.places.PlacesService(map);
  	   service.nearbySearch({
  		   location: location,
  		   radius: 500,
  	       type: ['restaurant']
         }, callback);

  	  
    	} 

    	function BarReport(){

    		var barRating;
    		
    	   $('.search_latitude').val(marker.getPosition().lat());
          $('.search_longitude').val(marker.getPosition().lng());

         var Lat = marker.getPosition().lat();
         console.log(Lat);

         var Long = marker.getPosition().lng();
         console.log(Long);

  	   var location = {lat: Lat, lng: Long};

  	   var service = new google.maps.places.PlacesService(map);
  	   service.nearbySearch({
  		   location: location,
  		   radius: 500,
  	       type: ['bar']
         }, callback);
     	}


    	function GymReport(){

    	   $('.search_latitude').val(marker.getPosition().lat());
          $('.search_longitude').val(marker.getPosition().lng());

         var Lat = marker.getPosition().lat();
         console.log(Lat);

         var Long = marker.getPosition().lng();
         console.log(Long);

         var location = {lat: Lat, lng: Long};
         
  	   var service = new google.maps.places.PlacesService(map);
  	   service.nearbySearch({
  		   location: location,
  		   radius: 500,
  	       type: ['gym']
         }, callback);
     	}

      function UniversityReport(){
      	  $('.search_latitude').val(marker.getPosition().lat());
            $('.search_longitude').val(marker.getPosition().lng());

           var Lat = marker.getPosition().lat();
           console.log(Lat);

           var Long = marker.getPosition().lng();
           console.log(Long);

           var location = {lat: Lat, lng: Long};

    	   var service = new google.maps.places.PlacesService(map);
  	   service.nearbySearch({
  		   location: location,
  		   radius: 500,
  	       type: ['park']
         }, callback);
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
	
  //]]>	

    
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
	<h3>Profile</h3>
	
	<div class="container">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h3>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h3>

    </c:if>

</div>
        
        <a href = "savedAreasMap"> Your Saved Areas</a>
	
	<form>
		<div class="form-group input-group">
			<input type="text" id="search_location" class="form-control"
				placeholder="Search location" />
			<div class="input-group-btn">
				<button class="btn btn-default get_map" type="submit"
					onclick="callAllFunctions();">Locate</button>
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
<h4>Location Details</h4>
<p>Address: &nbsp; &nbsp;<input type="text" class="search_addr" size="45"/></p>
<p>Latitude: &nbsp; &nbsp;<input type="text" class="search_latitude" size="30"/></p>
<p>Longitude: <input type="text" class="search_longitude" size="30"/></p>
<p style = "height: 120px"></p>

</th>
<th style = "width: 50px">  </th>
<th>
<h4>Area Rating</h4>
<p>Average House Price: <input type="text"  size="10"/>&nbsp; &nbsp; &nbsp;<a href="#" onClick="loginAlert();">Full Report</a></p>
<p>Crime Rating: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="text" class="getCafe()" size="10"/>&nbsp; &nbsp; &nbsp;<a href="#" onClick="loginAlert();">Full Report</a></p>
<p>Schools:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="text"  size="10" name ="schoolAvgRating" id="schoolAvgRating"/>&nbsp; &nbsp; &nbsp;<button class="btn btn-default get_map" type="submit"
					onclick="clearMarkers();SchoolsReport();">Full Report</button></p>
<p>Parks: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="text"  size="10" name="parkAvgRating" id="parkAvgRating"/>&nbsp; &nbsp; &nbsp;<button class="btn btn-default get_map" type="submit"
					onclick="clearMarkers();UniversityReport();">Full Report</button></p>
<p>Bars: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  <input type="text"  size="10" name="barAvgRating" id="barAvgRating"/>&nbsp; &nbsp; &nbsp;<button class="btn btn-default get_map" type="submit"
					onclick="clearMarkers();BarReport();">Full Report</button></p>
<p>Restaurants: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="text"  size="10" name="restaurantAvgRating" id="restaurantAvgRating"/>&nbsp; &nbsp; &nbsp;<button class="btn btn-default get_map" type="submit"
					onclick="clearMarkers();RestaurantReport();">Full Report</button></p>
<p>Gyms: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <input type="text"  size="10" name="gymAvgRating" id="gymAvgRating"/>&nbsp; &nbsp; &nbsp;<button class="btn btn-default get_map" type="submit"
					onclick="clearMarkers();GymReport();">Full Report</button></p>
</th>
<th style = "width: 50px">  </th>
<th><a class="twitter-timeline" width = "400" height = "350" href="https://twitter.com/hashtag/Dublin" data-widget-id="941377507412111360">#Dublin Tweets</a>
            <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script> </th>
<th style = "width: 50px">  </th>
<th><form action = "#" method = "post">
	<input type="submit" value = "Save this area" onclick = "saveAreaToUser();"/>
	</form> </th>
<tr>
<td>

</td>
</tr>

</table>
</div>
</body>

</html>