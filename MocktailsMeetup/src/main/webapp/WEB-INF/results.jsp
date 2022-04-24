<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mocktail Results</title>
</head>
<body>

	<h1>RESULTS PAGE</h1>

	${DEBUG}

	<c:choose>

		<c:when test="${! empty recipe}">

			<ul>

				<h3>${recipe.id}Drink Name ${recipe.name}</h3>

				<li>Description: ${recipe.description}</li>
			

			<!-- 	option to update or delete -->


			</ul>
		</c:when>


		<c:when test="${! empty recipes}">


			<br>
			<br>
			<h3 id="tableHead">RECIPE SEARCH RESULTS </h3>
			<br>
			<br>
			<form action="search.do" method="GET">
				Find another: <input type="text" name="keyword"
					placeholder="Enter Keyword" /> <input type="submit" value="Search" />
			</form>
			<br>

			<table class="table table-striped">
				<thead class="table-light">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Description</th>
					
						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="r" items="${recipes}">
						<tr>
							<td>${r.id}</td>
							<td><a href="showDrink.do?pid=${r.id}">${r.name}</a></td>
							<td>${r.description}
							<td>
								
								<!-- Insert a way to update or delete here??  -->
								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- </main> -->
		</c:when>



		<c:otherwise>
			<p>No Drink found!</p>
		</c:otherwise>


	</c:choose>
</body>
</html>
