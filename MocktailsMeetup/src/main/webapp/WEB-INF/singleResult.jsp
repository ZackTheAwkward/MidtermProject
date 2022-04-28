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

html {
background-color: #eee;

}
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
html {
  background: #faf7f2;
  background-image: url(https://s3.postimg.org/s1n3ji1ur/paper_fibers_2_X.png);
  box-sizing: border-box;
  font-family: "Lato", sans-serif;
  font-size: 14px;
  font-weight: 400;
}

*,
*:before,
*:after {
  box-sizing: inherit;
}

.u-clearfix:before,
.u-clearfix:after {
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
  width: 800px;
  padding-top: 100px;
  padding-bottom: 1000px;
}

.card {
  background-color: #fff;
  padding: 30px;
  position: relative;
  box-shadow: 0 0 5px rgba(75, 75, 75, 0.07);
  z-index: 1;
}

.card-body {
  display: inline-block;
  float: left;
  width: 300px;
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
  letter-spacing: 0.5px;
  margin: 15px 0 0;
  text-transform: uppercase;
}

.card-title {
  font-family: "Cormorant Garamond", serif;
  font-size: 60px;
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
  cursor: pointer;
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
/*
.card-tag {
  float: right;
  margin: 5px 0 0;
} */

.card-media {
  float: right;
  display: inline-block;
}

.card-shadow {
  background-color: #fff;
  box-shadow: 0 2px 25px 2px rgba(0, 0, 0, 1), 0 2px 50px 2px rgba(0, 0, 0, 1),
    0 0 100px 3px rgba(0, 0, 0, 0.25);
  height: 1px;
  margin: -1px auto 0;
  width: 80%;
  z-index: -1;
}
/* .navbar-nav>li {
	padding-left: 30px;
	padding-right: 30px;
}


.card-container {
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
	width: 1200px;
	
	
	
}

.card {
	background-color: #fff;
	padding: 70px;
	/* position: static; */
	/* box-shadow: 0 0 5px rgba(75, 75, 75, .07); */
	/* z-index: 1; */
/* 	display: inline-block; */
/* } */

.card-body {
	display: inline-block;
	float: left;
	width: 320px;
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
	font-size: 55px;
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

#recipePhoto {
	float: right;
	display: inline-block;
	
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

/* --------------------Instructions & Ingredients Table --------------------------------------*/
.instructionsContainer {
	width: 500px;
}

table {
	width: 500px;
  
}


td, th {
    border: .5px solid black;
    font-family: 'Source Sans Pro', sans-serif;
   

}

th {
	justify-content: center;
	
}

h4 {
	font-family: 'Cormorant Garamond', serif;
	font-size: 25px;
	font-weight: 200;
	margin: 10px 0;
}

#instructons {
padding-top: 20px;
width: 500px;
font-family: 'Source Sans Pro', sans-serif;
font-weight: 200px;
font-size: 18px;

}

/*----------------- Comments ----------------------- */
h3 {
	font-family: 'Cormorant Garamond', serif;
	font-size: 16px;
	font-weight: 200;
}

.commentcard {
	width: 500px;
	font-size: 18px;
	border: 2px;
	background-color: white;
	box-shadow: 5px 6px 6px 2px #e9ecef;
	border-radius: 4px;
	border: 2px;
}

.dots {
	height: 4px;
	width: 4px;
	margin-bottom: 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block
}



.user-img {
	margin-top: 4px
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

.form-control-xl {
	height: 150px !important;
	width: 560px;
	display: inline-block;
	justify-content: center;
}

#commentForm {
	padding-top: 45px;
	display: inline-block;
}

.container {
	display: inline-block;
}

.commentcard {
	width: 200px important!;
	display: inline-block;
	height: auto;
	padding-left: 20px;
}

ul, li {
	list-style-type: none;
}
</style>
<body style= background-color:#eee>


	<c:if test="${user != null}">
       <%@ include file="loggedInNavbar.jsp" %>
	</c:if>
    
  <c:if test="${user == null}">
       <%@ include file="mainNavBar.jsp" %>
   </c:if>
   


<%-- 
	<%@ include file="recipeStyle.jsp"%>
 --%>



    <body>
   
      <div class="card-container">
        <div class="card u-clearfix">
          <div class="row">
          <div class="card-body">
            <div class="col-sm">
            <span class="card-number card-circle subtle">${recipe.id}</span>
            <span class="card-author subtle">Sip n Social</span>
            <h2 class="card-title">${recipe.name}</h2>
            <span class="card-description subtle">${recipe.description }</span>
            <div class="card-read">Sip</div>
            
            <div class="container">
					<a href="#instructions" class="btn btn-info" data-toggle="collapse">Make
						This</a>
					<div id="instructions" class="collapse">

						<br>
						<div id="instructionsContainer">
							<h4>Ingredients</h4>

							<table>
								<thead>
									<tr>
										<th>Qty</th>
										<th>Unit</th>
										<th>Ingredient</th>
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
									
								</tbody>
							</table>
							
							<div id="instructons">
									<h4>Instructions</h4>
									 ${recipe.instructions }</div>
						</div>
					</div>
				</div>  <!-- END INSTRUCTIONS  -->
				
				
				
				<div class="container">
					<a href="#comments" class="btn btn-info" data-toggle="collapse">Comments</a>
					<div id="comments" class="collapse">

						<!--------------------- COMMENT FORM  ------------------------------->

						<div id="commentForm">
							<h3>Leave a comment:</h3>
							<form action="createComment.do" method="POST">




								<input id="id" type="hidden" name="recipeId"
									value="${recipe.id}" /> 
									
									<input class="form-control-xl"
									type="text" name="comment"
									placeholder="Tell us what you think about this drink! " /> <br>

								<input type="submit" value="sumbit" />
							</form>

						</div>

						<!-- ------------------ DISPLAY COMMENTS  ------------------------------->
						<c:forEach var="rc" items="${recipe.comments }">



							<div class="container mt-5">
								<div class="row d-flex justify-content-center">
									<div class="col-md-8">
										<div
											class="headings d-flex justify-content-between align-items-center mb-3">

										</div>
										<div class="commentcard p-3">
											<div
												class="d-flex justify-content-between align-items-center">
												<div class="user d-flex flex-row align-items-center">
													<img src="${rc.user.photoUrl }" width="30"
														class="user-img rounded-circle mr-2"> <span><small
														class="font-weight-bold text-primary">${rc.user.username }</small>
														<small class="font-weight-bold">${rc.comment }</small></span>
												</div>
											</div>

										</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>
				
			<!-- 	END COMMENTS -->
				
				
				
				
				
          </div></div> <!-- END OF Column 1  -->
         


          <div class="col-sm">
          <img id="recipePhoto" src="${recipe.imageUrl}" class="card-media" width=250px; />
          
        </div>
      </div>

      </div>
      <div class="card-shadow"></div>
    </div>















</body>
</html>
