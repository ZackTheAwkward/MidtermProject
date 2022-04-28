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
	height: 800px;
	width: 100%;
	margin-left: auto;
	margin-right: auto;
}

.details {
	text-align: center;
	position: absolute;
	top: 20%;
	right: 25%;
	left: 25%;
}

h1 {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="loggedInNavbar.jsp"%>

	<h1>Meetup Details</h1>

	<div class="details">
		<h5>${meetup.title}</h5>
		<p>${meetup.description}</p>
		<p>Address: ${meetup.address}</p>
		<h4>Start: ${meetup.startTime} End: ${meetup.endTime}</h4>
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
		var geocoder;
		var map;
		var address = "${meetup.address.street}, ${meetup.address.city}, ${meetup.address.stateAbbr}, ${meetup.address.postalCode}";
		function initMap() {
			var map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : {
					lat : 39.7392,
					lng : -104.9903
				}
			});
			geocoder = new google.maps.Geocoder();
			codeAddress(geocoder, map);
		}

		function codeAddress(geocoder, map) {
			geocoder
					.geocode(
							{
								'address' : address
							},
							function(results, status) {
								if (status === 'OK') {
									map.setCenter(results[0].geometry.location);
									var marker = new google.maps.Marker({
										map : map,
										position : results[0].geometry.location
									});
								} else {
									alert('Geocode was not successful for the following reason: '
											+ status);
								}
							});
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDzy-u0ZqxrRptKkEvuJV7nUwWazekSszQ&callback=initMap">
		
	</script>



</body>


</body>
</html>