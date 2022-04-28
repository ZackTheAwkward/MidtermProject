<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome ${user.username}</title>
<link rel="stylesheet"
	href=https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400>
<link rel="stylesheet"
	href=https://fonts.googleapis.com/css?family=Playfair+Display>
</head>
<style>
body {
	font-family: 'Source Sans Pro', sans-serif;
}

.container {
	max-width: 1000px;
	margin-left: auto;
	margin-right: auto;
	padding-left: 10px;
	padding-right: 10px;
}

h2 {
	font-size: 32px;
	margin: 20px 0;
	text-align: center;
	small
}
.responsive-table {li { border-radius:3px;
	padding: 25px 30px;
	display: flex;
	justify-content: space-between;
	margin-bottom: 25px;
}

.table-header {
	background-color: #95A5A6;
	font-size: 14px;
	text-transform: uppercase;
	letter-spacing: 0.03em;
}

.table-row {
	background-color: #ffffff;
	box-shadow: 0px 0px 9px 0px rgba(0, 0, 0, 0.1);
}







</style>
<body>


	<%@ include file="loggedInNavbar.jsp"%>

	<h1>Welcome ${user.username}</h1>


	<h2>
		<a href="addMeet.do">Create a Meetup</a>
	</h2>

	<div>
		<form action="surpriseMe.do">
			<input type="submit" value="I'm Feeling Adventrous"
				class="bg-light form-control">
			<%-- <input type="hidden"
						name="id" value="${user.id }" --%>
		</form>
	</div>




	<div>
		<form action="newRecipe.do">
			<input type="submit" value="Share A Recipe" class="ShareRec" />
		</form>
	</div>



	<!-- <div class="main">
		<h3>Upcoming Meetups happening near you</h3> -->
	<div class="container">
		<h3>Meetups Near You</h3>
		<table class="table table-borderless">
			<thead class="table-header">
				<tr class="table-row">
					<th>ID</th>
					<th>Meetup Name</th>
					<th>Meetup Date</th>
					<th>Meetup Address</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${meetup}">
					<tr class="table-row">
						<td>${m.id}</td>
						<td><a href="getMeetups.do?Id=${m.id}">${m.title}</a></td>						
						<td>${m.meetupDate}</td>
						<td>${m.address}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
			</div>
			<%-- <tr>
					<th>ID</th>
					<th>Meetup Name</th>
					<th>Meetup Date</th>					
					<th>Meetup Address</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${meetup}">
					<tr>
						<td>${m.id}</td>
						<td><a href="getMeetups.do?Id=${m.id}">${m.title}</a></td>						
						<td>${m.meetupDate}</td>
						<td>${m.address}</td>
					</tr>
				</c:forEach>
 --%>
		<!-- 	</tbody>
		</table> -->
<!-- 
	</div> -->





</body>
</html>