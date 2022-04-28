<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Share A Recipe</title>
</head>
<body>
<%@ include file="loggedInNavbar.jsp" %>


<div>

<form action="addIngredients.do" method="POST">

<input class="form-control-sm" type="text" name="name" placeholder="Name Your Recipe"/>
	<br>

<input class="form-control-sm" type="text" name="description" placeholder="Tell us about it: "/>
	<br>
	
<input class="form-control-sm" type="text" name="servingSize" placeholder="How many people does this serve? "/>
	<br>

<p>Enter Recipe Ingredients</p>






</form>
</div>


</body>
</html>