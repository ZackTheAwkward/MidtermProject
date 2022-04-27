<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account</title>
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Poppins', sans-serif;
	background-color: aliceblue;
}

.wrapper {
	padding: 30px 50px;
	border: 1px solid #ddd;
	border-radius: 15px;
	margin: 10px auto;
	max-width: 600px;
}

h4 {
	letter-spacing: -1px;
	font-weight: 400;
}

label {
	margin-bottom: 0;
	font-size: 14px;
	font-weight: 500;
	color: #777;
	padding-left: 3px;
}

.form-control {
	border-radius: 10px;
	display: inline-block;
}

input[placeholder] {
	font-weight: 500;
}

.form-control:focus {
	box-shadow: none;
	border: 1.5px solid #0779e4;
}

.button {
	background-color: #fff;
	color: #0779e4;
}

.button:hover {
	background-color: #0779e4;
	color: #fff;
}

.btn-primary {
	background-color: #0779e4;
}

.danger {
	background-color: #fff;
	color: #e20404;
	border: 1px solid #ddd;
}

.danger:hover {
	background-color: #e20404;
	color: #fff;
}

#deactivate {
	line-height: 18px;
}

/*--------------------------------------------------------- */


</style>
<body>


	<%@ include file="loggedInNavbar.jsp"%>


	<div class="wrapper bg-white mt-sm-5">
		<h4 class="pb-4 border-bottom">Account settings</h4>
		<div class="d-flex align-items-start py-3 border-bottom">

			<div class="form-group row">
				<Label class="form-input-label"> Profile Picture URL: </Label> <input
					type="text" name="photoUrl" value="${user.photoUrl}" /> 

			</div>
		</div>

		<div class="py-2">
			<div class="row py-2">
				<div class="col-md-6">
					<label for="firstName">First Name</label> <input type="text"
						class="bg-light form-control" placeholder="${user.firstName}">
				</div>
				<div class="col-md-6 pt-md-0 pt-3">
					<label for="lastName">Last Name</label> <input type="text"
						class="bg-light form-control" placeholder="${user.lastName}">
				</div>
			</div>
			<div class="row py-2">
				<div class="col-md-6">
					<label for="email">Username</label> <input type="text"
						class="bg-light form-control" placeholder="${user.username}">
				</div>

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

			</div>
			<div class="row py-2"></div>
			<form action="account.do">
				<input type="submit" class="btn btn-primary mr-3"
					value="Save Changes">
			</form>

			<form action="welcome.do">
				<button class="btn border button">Cancel</button>
			</form>
		</div>

		<div>
			<form action="deactivateUser.do">
				<input type="submit" value="Deactivate Account"
					class="bg-light form-control"> <input type="hidden"
					name="id" value="${user.id }" />
			</form>
		</div>
	</div>


	<div class="user d-flex flex-row align-items-center">
		<img src="${user.photoUrl }" width="75"
			class="user-img rounded-circle mr-2"> <span><small
			class="font-weight-bold text-primary">${rc.user.username }</small> <small
			class="font-weight-bold">${user.bio }</small></span>
	</div>

   



</body>
</html>