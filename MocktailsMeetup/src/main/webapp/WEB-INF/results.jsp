<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mocktail Results</title>
</head>
<body>
<%@ include file="bootstrap.jsp" %>
	<h1>Results Matching Your Search: </h1>


	<c:choose>

		<c:when test="${! empty drinkMatch}">

			<br>
			<br>
			
			<br>
			<br>
			
			<h2>Matched by Drink Name:</h2>
	<table>
		<thead>
			<tr>
				<th>Menu Item:</th>
				<th>Name:</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${drinkMatch}">
				<tr>
					<td>${c.id}</td>
					<td>${c.name}</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
		</c:when>

	<c:when test="${! empty categoryMatch}">
	
	<h2>Matched by Category:</h2>
		<table>
		<thead>
			<tr>
				<th>Menu Item:</th>
				<th>Name:</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${categoryMatch}">
				<tr>
					<td>${c.id}</td>
					<td>${c.name}</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	</c:when>

		<c:otherwise>
			<p>No Drink found!</p>
		</c:otherwise>


	</c:choose>
</body>
</html>
