<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>

<%@ include file="mainNavBar.jsp" %>

<br>
<br>
<br>
<br>
<br>
<div>
<h1>Login Page Make Me Pretty</h1>

<form action="login.do" method="POST">
	<input type="text" name="username">
	<input type="password" name="password"/>
	<input type="submit" value="Log In" > 
</form>

</div>



<a href="signUp.do">Sign Up</a>




</body>
</html>