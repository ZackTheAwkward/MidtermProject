<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>





<meta charset="UTF-8">
<title>Meetup Details</title>
<style>
html, body {
	border: 0;
	margin: 0;
	padding: 0;
}

#map {
	height: 300px;
	width: 600px;
}
</style>
</head>
<body>



	<h1>Meetup Details</h1>

	<div class="details">
		<h5>${meetup.title}</h5>
		<p>${meetup.description}</p>
		<h4>${meetup.startTime} ${meetup.endTime}</h4>
	</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>


	<div id="map"></div>
	<script>
         var map;
         function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
               center: { lat: 37.773972, lng: -122.431297 },
               zoom: 13
            });

            //Begin Geocoder
            const geocoder = new google.maps.Geocoder();
            const address = '${meetup.street}, ${meetup.city}, ${meetup.state}, ${meetup.postalCode}';
            geocoder.geocode({ address }, (results, status) => {
               const marker = new google.maps.Marker({
                  map: map,
                  position: results[0].geometry.location
               });
            });
         }
      </script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDzy-u0ZqxrRptKkEvuJV7nUwWazekSszQ&callback=initMap"
		async defer></script>


</body>


</body>
</html>