<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>${meetup.title}</title>

<style>
html, body {
	border: 0;
	margin: 0;
	padding: 0;
}

#map {
	height: 500px;
	width: 50%;
}

#image {
	height: 500px;
	width: 50%;
}

h1 {
	text-align: center;
}

.topLeft {
	font-weight: bold;
	position: absolute;
	top: 45%;
	left: 10%;
}

.topRight {
	position: absolute;
	top: 30%;
	margin-left: 50%;
	margin-top: auto;
}

.bottomLeft {
	position: absolute;
	top: 70%;
	margin-right: 50%;
	margin-top: auto;
}

.bottomRight {
	font-weight: bold;
	position: absolute;
	top: 100%;
	right: 10%;
}
</style>
</head>
<body>
	<%@ include file="loggedInNavbar.jsp"%>
	
	<br>
	<br>
	<br>
	<h1>Meetup Details for ${meetup.title}</h1>

	<div class="topLeft">
		<h2>${meetup.title}</h2>
		<h5>${meetup.description}</h5>
	</div>

	<div class="bottomRight">
		<h2>Address: ${meetup.address}</h2>
		<h4>Start: ${meetup.startTime} End: ${meetup.endTime}</h4>
	</div>


	<img class="topRight" id="image" src="${meetup.imageURL}" />

	<div class="bottomLeft" id="map"></div>
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