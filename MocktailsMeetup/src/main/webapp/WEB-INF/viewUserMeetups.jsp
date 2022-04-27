<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Created Meetups</title>
</head>
<body>
<%@ include file="loggedInNavbar.jsp" %>


	<div class ="container">
	<div class = "row">
	<div class = "col">
	<table class ="table .table-striped">
		<thead>
			<tr>
				<th>Meetup ID:</th>
				<th>Title:</th>
				<th>Description:</th>
			</tr>
		</thead>
		<tbody >
			<c:forEach var="m" items="${userMeetups}">
				<tr>
					<td>${m.id}</td>
					<td>${m.title}</td>
					<td><form action="updateMeetup.do" method="POST">
					<input type= "submit" value= "Update Meetup">
					<input type="hidden" name="id" value="${m.id }" /></form></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	</div>
	</div>
	</div>

</body>
</html>