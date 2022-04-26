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
        <img src="${recipe.imageUrl}" width="280" height="auto"/>
          <!--  <img src="https://live.staticflickr.com/65535/52029488110_21911d2ec2_o.png" width="280" height="auto" class="card-media" /> -->
        <img src=""/>
      </div>
      <div class="card-shadow"></div>
    </div>

    <div class="container">
      <a href="#instructions" class="btn btn-info" data-toggle="collapse">Recipe & Instructions</a>
      <div id="instructions" class="collapse">
        <br>
        <br>
        <br>
        <c:forEach var="rc" items="${recipe.ingredients }">

	<li>${rc.quantity} ${rc.unit } ${rc.ingredient.name } </li>
	
	
	</c:forEach>
	
	${recipe.instructions }
      </div>
    	</div>
    	
    <div class="container">
      <a href="#comments" class="btn btn-info" data-toggle="collapse">Comments</a>
      <div id="comments" class="collapse">
        <br>
        <br>
        <br>
        
<!--------------------- COMMENT FORM  ------------------------------->
        	  <form action="createComment.do" method="POST">
	  

	

	<input id="id" type="hidden" name="recipeId" value="${recipe.id}"/>
	
	
	<input class="form-control-sm" type="text" name="comment" placeholder="Comment"/>
	<br>
	
	<input type ="submit" value="sumbit"/>
	</form>
  
<!-- ------------------ DISPLAY COMMENTS  ------------------------------->
  <c:forEach var="rc" items="${recipe.comments }">

<%-- <li>${rc.user.username }</li>
<li>${rc.comment }</li>
 --%>
  
   <div class="container mt-5">
    <div class="row d-flex justify-content-center">
        <div class="col-md-8">
            <div class="headings d-flex justify-content-between align-items-center mb-3">
                <h5>Comments </h5>
          
            </div>
            <div class="commentcard p-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="user d-flex flex-row align-items-center"> <img src="${user.photoUrl }" width="30" class="user-img rounded-circle mr-2">
                     <span><small class="font-weight-bold text-primary">${rc.user.username }</small> <small class="font-weight-bold">${rc.comment }</small></span> 
                     </div>
                </div>
                
            </div>
        </div>
    </div>
      </div>
      
      </c:forEach>
      </div>
    	</div>

 





	<%--   <form action="createComment.do" method="POST">
	  

	
	<!-- recipe is recipe_id in the RecipeComment entity  -->

	<input id="id" type="hidden" name="recipeId" value="${recipe.id}"/>
	
	
	<input class="form-control-sm" type="text" name="comment" placeholder="Comment"/>
	<br>
	
	<input type ="submit" value="sumbit"/>
	</form> --%>

	












</body>
</html>
