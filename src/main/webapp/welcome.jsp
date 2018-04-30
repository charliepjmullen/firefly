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

<title>Area Rating System</title>

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
	width: 77%;
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
	width: 22%;
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



/* window.onload = function() {
    if(!window.location.hash) {
        window.location = window.location + '#loaded';
        window.location.reload();
    }
} */
/*
 * Google Map with marker
 */
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

	function saveAreaToUser(){

		   $('.search_latitude').val(marker.getPosition().lat());
		   var Lat = marker.getPosition().lat();
		   console.log(Lat);
		   
	       $('.search_longitude').val(marker.getPosition().lng());
		   var Long = marker.getPosition().lng();
		   console.log(Long);



			var areaName = document.getElementById("addressBox").value;
			var schools = document.getElementById("schoolAvgRating").value;
		
			var bars = document.getElementById("barAvgRating").value;
			var gym = document.getElementById("gymAvgRating").value;
			var restaurant = document.getElementById("restaurantAvgRating").value;  
		  
		$.ajax({
	     type: "POST",
	     url: "/saveAreaToProfile",
	     data: { latitude: Lat, 
                 longitude: Long,  
                 areaName: areaName,
                 schools: schools,
            
                 bars: bars,
                 gym: gym,
                 restaurant: restaurant
		        }, // parameters
          datatype: 'json'
});
	}

	function parseHousePrice(){

		   $('.search_latitude').val(marker.getPosition().lat());
		   var Lat = marker.getPosition().lat();
		   console.log(Lat);
		   
	       $('.search_longitude').val(marker.getPosition().lng());
		   var Long = marker.getPosition().lng();
		   console.log(Long);

		$.ajax({
	     type: "POST",
	     url: "/parseHousePrice",
	     data: { latitude: Lat, 
                 longitude: Long  
		       }, // parameters
         datatype: 'json',
         success: function(data){
             if(data === "NewFile"){
                  //Open new page
                  // /ControllerName/ActionMethodName
            	 window.open("/parseHousePrice/NewFile");
             }      
         },
         error: function(data){
             if(data != "NewFile"){
            	 console.log('error!');
        	  }
         }
        });

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
		   radius: 1000,
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
		   radius: 1000,
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
		   radius: 1000,
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
  		   radius: 1000,
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
  		   radius: 1000,
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
  		   radius: 1000,
  	       type: ['school']
         }, schoolCallback);
     	}

    	// ALL EXTRA SUB HEADINGS ADDED ON 14:34 24/04/2018 FROM HERE V
    	  // FITNESS
    	function getYoga(){

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
   		   radius: 1000,
   	       /* type: ['gym'] */
   	       keyword: ['yoga']
          }, callback);
      	}

    	function getPilates(){

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
    		   radius: 1000,
    	       /* type: ['gym'] */
    	       keyword: ['pilates']
           }, callback);
       	}

    	function getJustGym(){

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
     		   radius: 1000,
     	       /* type: ['gym'] */
     	       keyword: ['gym']
            }, callback);
        	}

       	//BARS
		   function getCocktails(){

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
     		   radius: 1000,
     	       /* type: ['gym'] */
     	       keyword: ['cocktails']
            }, callback);
        	}

		   function getPubs(){

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
	     		   radius: 1000,
	     	       /* type: ['gym'] */
	     	       keyword: ['pub']
	            }, callback);
	        	}

		   function getCheapBars(){

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
	     		   radius: 1000,
	     	       type: ['bar'],
	     	       maxprice : 2 
	            }, callback);
	        	}
       	
		   function getExpensiveBars(){

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
	     		   radius: 1000,
	     	       type: ['bar'],
	     	       minprice : 3,
	     	       maxprice : 4
	            }, callback);
	        	}	

	    // EDUCATION
	    
	    	   function getCreche(){

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
	     		   radius: 1000,
	     		  
	     		   keyword: ['creche','montessori']
	            }, callback);
	        	}	

	    	   function getPrimarySchool(){

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
		     		   radius: 1000,
		     		   keyword: ['primary','national school']
		            }, callback);
		        	}	

	    	   function getSecondarySchool(){

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
		     		   radius: 1000,
		     		   keyword: ['secondary school','high school']
		            }, callback);
		        	}	

	    // FOOD
	    
	    	    	   function getCafes(){

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
		     		   radius: 1000,
		     		   keyword: ['cafe']
		            }, callback);
		        	}	

	    	    	   function getRestaurants(){

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
	    		     		   radius: 1000,
	    		     		   keyword: ['restaurant']
	    		            }, callback);
	    		        	}

	    	    	   function getTakeaways(){

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
	    		     		   radius: 1000,
	    		     		  keyword: ['takeaway','delivery']
	    		            }, callback);
	    		        	}
	    // LEISURE
	    
	    function getCinemas(){

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
	    		     radius: 1000,
	    		     keyword : ['cinema']
	    	}, callback);
	    }

	    function getLocalParks(){

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
	    	    	radius: 1000,
	    	    	type : ['park']
	    	}, callback);
	    }
	    
	    
     	//^ TO HERE
      function getLeisureActivities(){
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
  	       keyword: ['park'|'cinema']
         }, leisureActivitiesCallback);
          }
     	

    	function callAllFunctions(){

    		var searchRequest = document.getElementById("search_location").value;
    		var isInDublin;

    		if (searchRequest.includes("Dublin") || searchRequest.includes("dublin")){
                   isInDublin = true;
        		}  
    		else { isInDublin = false;}

    		if (searchRequest == null || searchRequest ==" " || isInDublin == false)
    		 {
                alert("You must enter a valid address in Dublin:!");
                location.reload();
            } else {
            	
                     getCafe();
	    	         getBars();
		    	     getActivities();
		    	     getSchools();	
		  		     getLeisureActivities();
		    	     clearRatings();
		    	     storeAddress();
		 
		    	   }
  		
    	}

    	function callAllfunctions2(){

    		 getCafe();
	         getBars();
    	     getActivities();
    	     getSchools();	
  		     getLeisureActivities();
    	     clearRatings();
    	     storeAddress();

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

		var a = document.querySelector('li[data-target="#food"] > a'); //get the a in the menu
  	    var foodScore = document.createElement("span"); //create a new span
  	    a.appendChild(foodScore); // add the span to the a

  	    foodScore.innerText = averageRatingRounded;

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

      var a = document.querySelector('li[data-target="#bars"] > a'); //get the a in the menu
      var barScore = document.createElement("span"); //create a new span
      a.appendChild(barScore); // add the span to the a

    	  	 barScore.innerText = averageRatingRounded;
    		 
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

    	    var a = document.querySelector('li[data-target="#fitness"] > a'); //get the a in the menu
    	    var fitnessScore = document.createElement("span"); //create a new span
    	    a.appendChild(fitnessScore); // add the span to the a

    	    fitnessScore.innerText = averageRatingRounded;
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

    	var a = document.querySelector('li[data-target="#education"] > a'); //get the a in the menu
     	var educationScore = document.createElement("span"); //create a new span
     	a.appendChild(educationScore); // add the span to the a

     	educationScore.innerText = averageRatingRounded;
    	}

   	function leisureActivitiesCallback(results4, status4){
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


  		var a = document.querySelector('li[data-target="#leisure"] > a'); //get the a in the menu
     	var leisureScore = document.createElement("span"); //create a new span
     	a.appendChild(leisureScore); // add the span to the a

     	leisureScore.innerText = averageRatingRounded;
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
	  	    radius: 1000,
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
  		   radius: 1000,
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
  		   radius: 1000,
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
  		   radius: 1000,
  	       type: ['gym']
         }, callback);
     	}

      function leisureActivityReport(){
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
  		   radius: 1000,
  		    type: ['park'],
   	        keyword: ['cinema']
         }, callback);
          }


      function gardaStationReport(){
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
  		   //radius: 1500,
  		 rankBy: google.maps.places.RankBy.DISTANCE,
  	       type: ['police']
         }, gardaStationReportcallback);
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


	function gardaStationReportcallback(results, status){
		
		  if (status === google.maps.places.PlacesServiceStatus.OK) {
			  if(marker)
		           	marker.setMap(null)
			 for (var i = 0; i < 1; i++) {
			      createMarker(results[i]);
			    }
			  results2 = results.slice(0,1); 
			  results2.forEach(function(place){
					var gardastation = place.name;
					console.log(gardastation);

					
					$.ajax({
					     type: "POST",
					     url: "/crimestats",
					     data: { gardastationname: gardastation
						}, // parameters
				     datatype: 'json'
				});
			  });
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
	    infowindow.setContent("<p>" + place.name + "<br />" + place.rating + "<br />" + place.vicinity + "<br />" + "<br />" + place.types + "<br />" +"</p>");
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

 function sendAddressToCommutePage(){
	
	 $('.search_latitude').val(marker.getPosition().lat());
     $('.search_longitude').val(marker.getPosition().lng());

    var latitude = marker.getPosition().lat();


    var longitude = marker.getPosition().lng();
   
	 var address = document.getElementById("addressBox").value;
 
	window.location.href = "/commuteCheckerPage/"+latitude+"/"+longitude+"/"+address ;
	
	 }

 // An error is prompted here at times with red underline but the project still runs regardless
 function clearRatings() {
	 document.querySelectorAll("span").forEach(span => span.parentNode.removeChild(span));  
	 document.getElementById('schoolAvgRating').value = '';
	 document.getElementById('parkAvgRating').value = '';
	 document.getElementById('barAvgRating').value = '';
	 document.getElementById('restaurantAvgRating').value = '';
	 document.getElementById('gymAvgRating').value = '';
	}

 function openCrimeStatistics(){
	 window.location.href = "/crimeStats2";
	 }

 function leaveReview(){


	     $('.search_latitude').val(marker.getPosition().lat());
	     $('.search_longitude').val(marker.getPosition().lng());

	     var latitude = marker.getPosition().lat();
	     var longitude = marker.getPosition().lng();
		 var address = document.getElementById("addressBox").value;

	

		 window.location.href = "/review/"+latitude+"/"+longitude+"/"+address ;
	 }

 function seeallReviews(){


	     $('.search_latitude').val(marker.getPosition().lat());
	     $('.search_longitude').val(marker.getPosition().lng());

	     var latitude = marker.getPosition().lat();
	     var longitude = marker.getPosition().lng();


		 window.location.href = "/readreview/"+latitude+"/"+longitude;
	 }

  	function validateSearchCommute(){

  		var address = document.getElementById("addressBox").value;
  		var searchRequest = document.getElementById("search_location").value;
		var isInDublin;

		if (searchRequest.includes("Dublin") || searchRequest.includes("dublin")){
               isInDublin = true;
    		}  
		else { isInDublin = false;}

		if (searchRequest == null || searchRequest ==" " || address == null || address ==" " || isInDublin == false)
		 {
            alert("Please Enter an Address in Dublin before checking the commute!");
            location.reload();
        } else 
            {
        	sendAddressToCommutePage();
            }
	}   

  	function validateSearchReview(){

  		var address = document.getElementById("addressBox").value;
  		var searchRequest = document.getElementById("search_location").value;
		var isInDublin;

		if (searchRequest.includes("Dublin") || searchRequest.includes("dublin")){
               isInDublin = true;
    		}  
		else { isInDublin = false;}

		if (searchRequest == null || searchRequest ==" " || address == null || address ==" " || isInDublin == false)
		 {
            alert("Please Enter an Address in Dublin before writing a review!");
            location.reload();
        } else 
            {
        	leaveReview();
            }
	}   

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
 	function getGS(){
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
		   //radius: 1500,
		 rankBy: google.maps.places.RankBy.DISTANCE,
	       type: ['police']
      }, gardaStationReportcallback2);
       }

	function gardaStationReportcallback2(results, status){
		var gardastation;

			  results2 = results.slice(0,1); 
			  results2.forEach(function(place){
					gardastation = place.name;
					console.log(gardastation);
			  });

			  return gardastation;
		  }
		  
