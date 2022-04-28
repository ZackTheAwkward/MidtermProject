<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create a Meetup</title>
</head>



<style>

.container input[type="text"] {
width: 400px !important;

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

h1 {
text-align: center;}

</style>

<body>
	<%@ include file="loggedInNavbar.jsp"%>
	
	
	<div class="container">
	<h1>Post a Meetup</h1>

	<form action="createdMeetup.do" method="POST" style="margin: auto; width: 500px;">
	<div class="table">
	<input class="form-control-sm" type="text" name="title" placeholder="Title"/>
	<br>
	
	<input class="form-control-sm" type="text" name="description" placeholder="Description"/>
	<br>
	
	<input class="form-control-sm" type="time" name="startTime" placeholder="Start Time"/>
	<br>
	
	<input class="form-control-sm" type="time" name="endTime" placeholder="End Time"/>
	<br>
	
	<input class="form-control-sm" type="text" name="maxAttendees" placeholder="Max Attendees"/>
	<br>
	
	<input class="form-control-sm" type="date" name="meetupDate" placeholder="Meetup Date"/>
	<br>
	
	<input class="form-control-sm" type="text" name="imageURL" placeholder="Image URL"/>
	<br>



	<input class="form-control-sm" type="text" name="address.street" placeholder="Street"/>
	<br>
	
	<input class="form-control-sm" type="text" name="address.city" placeholder="City"/>
	<br>
	
	<input class="form-control-sm" type="text" name="address.stateAbbr" maxlength = "2" placeholder="State Abbreviation"/>
	<br>

	<input class="form-control-sm" type="text" name="address.postalCode" placeholder="Postal Code"/>
	
	
	
	<input type ="submit" value="sumbit"/>
	</div>
	</form>
	</div>









</body>
</html>