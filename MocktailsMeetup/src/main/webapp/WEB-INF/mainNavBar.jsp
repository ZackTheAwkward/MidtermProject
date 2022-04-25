<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NavBar</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&family=Yeseva+One&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>






<style>
.navbar-scroll .nav-link, .navbar-scroll .fa-bars, .navbar-scroll .navar-brand
	{
	color: #4f4f4f;
}

.navbar-scroll .nav-link:hover {
	color: #1266f1;
}

/* Color of the links AFTER scroll */
.navbar-scrolled .nav-link, .navbar-scrolled .fa-bars, .navbar-scrolled .navar-brand
	{
	color: #4f4f4f;
}

/* Color of the navbar AFTER scroll */
.navbar-scroll, .navbar-scrolled {
	background-color: #fff;
}

/* An optional height of the navbar AFTER scroll */
.navbar.navbar-scroll.navbar-scrolled {
	padding-top: 5px;
	padding-bottom: 5px;
}

body {
	background-color: #eee;
	font-family: 'Source Sans Pro', sans-serif;
}

.navbar-nav>li {
	padding-left: 30px;
	padding-right: 30px;
}
</style>



<body>


	<nav class="navbar navbar-expand-lg fixed-top navbar-scroll">
		<div class="container">
			<img
				src="https://live.staticflickr.com/65535/52029337243_b29a2f52f1_w.jpg"
				width="auto" height="75px" />
			<button class="navbar-toggler ps-0" type="button"
				data-mdb-toggle="collapse" data-mdb-target="#navbarExample01"
				aria-controls="navbarExample01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span
					class="navbar-toggler-icon d-flex justify-content-start align-items-center">
					<i class="fas fa-bars"></i>
				</span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item active">
					<a class="nav-link" aria-current="page" href="home.do">HOME</a></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="home.do">ABOUT</a></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="getMeetups.do">MEETUPS</a></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="goLogin.do">LOGIN</a></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="signUp.do">SIGNUP</a></li>
						
			<form class="form-inline my-2 my-lg-0" action="search.do">
				<input id="subinput" class="form-control mr-sm-2" name="keyword"
					type="search" placeholder="Search" aria-label="Search">
				<button id="searchbutton"
					class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			</ul>
		</div>
		</div>
	</nav>


	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>

</html>