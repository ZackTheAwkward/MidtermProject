<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="loggedInNavbar.jsp" %>

	
	<div class="container-fluid">
	<form action="updateRecipe.do" method="POST">
		<input type="hidden" name="id" value="${recipe.id }" />

		<div class="form-group row">
			<Label class="form-input-label"> Recipe Name: </Label>
			<input type="text" name="name" value= "${recipe.name}"/>
		</div>
		<div class="form-group row">
			<Label class="form-input-label"> Description: </Label>
			<input type="text" name="description" value= "${recipe.description}"/>
		</div>
		<div class="form-group row">
			<Label class="form-input-label"> Instructions: </Label>
			<input type="text" name="instructions" value= "${recipe.instructions}"/>
		</div>
		<div class="form-group row">
			<Label class="form-input-label">  Picture: </Label>
			<input type="text" name="imageUrl" />
		</div>
		
		<br> <input type="submit" value="Submit Changes">
		
		
		</form>
</div>

</body>
</html>