<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mocktails Meetup</title>


<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>


</head>


<style>
.carousel-item {
  height: 100vh;
  padding-top: 100px;
 /*  background: #212121 */
position:relative;
	z-index:1;
}

.carousel-control-next,
.carousel-control-prev {
  width: 8% !important;
 
}

.carousel-item.active,
.carousel-item-left,
.carousel-item-right {
  display: flex !important;
  justify-content: center;
  align-items: center;
}

.carousel-item h1 {
    color: #fff;
    font-size: 72px;
 }


</style>

<body>


<%@ include file="mainNavBar.jsp" %>


<div id="demo" class="carousel slide" data-ride="carousel" data-interval="false">


  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
    <img class="d-block w-100" src="https://live.staticflickr.com/65535/52034513710_2bb0632d5a_o.png" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://live.staticflickr.com/65535/52025183961_fcf52971b9_o.png" alt="First slide">
    </div>
    <div class="carousel-item">
       <img class="d-block w-100" src="https://live.staticflickr.com/65535/52025434264_96d2d22c5d_o.png" alt="Third slide">
    </div>
  </div>
  
  

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>


	<div>
	<form action="surpriseMe.do">
					<input type="submit" value="I'm Feeling Adventrous"
						class="bg-light form-control"> <%-- <input type="hidden"
						name="id" value="${user.id }" --%> />
				</form>
	</div>

<div class="about-section">


  <h1>About Us Page</h1>
  <p>Being social is already hard enough- we take the pressure out of going out, and staying sober. </p>
  <p>We offer a vast, and growing database of mocktail recipes that are sure to hit the spot for everyone!</p>
  <p>We hope you'll join the Sip community and find your crowd of like-minded go-outers.</p>
</div>

</body>
</html>