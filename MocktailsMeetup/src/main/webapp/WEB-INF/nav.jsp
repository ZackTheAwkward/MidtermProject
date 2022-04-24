<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mocktails Meetup</title>
</head>
<body>


<nav>
	<a href="home.do">Home</a>
	<c:if test="${User != null}">
		<a href="account.do">Account</a>
		<a href="logout.do">Logout</a>
	</c:if>
</nav>


</body>
</html>