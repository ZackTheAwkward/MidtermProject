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
<body>

	<%@ include file="recipeStyle.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h1></h1>



	<div class="card-container">
		<div class="card u-clearfix">
			<div class="card-body">

				<span class="card-number card-circle subtle">${recipe.id}</span> <span
					class="card-author subtle">Sip n Social</span>
				<h2 class="card-title">${recipe.name}</h2>
				<span class="card-description subtle">${recipe.description }</span>


				<div class="container">
					<a href="#instructions" class="btn btn-info" data-toggle="collapse">Make
						This</a>
					<div id="instructions" class="collapse">

						<br>
						<div id="instructionsContainer">
							<h4>Ingredients</h4>

						<%-- 	<c:forEach var="rc" items="${recipe.ingredients }">

								<li>${rc.quantity}${rc.unit }${rc.ingredient.name }</li>


							</c:forEach> --%>


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
				</div>
				<br>
				<div class="container">
					<a href="#comments" class="btn btn-info" data-toggle="collapse">Comments</a>
					<div id="comments" class="collapse">

						<!--------------------- COMMENT FORM  ------------------------------->

						<div id="commentForm">
							<h3>Leave a comment:</h3>
							<form action="createComment.do" method="POST">




								<input id="id" type="hidden" name="recipeId"
									value="${recipe.id}" /> <input class="form-control-xl"
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
													<img src="${user.photoUrl }" width="30"
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



			</div>
			<img src="${recipe.imageUrl}" width="280" height="auto" /> <img
				src="" />
		</div>
		<div class="card-shadow"></div>
	</div>



	<div>
		<br> <br> <br>
	</div>



















</body>
</html>
