<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account</title>
</head>
<body>


<%@ include file="loggedInNavbar.jsp" %>

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

<div class="container-fluid">
<h2>Hey ${user.username} !</h2>

<p>Thank you for sippin' with us!</p>

<form action="update.do">
<input type= "submit" value= "Update Account">
<input type= "hidden" name= "id" value = "${user.id }"/></form>

<form action="sendToViewRecipes.do">
<input type= "submit" value= "View Your Recipes">
<input type= "hidden" name= "id" value = "${user.id }"/></form>

</div>

</body>
</html>