<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Shared Recipes</title>
</head>
<body>
	<%@ include file="loggedInNavbar.jsp"%>



	<div class="container">
		<div class="row">
			<div class="col">
				<table class="table .table-striped">
					<thead>
						<tr>
							<th>Recipe Id:</th>
							<th>Name:</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach var="c" items="${userCreated}">
							<c:if test="${c.active == true}">
							<tr>
								<td>${c.id}</td>
								<td>${c.name}</td>
								<td><form action="updateR.do" method="POST">
										<input type="submit" value="Update Recipe"> <input
											type="hidden" name="id" value="${c.id }" />
									</form></td>
								<td><form action="deleteRecipe.do" method="POST">
										<input type="submit" value="Deactivate Recipe"> <input
											type="hidden" name="id" value="${c.id }" />
									</form></td>
							</tr>

							</c:if>
						</c:forEach>



					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>