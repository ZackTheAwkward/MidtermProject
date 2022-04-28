<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account</title>


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>



<style>

body {
	font-family: 'Source Sans Pro', sans-serif;
	color: #272829;
}

a {
	color: #149ddd;
	text-decoration: none;
}

a:hover {
	color: #37b3ed;
	text-decoration: none;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Yeseva One', cursive;
}

.col1 {
	padding-top: 50px;
	width: 40%;
	display: inline-block;
	justify-content: center;
	text-align: center;
	margin-left: auto;  
	margin-right: auto;  
	padding-left: 20px;
	padding-right: 20px;
}

.col2 {
	padding-top: 100px; 
	width : 60%;
	display: inline-block;
	padding-left: 100px;
	justify-content: center;
	margin-left: auto;  
	margin-right: auto;  
	padding-left: 20px;
}

input[type="text"] {
    width: 350px;
    
}



/*--------------------------------------------------------- */
</style>
<body>


	<%@ include file="loggedInNavbar.jsp"%>


	<div class="row no-gutters">

		<div class="col1" id="leftSide">
			<img src="${user.photoUrl }" width="200"
				class="user-img rounded-circle mr-2"> <br>
			<h4>${user.username } - ${user.firstName}</h4>
			<p>${user.bio }</p>



		</div>

		<div class="col2" id="rightSide">
		
		<h4>Update Your Account</h4>


			<label for="firstName">First Name</label> <input type="text"
				class="bg-light form-control" placeholder="${user.firstName}">

			<label for="lastName">Last Name</label> <input type="text"
				class="bg-light form-control" placeholder="${user.lastName}">

			<label for="email">Username</label> <input type="text"
				class="bg-light form-control" placeholder="${user.username}">

			<label for="photoUrl">Profile Picture URL:</label> <input type="text"
				class="bg-light form-control" placeholder="${user.photoUrl}">

			<%-- 	<form action="sendToViewRecipes.do">
					<input type="submit" value="View Your Recipes"
						class="bg-light form-control"> <input type="hidden"
						name="id" value="${user.id }" />
				</form>
				<form action="sendToViewMeetups.do">
					<input type="submit" value="View Your Meetups"
						class="bg-light form-control"> <input type="hidden"
						name="id" value="${user.id }" />
				</form> --%>

			<form action="account.do">
				<input type="submit" class="btn btn-primary mr-3"
					value="Save Changes">
			</form>



			<form action="welcome.do">
				<button class="btn border button">Cancel</button>
			</form>

			<form action="deactivateUser.do">
				<input type="submit" value="Deactivate Account"> <input type="hidden"
					name="id" value="${user.id }" />
			</form>



		</div>
	</div>











</body>
</html>