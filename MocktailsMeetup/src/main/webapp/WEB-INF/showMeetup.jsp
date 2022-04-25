<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>





<meta charset="UTF-8">
<title>Meetup Details</title>
</head>
<body>



<h1>Meetup Details</h1>

	<div class="details">
		<h5>${meetup.name}</h5>
		<p>${meetup.description}</p>
		<h4>${meetup.startTime}, ${meetup.endTime}</h4>
	</div>




	<div style="padding: 10px">
		<div id="map"></div>
	</div>

	<script type="text/javascript">
		var map;

		function initMap() {
			var street = ${address.street}; // YOUR LATITUDE VALUE
			var city = ${address.city}; // YOUR LONGITUDE VALUE
			var state = ${address.state}; // YOUR LONGITUDE VALUE
	//FIX ME
			var myLatLng = {
				lat : latitude,
				lng : longitude
			};

			map = new google.maps.Map(document.getElementById('map'), {
				center : myLatLng,
				zoom : 14
			});

			var marker = new google.maps.Marker({
				position : myLatLng,
				map : map,

				title : latitude + ', ' + longitude
			});
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDzy-u0ZqxrRptKkEvuJV7nUwWazekSszQ&callback=initMap"
		async defer></script>

</body>


</body>
</html>