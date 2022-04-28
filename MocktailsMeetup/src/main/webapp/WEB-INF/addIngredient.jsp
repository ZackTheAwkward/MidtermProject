<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Ingredients to your recipe</title>
</head>
<body>



<%@ include file="loggedInNavbar.jsp" %>


<div>

<form action="addIngredients.do" method="POST">

<p>Enter Recipe Ingredients</p>

<input class="form-control-sm" type="text" name="recipe.ingredients.quantity" placeholder="Ingredient Quantity "/>
	<br>
	
<input class="form-control-sm" type="text" name="recipe.ingredients.unit" placeholder="Ingredient Unit "/>
	<br>
	
<input class="form-control-sm" type="text" name="recipe.ingredients.ingredient" placeholder="Ingredient "/>
	<br>



<input type= "submit" value= "Thank you for sharing a new sip!"/>

</form>
</div>


</body>
</html>