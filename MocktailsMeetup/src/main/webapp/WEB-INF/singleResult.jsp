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

<%@ include file="mainNavBar.jsp" %>
	<h1>Results Matching Your Search: </h1>


	<c:choose>
	
		<c:when test="${! empty recipeMatch}">

			<br>
			<br>
			
			<br>
			<br>
			
			<h2>Matched by Recipe Name:</h2>
	<table>
		<thead>
			<tr>
				<th>Menu Item:</th>
				<th>Name:</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${recipeMatch}">
				<tr>
					<td>${c.id}</td>
					<td><a href="getRecipe.do?pid=${c.id}">${c.name}</td>
					
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
