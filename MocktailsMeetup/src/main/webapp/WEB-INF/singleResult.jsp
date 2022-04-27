<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mocktail Results</title>

<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&family=Yeseva+One&display=swap"
	rel="stylesheet">

</head>



<style>


.btn, .btn-info {
	background-color: black;
	border: 0px;
	border-color: black;
	margin-top: 3px;
	
	
}

.btn:hover {
	background-color: green;
}


body {
	background-color: #eee;
	font-family: 'Source Sans Pro', sans-serif;
}

.navbar-nav>li {
	padding-left: 30px;
	padding-right: 30px;
}

.h4 {
	font-family: 'Cormorant Garamond', serif;
	font-size: 25px;
	font-weight: 200;
	margin: 10px 0;
}

/* .card-container {
	background: #FAF7F2;
	background-image:
		url(https://s3.postimg.org/s1n3ji1ur/paper_fibers_2_X.png);
	box-sizing: border-box;
	font-family: 'Lato', sans-serif;
	font-size: 14px;
	font-weight: 400;
}

*, *:before, *:after {
	box-sizing: inherit;
}

.u-clearfix:before, .u-clearfix:after {
	content: " ";
	display: table;
}

.u-clearfix:after {
	clear: both;
}

.u-clearfix {
	*zoom: 1;
}

.subtle {
	color: #aaa;
}

.card-container {
	margin: 25px auto 0;
	position: relative;
	width: 692px;
}

.card {
	background-color: #fff;
	padding: 30px;
	position: relative;
	box-shadow: 0 0 5px rgba(75, 75, 75, .07);
	z-index: 1;
	display: inline-block;
}

.card-body {
	display: inline-block;
	float: left;
	width: 350px;
}

.card-number {
	margin-top: 15px;
}

.card-circle {
	border: 1px solid #aaa;
	border-radius: 50%;
	display: inline-block;
	line-height: 22px;
	font-size: 12px;
	height: 25px;
	text-align: center;
	width: 25px;
}

.card-author {
	display: block;
	font-size: 12px;
	letter-spacing: .5px;
	margin: 15px 0 0;
	text-transform: uppercase;
}

.card-title {
	font-family: 'Cormorant Garamond', serif;
	font-size: 50px;
	font-weight: 300;
	line-height: 60px;
	margin: 10px 0;
}

.card-description {
	display: inline-block;
	font-weight: 300;
	line-height: 22px;
	margin: 10px 0;
}

.card-read {
	font-size: 14px;
	font-weight: 700;
	letter-spacing: 6px;
	margin: 5px 0 20px;
	position: relative;
	text-align: right;
	text-transform: uppercase;
}

.card-read:after {
	background-color: #b8bddd;
	content: "";
	display: block;
	height: 1px;
	position: absolute;
	top: 9px;
	width: 75%;
}

.card-tag {
	float: right;
	margin: 5px 0 0;
}

.card-media {
	float: right;
}

.card-shadow {
	background-color: #fff;
	box-shadow: 0 2px 25px 2px rgba(0, 0, 0, 1), 0 2px 50px 2px
		rgba(0, 0, 0, 1), 0 0 100px 3px rgba(0, 0, 0, .25);
	height: 1px;
	margin: -1px auto 0;
	width: 80%;
	z-index: -1;
} */

.commentcard {
    border: 2px;
    background-color: white;
    box-shadow: 5px 6px 6px 2px #e9ecef;
    border-radius: 4px
}

.dots {
    height: 4px;
    width: 4px;
    margin-bottom: 2px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block
}

.badge {
    padding: 7px;
    padding-right: 9px;
    padding-left: 16px;
    box-shadow: 5px 6px 6px 2px #e9ecef
}

.user-img {
    margin-top: 4px
}

.check-icon {
    font-size: 17px;
    color: #c3bfbf;
    top: 1px;
    position: relative;
    margin-left: 3px
}

.form-check-input {
    margin-top: 6px;
    margin-left: -24px !important;
    cursor: pointer
}

.form-check-input:focus {
    box-shadow: none
}

.icons i {
    margin-left: 8px
}

.reply {
    margin-left: 12px
}

.reply small {
    color: #b7b4b4
}

.reply small:hover {
    color: green;
    cursor: pointer
}


.form-control-sm {
height: 200px;
width: 300px;

}

#commentForm {
padding-left: 100px;
display: inline-block;

 }
 
 .container {
display: inline-block;
 }
 
 ul, li {
 
list-style-type: none;
 
 }
 
 
 
 




</style>
<body>

	<%@ include file="recipeStyle.jsp"%>
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
         <!--  <div class="card-read">Sip</div> -->
         
         
         <div class="container">
      <a href="#instructions" class="btn btn-info" data-toggle="collapse">Make This</a>
      <div id="instructions" class="collapse">
       
       	<br>
	
	<h4>Instructions & Ingredients</h4>
       
        <c:forEach var="rc" items="${recipe.ingredients }">

	<li>${rc.quantity} ${rc.unit } ${rc.ingredient.name } </li>
	
	
	</c:forEach>
	

	<table>
		<thead>
			<tr>
				<th>Quanity</th>
				<th>Unit</th>
				<th>Ingredient Name</th>
			</tr>
		</thead>
		<tbody>
		 <c:forEach var="rc" items="${recipe.ingredients }">
				<tr>
					<td>${rc.quantity}</td>
						<td>${rc.unit }</td>
						<td>${rc.ingredient.name }</td>
				
					
				</tr>
			</c:forEach>
		<tr>${recipe.instructions } </tr>
		</tbody>
	</table>
	
      </div>
    	</div>
    	<br>
    <div class="container">
      <a href="#comments" class="btn btn-info" data-toggle="collapse">Comments</a>
      <div id="comments" class="collapse">
        
<!--------------------- COMMENT FORM  ------------------------------->
        	
        	<div id="commentForm">
        	  <form action="createComment.do" method="POST">
	  

	

	<input id="id" type="hidden" name="recipeId" value="${recipe.id}"/>
	
	
	<input class="form-control-sm" type="text" name="comment" placeholder="Comment"/>
	<br>
	
	<input type ="submit" value="sumbit"/>
	</form>
	
	</div>
  
<!-- ------------------ DISPLAY COMMENTS  ------------------------------->
  <c:forEach var="rc" items="${recipe.comments }">

<%-- <li>${rc.user.username }</li>
<li>${rc.comment }</li>
 --%>
  
   <div class="container mt-5">
    <div class="row d-flex justify-content-center">
        <div class="col-md-8">
            <div class="headings d-flex justify-content-between align-items-center mb-3">
          
            </div>
            <div class="commentcard p-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="user d-flex flex-row align-items-center" > <img src="${user.photoUrl }" width="30" class="user-img rounded-circle mr-2">
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
         
         
         
        </div>
        <img src="${recipe.imageUrl}" width="280" height="auto"/>
          <!--  <img src="https://live.staticflickr.com/65535/52029488110_21911d2ec2_o.png" width="280" height="auto" class="card-media" /> -->
        <img src=""/>
      </div>
      <div class="card-shadow"></div>
</div>

    

 <div> 
 <br>
 <br>
 <br>
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
