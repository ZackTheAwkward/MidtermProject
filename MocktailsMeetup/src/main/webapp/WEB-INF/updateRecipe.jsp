<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style> 



body {
	width: 1400px;
	height: auto;
	background:
		url("https://live.staticflickr.com/65535/52036697737_a915f6e938_h.jpg")
		center center;
	background-size: cover;
	margin-top: 120px;

}
.container input[type="text"] {
	width: 500px;
	
}

.container {
	margin-top: 100px;
	margin-bottom: 100px;
	background-color: white;
	height: 400px;
	width: 550px !important;
	border-radius: 3%;
	padding-right: 25px !important;
	padding-left: 25px !important;
}


input {

text-align: center;
}

h1 {
	text-align: center;
	padding-top: 30px;
	font-family: 'Playfair Display', serif;
  	color: #black;
  	size: 25px;
}

</style>
<body>
<%@ include file="loggedInNavbar.jsp" %>

<div class="container">
		<h1>Update Recipe</h1>


	<form action="updateRecipe.do" method="POST">
		<input type="hidden" name="id" value="${recipe.id }" />

		<div class="form-group row">
			<Label class="form-input-label"> </Label>
			<input type="text" name="name" value= "${recipe.name}"/>
		</div>
		<div class="form-group row">
			<Label class="form-input-label"></Label>
			<input type="text" name="description" value= "${recipe.description}"/>
		</div>
		<div class="form-group row">
			<Label class="form-input-label"> </Label>
			<input type="text" name="instructions" value= "${recipe.instructions}"/>
		</div>
		<div class="form-group row">
			<Label class="form-input-label"></Label>
			<input type="text" name="imageUrl" />
		</div>
		
		<br> <input type="submit" value="Submit Changes">
		
		
		</form>
</div>

</body>
</html>