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
	font-family: 'Cormorant Garamond', serif;
}

.col1 {
	margin-top: 50px;
	padding-top: 50px;
	margin-right: 75px;
	margin-left: 150px;
	width: 500px;
	display: inline-block;
	justify-content: center;
	text-align: center;
	background-color: #fec89a;
	border-radius: 3%;
}

.col2 {
	margin-top: 50px;
	padding-top: 40px;
	padding-bottom: 40px;
	margin-right: 150px;
	width: 500px;
	display: inline-block;
	justify-content: center;
	background-color: white;
	padding-left: 20px;
	padding-right: 20px;
	border-radius: 3%;
}

}
input[type="text"] {
	width: 350px;
	padding-top: 0px;
}

.outer {
padding-top: 10px;
	width: 200px;
	text-align: center;
}

.inner {
	display: inline-block;
}

/*--------------------------------------------------------- */
</style>
<body>


	<%@ include file="loggedInNavbar.jsp"%>


	<div class="row no-gutters">

		<div class="col1" id="leftSide">
			<img src="${user.photoUrl }" width="200"
				class="user-img rounded-circle mr-2"> <br>
			<h4>${user.username }-${user.firstName}</h4>
			<p>${user.bio }</p>

<br>

		<form action="deactivateUser.do">
			<input type="submit" value="Deactivate Account"> <input
				type="hidden" name="id" value="${user.id }" />
		</form>

		</div>

		<div class="col2" id="rightSide">

			<h3>Update Account</h3>

			<form action="updateAccount.do" method="POST">
			<input type="hidden" name="id" value="${user.id }" />
			<label for="firstName"></label> <input type="text" name="firstName" class="bg-light form-control" placeholder="First Name: ${user.firstName}"> 
			<label for="lastName"></label> <input type="text" name="lastName" class="bg-light form-control" placeholder="Last Name: ${user.lastName}"> 
			<label for="email"></label> <input type="text" name="username" class="bg-light form-control" placeholder="User Name: ${user.username}"> 
			<label for="lastName" ></label> <input type="text"class="bg-light form-control" name="lastName" placeholder="Last Name: ${user.lastName}"> 
			<label for="email"></label> <input type="text" name="userName" class="bg-light form-control" placeholder="User Name: ${user.username}"> 
			<label for="photoUrl"></label> <input type="text" name ="photoUrl" class="bg-light form-control" placeholder="User Photo Url: ${user.photoUrl}"> <br>


							<input type="submit" class="btn btn-primary mr-3"
								value="Save Changes">
						</form>
					<div class="inner">

					</div>
						<br>
						<br>
						
					<div class="inner">
				<form action="welcome.do">
							<input type="submit" class="btn btn-primary mr-3" value="Cancel">
						</form>

					</div>
				</div>


			</div>







</body>
</html>