</script>
</head>



<body>



	<div class="nav-side-menu">
		<div class="brand">Brand Logo</div>
		<i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse"
			data-target="#menu-content"></i>

		<div class="menu-list">

			<ul id="menu-content" class="menu-content collapse out">
				<li><a href="/"> <i class="fa fa-bar-chart fa-lg"></i> Area
						Stats
				</a></li>

				<li data-toggle="collapse" data-target="#products"
					class="collapsed active"><a onclick="gardaStationReport();"><i
						class="fa fa-area-chart fa-lg"></i> General <span class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="products">

					<li><a onclick="parseHousePrice();" href="parseHousePrice2">House
							Price</a></li>
					<li><a onclick="openCrimeStatistics();" href="#">Crime
							Rating</a></li>
				</ul>


				<li data-toggle="collapse" data-target="#education"
					class="collapsed"><a onclick="clearMarkers();SchoolsReport();"
					href="#"><i class="fa fa-graduation-cap fa-lg"></i> Education :
						<span class="arrow"></span></a></li>
				<ul class="sub-menu collapse" id="education">
					<li><a onclick="clearMarkers();getCreche();">Creche</a></li>
					<li><a onclick="clearMarkers();getPrimarySchool();">Primary
							Schoool</a></li>
					<li><a onclick="clearMarkers();getSecondarySchool();">Secondary
							School</a></li>

				</ul>

				<li data-toggle="collapse" data-target="#food" class="collapsed">
					<a onclick="clearMarkers();RestaurantReport();" href="#"><i
						class="fa fa-cutlery fa-lg"></i> Food : <span class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="food">
					<li><a onclick="clearMarkers();getCafes();">Cafe</a></li>
					<li><a onclick="clearMarkers();getRestaurants();">Restaurant</a></li>
					<li><a onclick="clearMarkers();getTakeaways();">Take Away</a></li>
				</ul>


				<li data-toggle="collapse" data-target="#bars" class="collapsed">
					<a onclick="clearMarkers();BarReport();" href="#"><i
						class="fa fa fa-beer fa-lg"></i> Bars : <span class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="bars">
					<li><a onclick="clearMarkers();getPubs();">Pubs</a></li>
					<li><a onclick="clearMarkers();getCocktails();">Cocktails</a></li>
					<li><a onclick="clearMarkers();getCheapBars();">Cheap</a></li>
					<li><a onclick="clearMarkers();getExpensiveBars();">Expensive</a></li>
				</ul>

				<li data-toggle="collapse" data-target="#fitness" class="collapsed">
					<a onclick="clearMarkers();GymReport();" href="#"><i
						class="fa fa-heart fa-lg"></i> Fitness : <span class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="fitness">
					<li><a onclick="clearMarkers();getJustGym();">Gym</a></li>
					<li><a onclick="clearMarkers();getYoga();">Yoga</a></li>
					<li><a onclick="clearMarkers();getPilates();">Pilates</a></li>
				</ul>



				<li data-toggle="collapse" data-target="#leisure" class="collapsed">
					<a onclick="clearMarkers();leisureActivityReport();"><i
						class="fa fa-gift fa-lg"></i> Leisure : <span class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="leisure">
					<li><a onclick="clearMarkers();getLocalParks();">Parks</a></li>
					<li><a onclick="clearMarkers();getCinemas();">Cinema</a></li>
				</ul>

				<li data-toggle="collapse" data-target="#commute" class="collapsed">
					<a href="#" onclick="validateSearchCommute();"><i
						class="fa fa-car fa-lg"></i> Check The Commute </a>
				</li>


				<li data-toggle="collapse" data-target="savedareas"
					class="collapsed"><a href="savedAreasMap"><i
						class="fa fa-home fa-lg"></i> My Saved Areas </a></li>

				<li data-toggle="collapse" data-target="#reviews" class="collapsed">
					<a href="#"><i class="fa fa-book fa-lg"></i> Reviews <span
						class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="reviews">
					<li><a onclick="validateSearchReview();">Write a Review
							for this Area</a></li>
					<li><a onclick="seeallReviews();">Read Reviews for this
							Area</a></li>
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
							<li><a href="commuteplanner">Add more addresses to
									Commutes</a></li>
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
								onclick="callAllFunctions();">Locate</button>
						</div>
					</div>
			</td>
			<td style="width: 50px">
			<td style="width: 50px">
				<button class="btn btn-default " type="submit"
					onclick="searchnewArea();">Search New Area</button>
			</td>
			<td>
				<div class="form-group2 input-group">
					<input type="hidden" name="addressBox" id="addressBox"
						class="search_addr" size="45" class="form-control"
						placeholder="Address" />
					<div class="input-group-btn2">
						<button class="btn btn-default " type="submit"
							onclick="saveAreaToUser();">Save Area</button>
					</div>
				</div>
			</td>
			</form>
		</tr>
	</table>
	<div id="geomap"></div>

	<div class=inputboxes>
		<div id="forminputs"></div>

		<table>
			<tr style="width: 50%">
			</tr>
			<tr>
				<!-- display selected location information -->
				<th>

					<p>
						<!-- Address: &nbsp; &nbsp; -->
						<input type="hidden" name="addressBox" id="addressBox"
							class="search_addr" size="45" />
					</p>
					<p>
						<!-- Latitude: -->
						<input type="hidden" class="search_latitude" size="30" />
					</p>
					<p>
						<!-- Longitude: -->
						<input type="hidden" class="search_longitude" size="30" />
					</p>
					<p style="height: 120px"></p>

				</th>
				<th style="width: 50px"></th>
				<th>
					<h4>
						<!-- Area Rating -->
					</h4>



					<p>
						<!-- Average House Price: -->
						<input type="hidden" size="10" value="${houseprice}" />&nbsp;
						&nbsp; &nbsp;
						<button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();parseHousePrice();">Full Report</button>
					</p>
					<p>
						<!-- Crime Rating: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -->
						<input type="hidden" size="10" value="${rating}" />&nbsp; &nbsp;
						&nbsp;
						<button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();gardaStationReport();">Full
							Report</button>
					</p>
					<p>
						<!-- Schools:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; -->
						<input type="hidden" size="10" name="schoolAvgRating"
							id="schoolAvgRating" />&nbsp; &nbsp; &nbsp;
						<button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();SchoolsReport();">Full Report</button>
					</p>
					<p>
						<!-- Parks: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -->
						<input type="hidden" size="10" name="parkAvgRating"
							id="parkAvgRating" />&nbsp; &nbsp; &nbsp;
						<button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();UniversityReport();">Full Report</button>
					</p>
					<p>
						<!-- Bars: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; -->
						<input type="hidden" size="10" name="barAvgRating"
							id="barAvgRating" />&nbsp; &nbsp; &nbsp;
						<button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();BarReport();">Full Report</button>
					</p>
					<p>
						<!-- Restaurants: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; -->
						<input type="hidden" size="10" name="restaurantAvgRating"
							id="restaurantAvgRating" />&nbsp; &nbsp; &nbsp;
						<button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();RestaurantReport();">Full Report</button>
					</p>
					<p>
						<!-- Gyms: -->
						<input type="hidden" size="10" name="gymAvgRating"
							id="gymAvgRating" />&nbsp; &nbsp; &nbsp;
						<button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();GymReport();">Full Report</button>
					</p>
				</th>

				<th style="width: 50px"></th>
				<th></th>
			<tr>
				<td></td>
			</tr>

		</table>
	</div>
	</div>
</body>
</html>