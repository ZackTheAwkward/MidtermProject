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
		<h4>${meetup.startTime},${meetup.endTime}</h4>
	</div>




	<div style="padding: 10px">
		<div id="map"></div>
	</div>

	<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

	<script type="module" src="./index.js"></script>


</head>
<body>
    <div id="floating-panel">
      <code>componentRestrictions: {country: "AU", postalCode: "2000"}</code>
		<br />
      <button id="submit">Geocode</button>
    </div>
    <div id="map"></div>

    <!-- 
     The `defer` attribute causes the callback to execute after the full HTML
     document has been parsed. For non-blocking uses, avoiding race conditions,
     and consistent behavior across browsers, consider loading using Promises
     with https://www.npmjs.com/package/@googlemaps/js-api-loader.
    -->
    <script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly"
		defer></script></body>



</body>
</html>