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

<form action="createdRecipe.do" method="POST">

<input class="form-control-sm" type="text" name="name" placeholder="Name Your Recipe"/>
	<br>

<input class="form-control-sm" type="text" name="description" placeholder="Tell us about it: "/>
	<br>
	
<input class="form-control-sm" type="text" name="instructions" placeholder="How do you make it? : "/>
	<br>
	
<input class="form-control-sm" type="text" name="servingSize" placeholder="How many people does this serve? "/>
	<br>
	
	
	
	
<input type= "submit" value= "Thank you for sharing a new sip!"/>

</form>



</div>


</body>
</html>