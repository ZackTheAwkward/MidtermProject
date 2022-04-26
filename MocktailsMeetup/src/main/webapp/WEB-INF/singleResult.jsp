<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mocktail Results</title>
</head>
<body>

	<%@ include file="mainNavBar.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1></h1>

<ul>
<li>${recipe.id}</li>
<li>${recipe.name}</li>
<li>${recipe.servingSize }</li>
<li> </li>
</ul>


<c:forEach var="rc" items="${recipe.comments }">

<li>${rc.user.username }</li>
<li>${rc.comment }</li>
</c:forEach>


</body>
</html>
