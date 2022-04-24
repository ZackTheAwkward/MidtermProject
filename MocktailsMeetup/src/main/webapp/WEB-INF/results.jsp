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


	<c:choose>

		<c:when test="${! empty recipe}">

			<ul>

				<h3>${recipe.id}Category Name: ${recipe.name}</h3>

				<li>Description: ${recipe.description}</li>
			

			<!-- 	option to update or delete -->


			</ul>
		</c:when>


		<c:when test="${! empty drinkMatch}">

			<br>
			<br>
			<h3 id="tableHead">DRINK SEARCH RESULTS </h3>
			<br>
			<br>
			<!-- <form action="search.do" method="GET">
				Find another: <input type="text" name="keyword"
					placeholder="Enter Keyword" /> <input type="submit" value="Search" />
			</form> -->
			<br>
			
			<h2>These are the menu items that match your search:</h2>
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
			
			
<%-- 
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
			<!-- </main> --> --%>
		</c:when>

	<c:when test="${! empty categoryMatch}">
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
