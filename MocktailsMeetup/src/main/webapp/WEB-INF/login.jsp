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

<h1>Welcome to Sip n' Social</h1>
<h3>Let's get you signed in"</h3>

<form action="login.do" method="POST">
	<input type="text" name="username">
	<input type="password" name="password"/>
	<input type="submit" value="Log In" > 
</form>

</div>



<a href="signUp.do">Sign Up</a>




</body>
</html>