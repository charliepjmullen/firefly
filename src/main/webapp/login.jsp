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

    <title>Area Rating System</title>
    
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" /> 

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBFPWYqo7eTVGJhmehhcndY1R8Dc-vQuXE&amp;libraries=places"></script>
    

     <!--  <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"> -->
    <!-- <link href="${contextPath}/resources/css/common.css" rel="stylesheet"> -->


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
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
    ['<p><b>European Innovation Academy </b></p>' + '<p> Address: Av. Amaral, 2765-192 Estoril</p>' +  '<p> The extreme accelerator from idea to a start-up in 15 days!</p>' + '<p>When: Today </p>' + '<p>Duration: 10:00 - 20:00</p> ' + '<p>Hosted by: <a href = "#"> EIA</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.706501, -9.396243, 4],
    ['<p><b>Beach Party </b></p>' + '<p> Address: Estoril Beach</p>' +  '<p> Planning a big beach party for EIA students. Tell your friends everyones invited!</p>' + '<p>When: Today </p>' + '<p>Duration: 20:00 - 7:00</p>' + '<p>Hosted by: <a href = "#"> CK Dhaliwal</a></p>' + '<p><button type="button">I am interested in this event</button></p>', 38.700284, -9.387348, 5],
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
/*             select: function (event, ui) {
                $('.search_addr').val(ui.item.value);
                $('.search_latitude').val(ui.item.lat);
                $('.search_longitude').val(ui.item.lon);
                var latlng = new google.maps.LatLng(ui.item.lat, ui.item.lon);
                marker.setPosition(latlng);
                
                initialize();
            } */
            
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


   /*      function getNearestGardaStation(){
      	  $('.search_latitude').val(marker.getPosition().lat());
            $('.search_longitude').val(marker.getPosition().lng());

           var Lat = marker.getPosition().lat();
           console.log(Lat);

           var Long = marker.getPosition().lng();
           console.log(Long);

           var gardaStationLocation = {lat: Lat, lng: Long};

    	   var service = new google.maps.places.PlacesService(map);
  	   service.nearbySearch({
  		   location: gardaStationLocation,
  		   //radius: 1500,
  		   rankBy: google.maps.places.RankBy.DISTANCE,
  	       type: ['police']
         }, gardaStationCallback);
            } */
       	

      	function callAllFunctions(){
      		getCafe();
    		    getBars();
    		    getActivities();
    		    getSchools();	
    		    getUniversity();
    		    getLeisureActivities();
    		    //getNearestGardaStation();
    		    clearRatings();

    		
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

        var Lgong = marker.getPosition().lng();
        console.log(Long);

        var location = {lat: Lat, lng: Long};
        
 	   var service = new google.maps.places.PlacesService(map);
 	   service.nearbySearch({
 		   location: location,
 		   radius: 1000,
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
 		   radius: 1000,
 	       type: ['park']
        }, callback);
         }

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
          		/*  var averageSchoolRatingTB = document.getElementById('parkAvgRating');
          		 averageSchoolRatingTB.value = averageRatingRounded; */

          		var a = document.querySelector('li[data-target="#leisure"] > a'); //get the a in the menu
             	var leisureScore = document.createElement("span"); //create a new span
             	a.appendChild(leisureScore); // add the span to the a

             	leisureScore.innerText = averageRatingRounded;
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

/* 	function callback(results, status) {
		  if (status === google.maps.places.PlacesServiceStatus.OK) {
		    var service = new google.maps.places.PlacesService(map);
		    for (var i = 0; i < results.length; i++) {
		      var request = {
		        placeId: results[i].place_id
		      }
		      service.getDetails(request, createMarker)
		    }
		  } else console.log("nearbySearch:"+status);
		} */

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

		 function clearRatings() {
			 document.querySelectorAll("span").forEach(a => a.parentNode.removeChild(a));  
			}
</script>
</head>

<body>


<!-- <div class="container" id = "homelogin">

    
</div> -->
	<body>



<!-- 	<div class="nav-side-menu">
		<div class="brand">Suss</div>
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
				
								<li data-toggle="collapse" data-target="#findevents"
					class="collapsed active"><a href = "findevent"><i
						class="fa fa-area-chart fa-lg"></i> Find Events <span class="arrow"></span></a>
				</li>
				<ul class="sub-menu collapse" id="findevents">

					<li><a href="#">Local Events</a></li>
					<li><a href="#">Future Events</a></li>
				</ul>
				
				<li data-toggle="collapse" data-target="#addevents"
					class="collapsed active"><a href = "addeventpage"><i
						class="fa fa-area-chart fa-lg"></i> Add an Event <span class="arrow"></span></a>
				</li>
			


				

			


			</ul>
		</div>
	</div> -->
	
	<div id="custom-bootstrap-menu" class="navbar navbar-default "
		role="navigation">
		<div class="container-fluid">

			 <div class="navbar-header">
				<a class="navbar-brand" href="/"
					style="max-width: 30%; max-height: 30%;"> <img class = "logoimage"
					src="${pageContext.request.contextPath}/resources/images/firefly_logo.PNG"></a>

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


	<div id= "introtext"><h4>Welcome to Firefly, find small and trendy events in your city now!</h4></div>
	<!--  <div class = map> 	 -->
	<!-- display google map -->
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
			<%-- <form>
		<div class="form-group2 input-group">
			<input type="text" name="addressBox"
							id="addressBox" class="search_addr" size="45" class="form-control"
				placeholder="Address" />
			<div class="input-group-btn">
				<button class="btn btn-default " type="submit"
					onclick="saveAreaToUser();">Save
						Area</button>
			</div>
		</div>
	</form> --%>
		<!-- <div id="addressbartable">
		<table style="width: 100%">
			<tr>
				<td>
					<p>
						Address: &nbsp; &nbsp;<input type="text" name="addressBox"
							id="addressBox" class="search_addr" size="45" />
					</p>
				</td>
				<td></td>
				<td><button type="submit" onclick="saveAreaToUser();">Save
						Area</button></td>

			</tr>

		</table>
		</div> -->
		
		<div id="geomap"></div>

	<%-- <div class = inputboxes>
	<div id="forminputs"></div>

		<table>
			<tr style="width: 50%">
			</tr>
			<tr>
				<!-- display selected location information -->
				<th>
					
					<p>
						<!-- Address: &nbsp; &nbsp; --><input type="hidden" name="addressBox"
							id="addressBox" class="search_addr" size="45" />
					</p>
					<p>
						<!-- Latitude: --> <input type="hidden" class="search_latitude"
							size="30" />
					</p>
					<p>
						<!-- Longitude: --> <input type="hidden" class="search_longitude" size="30" />
					</p>
					<p style="height: 120px"></p>

				</th>
				<th style="width: 50px"></th>
				<th>
					<h4><!-- Area Rating --></h4>
			


					<p>
						<!-- Average House Price: --> <input type="hidden" size="10"
							value="${houseprice}" />&nbsp; &nbsp; &nbsp;
						<!-- <button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();parseHousePrice();">Full Report</button> -->
					</p>
					<p>
						<!-- Crime Rating: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --> <input
							type="hidden" size="10" value="${rating}" />&nbsp; &nbsp; &nbsp;
						<!-- <button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();gardaStationReport();">Full
							Report</button> -->
					</p>
					<p>
						<!-- Schools:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; --> <input type="hidden" size="10"
							name="schoolAvgRating" id="schoolAvgRating" />&nbsp; &nbsp;
						&nbsp;
						<!-- <button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();SchoolsReport();">Full Report</button> -->
					</p>
					<p>
						<!-- Parks: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --> <input type="hidden" size="10"
							name="parkAvgRating" id="parkAvgRating" />&nbsp; &nbsp; &nbsp;
						<!-- <button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();UniversityReport();">Full Report</button> -->
					</p>
					<p>
						<!-- Bars: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --> <input type="hidden"
							size="10" name="barAvgRating" id="barAvgRating" />&nbsp; &nbsp;
						&nbsp;
						<!-- <button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();BarReport();">Full Report</button> -->
					</p>
					<p>
						<!-- Restaurants: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						&nbsp; --><input type="hidden" size="10" name="restaurantAvgRating"
							id="restaurantAvgRating" />&nbsp; &nbsp; &nbsp;
						<!-- <button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();RestaurantReport();">Full Report</button> -->
					</p>
					<p>
						<!-- Gyms: --><input type="hidden" size="10"
							name="gymAvgRating" id="gymAvgRating" />&nbsp; &nbsp; &nbsp;
					<!-- 	<button class="btn btn-default get_map" type="submit"
							onclick="clearMarkers();GymReport();">Full Report</button> -->
					</p>
				</th>

				<th style="width: 50px"></th>
				<th></th>
			<tr>
				<td></td>
			</tr>

		</table>
	</div> --%>
	
</body>
</html>
