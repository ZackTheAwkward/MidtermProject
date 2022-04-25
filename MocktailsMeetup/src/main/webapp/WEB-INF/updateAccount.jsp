<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Account Info</title>
</head>
<body>
	<%@ include file="loggedInNavbar.jsp"%>
	
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
	
	<form action="updateAccount.do" method="POST">
		<input type="hidden" name="id" value="${user.id }" />

		<div class="form-group row">
			<Label class="form-input-label"> Username: </Label>
			<input type="text" name="username" value= "${user.username}"/>
		</div>
		<div class="form-group row">
			<Label class="form-input-label"> First Name: </Label>
			<input type="text" name="firstName" value= "${user.firstName}"/>
		</div>
		<div class="form-group row">
			<Label class="form-input-label"> Last Name: </Label>
			<input type="text" name="lastName" value= "${user.lastName}"/>
		</div>
		<div class="form-group row">
			<Label class="form-input-label"> Profile Picture: </Label>
			<input type="text" name="photoUrl" value= "${user.photoUrl}"/>
		</div>
		
		<br> <input type="submit" value="Submit Changes">
		
		
		</form>
</body>
</html>