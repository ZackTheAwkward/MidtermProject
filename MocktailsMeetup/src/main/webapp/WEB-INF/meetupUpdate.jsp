<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update your Meetup</title>
</head>

<style>



body {
	width: 1400px;
	height: auto;
	background:
		url("https://live.staticflickr.com/65535/52036744182_68c6a1b140_h.jpg")
		center center;
	background-size: cover;
	margin-top: 120px;
}

.container input[type="text"] {
	width: 550px !important;
	margin-right: auto;
	margin-left: auto;
}

.container {
	margin-top: 100px;
	margin-bottom: 100px;
	padding-right: 0px;
	padding-left: 0px;
	background-color: white;
	height: 500px;
	width: 650px !important;
	border-radius: 3%;
}

.form-group {
justify-content: center;} 

h1 {
  font-family: 'Playfair Display', serif;
	text-align: center;
	padding-top: 30px;
}
</style>
<body>
	<%@ include file="loggedInNavbar.jsp"%>




	<div class="container">
	<h1>Update Meetup</h1>

		<form action="updatedMeetup.do" method="POST">
			<div class="table">
				<input type="hidden" name="id" value="${meetup.id }" />

				<div class="form-group row">
					<Label class="form-input-label"></Label> <input
						type="text" name="title" placeholder="Title: ${meetup.title }" />
				</div>

				<div class="form-group row">
					<Label class="form-input-label"></Label> <input
						type="text" name="description" value="Description: ${meetup.description}" />
				</div>


				<div class="form-group row">
					<Label class="form-input-label"></Label> <input
						type="text" name="maxAttendees" placeholder="Max Attendees: ${meetup.maxAttendees}" />
				</div>


				<div class="form-group row">
					<Label class="form-input-label"></Label> <input
						type="text" name="imageURL" placeholder="Image URL ${meetup.imageURL}" />
				</div>
				<div class="form-group row">
					<Label class="form-input-label"> Start Time: </Label> <input
						type="time" name="startTime" value="${meetup.startTime}" />
				</div>

				<div class="form-group row">
					<Label class="form-input-label"> End Time: </Label> <input
						type="time" name="endTime" value="${meetup.endTime}" />
				</div>
				<div class="form-group row">
					<Label class="form-input-label"> Meetup Date: </Label> <input
						type="date" name="meetupDate" value="${meetup.meetupDate}" />
				</div>

				<%-- <div class="form-group row">
			<Label class="form-input-label"> Street: </Label>
			<input type="text" name="address.street" value= "${meetup.address.street}"/>
		</div>
		
		<div class="form-group row">
			<Label class="form-input-label"> City: </Label>
			<input type="text" name="address.city" value= "${meetup.address.city}"/>
		</div>
		
		<div class="form-group row">
			<Label class="form-input-label"> State (Abbreviation): </Label>
			<input type="text" name="address.stateAbbr" value= "${meetup.address.stateAbbr}"/>
		</div>
		
		<div class="form-group row">
			<Label class="form-input-label"> Postal Code: </Label>
			<input type="text" name="address.postalCode" value= "${meetup.address.postalCode}"/>
		</div>
		 --%>

				<br> <input type="submit" value="Submit Changes">

			</div>
		</form>
	</div>

</body>
</html>