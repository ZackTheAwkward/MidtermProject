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

<%-- <ul>
<li>${recipe.id}</li>
<li>${recipe.name}</li>
<li>${recipe.servingSize }</li>
<li> </li>
</ul> --%>

  <div class="card-container">
      <div class="card u-clearfix">
        <div class="card-body">

          <!-- recipe number?  -->
          <span class="card-number card-circle subtle">${recipe.id}</span>
          <!-- Author or User  -->
          <span class="card-author subtle">Sip n Social</span>
          <!-- Name of Recipe  -->
          <h2 class="card-title">${recipe.name}</h2>
          <!-- Description -->
          <span class="card-description subtle">${recipe.description }</span>
          <!-- Expands card out -->
          <div class="card-read">Sip</div>
        </div>
           <img src="https://live.staticflickr.com/65535/52029488110_21911d2ec2_o.png" width="280" height="auto" class="card-media" />
        <img src=""/>
      </div>
      <div class="card-shadow"></div>
    </div>

<!-- ------------------ DISPLAY COMMENTS  ------------------------------->


<c:forEach var="rc" items="${recipe.comments }">

<li>${rc.user.username }</li>
<li>${rc.comment }</li>
</c:forEach>


<!--------------------- COMMENT FORM  ------------------------------->

	  <form action="createComment.do" method="POST">
	  

	
	<!-- recipe is recipe_id in the RecipeComment entity  -->

	<input id="id" type="hidden" name="recipeId" value="${recipe.id}"/>
	
	
	<input class="form-control-sm" type="text" name="comment" placeholder="Comment"/>
	<br>
	
	<input type ="submit" value="sumbit"/>
	</form>

	












</body>
</html>
