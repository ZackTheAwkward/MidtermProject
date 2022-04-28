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


.navbar {
background-color: white !important;
font-family: 'Source Sans Pro', sans-serif;
font-size: 16px;
color: black;

 }

.nav-item {
	margin-left: 0px;
	padding-right: 75px !important;
	padding-left: 10px;
	font-family: 'Source Sans Pro', sans-serif;
	justify-content: center;
}
.navbar-scroll .nav-link, .navbar-scroll .fa-bars, .navbar-scroll .navar-brand
	{
	color: #4f4f4f;
}

.nav-link:hover {
	color: pink;
}



.btn, .btn-info {
	background-color: black !important;
	color: white;
	border: 0px;
	border-color: black;
}

.btn:hover {
	background-color: grey;
}

/* ----------------------------------------------------------------END NAV BAR STYLING------------------------------*/
/* ---------------START BODY STYLING _________________________________________________------------------------------*/

body {
	background-color: #eee;
	font-family: 'Source Sans Pro', sans-serif;
}
</style>



<body>




<nav class="navbar navbar navbar-expand-lg navbar-light bg-light">
<a class="navbar-brand" href="welcome.do">
  <img src="https://live.staticflickr.com/65535/52029337243_b29a2f52f1_w.jpg" width="auto" height="75px" ></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="welcome.do">HOME <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="viewAllMeetup.do">MEETUPS</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout.do">LOG OFF</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="account.do" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ACCOUNT
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="account.do">Account</a>
          <form action="sendToViewRecipes.do">
          
					<input type="submit" value="View Your Recipes"
						class="bg-light form-control"> <input type="hidden"
						name="id" value="${user.id }" />
				</form>
				
						<form action="sendToViewMeetups.do">
					<input type="submit" value="View Your Meetups"
						class="bg-light form-control"> <input type="hidden"
						name="id" value="${user.id }" />
				</form>
          
        </div>
      </li>

    </ul>
    <form class="form-inline my-2 my-lg-0" action="search.do">
      <input class="form-control mr-sm-2" name="keyword" type="search" placeholder="Sip Sip Hooray" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
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