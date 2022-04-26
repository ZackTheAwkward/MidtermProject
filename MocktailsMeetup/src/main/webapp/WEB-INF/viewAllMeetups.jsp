<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meetups</title>
</head>
<body>
	<%@ include file="loggedInNavbar.jsp"%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div class="main">
		<h3>Meetups happening near you</h3>
		<table class="table table-borderless">
			<thead>
				<tr>
					<th>ID</th>
					<th>Meetup Name</th>
					<th>Meetup Address</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${meetup}">
					<tr>
						<td>${m.id}</td>
						<td><a href="getMeetups.do?Id=${m.id}">${m.title}</a></td>
						<td>${m.address}</td>
					</tr>
				</c:forEach>



			</tbody>
		</table>

	</div>


</body>
</html>