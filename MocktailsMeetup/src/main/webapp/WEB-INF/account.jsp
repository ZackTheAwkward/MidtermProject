<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account</title>
</head>
<body>


<%@ include file="loggedInNavbar.jsp" %>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<h2>Hey ${user.username} !</h2>

<p>Thank you for sippin' with us!</p>

<form action="update.do">
<input type= "submit" value= "Update Account">
<input type= "hidden" name= "id" value = "${user.id }"/></form>

	<div class ="container">
	<div class = "row">
	<div class = "col">
	<table class ="table .table-striped">
		<thead>
			<tr>
				<th>Menu Item:</th>
				<th>Name:</th>
				<th>Size In Ounces:</th>
				<th>Cost:</th>
			</tr>
		</thead>
		<tbody style = background-color:#f6e7cb >
			<c:forEach var="c" items="${user.}">
				<tr>
					<td>${c.id}</td>
					<td>${c.name}</td>
					<td>${c.sizeInOunces}</td>
					<td>${c.cost}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	</div>

</body>
</html>