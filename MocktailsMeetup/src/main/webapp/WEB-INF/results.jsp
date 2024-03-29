<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mocktail Results</title>
</head>
<style>
.container {
	
	padding-top: 100px;
}
</style>
<body>


		<c:if test="${user != null}">
			<%@ include file="loggedInNavbar.jsp"%>
		</c:if>

		<c:if test="${user == null}">
			<%@ include file="mainNavBar.jsp"%>
		</c:if>


	<div class=container>

		<c:choose>

			<c:when test="${! empty recipeMatch}">

				<h1>Results Matching Your Search:</h1>
				<table>
					<thead>
						<tr>
							<!-- <th>Menu Item:</th>
				<th>Name:</th>
				<th>Recipe</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${recipeMatch}">
							<tr>
								<td>${c.id}</td>
								<td>${c.name}</td>
								<td>
									<form action="getRecipe.do">
										<input type="submit" value="Make This Drink"> <input
											type="hidden" name="id" value="${c.id }" />
									</form>
								</td>


							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>

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
	</div>

</body>
</html>
