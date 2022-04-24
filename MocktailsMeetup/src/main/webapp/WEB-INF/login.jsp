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

<%@ include file="bootstrap.jsp" %>

<h1>Login Page Make Me Pretty</h1>

<form action="login.do" method="POST">
	<%-- Error messages --%>
	<input type="text" name="userName">
	<input type="password" name="password"/>
	<input type="submit" value="Log In" > 
</form>




</body>
</html>