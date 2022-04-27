<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update your Meetup</title>
</head>
<body>
<%@ include file="loggedInNavbar.jsp" %>

	
	<div class="container-fluid">
	<form action="updatedMeetup.do" method="POST">
		<input type="hidden" name="id" value="${meetup.id }" />

		<div class="form-group row">
			<Label class="form-input-label"> Meetup Title: </Label>
			<input type="text" name="title" value= "${meetup.title}"/>
		</div>
		
		<div class="form-group row">
			<Label class="form-input-label"> Description: </Label>
			<input type="text" name="description" value= "${meetup.description}"/>
		</div>
		
		<div class="form-group row">
			<Label class="form-input-label"> Start Time: </Label>
			<input type="time" name="startTime" value= "${meetup.startTime}"/>
		</div>
		
		<div class="form-group row">
			<Label class="form-input-label"> End Time: </Label>
			<input type="time" name="endTime" value= "${meetup.endTime}"/>
		</div>
		
		<div class="form-group row">
			<Label class="form-input-label"> Max Attendees: </Label>
			<input type="text" name="maxAttendees" value= "${meetup.maxAttendees}"/>
		</div>
		
		<div class="form-group row">
			<Label class="form-input-label"> Meetup Date: </Label>
			<input type="date" name="meetupDate" value= "${meetup.meetupDate}"/>
		</div>
		
		<div class="form-group row">
			<Label class="form-input-label"> Image URL: </Label>
			<input type="text" name="imageURL" value= "${meetup.imageURL}"/>
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
		
		
		</form>
</div>

</body>
</html>