<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>


<%@ include file="bootstrap.jsp" %>

<h1>Sign Up </h1>


<form action="createAccount.do" method="POST">



<label for="userName">User Name: </label><input type="text" name="userName" required>  <br>
<label for="Password">Password: </label><input type="password" name="password" required> <br>
<label for="firstName">First Name: </label><input type="text" name="firstName" required><br>
<label for="lastName">Last Name: </label><input type="text" name="lastName" required><br>
<label for="email">Email: </label><input type="text" name="email" required><br>
	
	
	<input type="submit" value="Sign Up" > 
</form>


</body>
</html>