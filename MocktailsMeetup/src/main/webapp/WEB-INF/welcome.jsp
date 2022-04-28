<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome ${user.username}</title>
<link rel="stylesheet"
	href=https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400>
<link rel="stylesheet"
	href=https://fonts.googleapis.com/css?family=Playfair+Display>
</head>
<style>


* {
  /* box-sizing: border-box; */
}
 body {

 justify-content: center;
  align-items: center;
  margin: 0;
   font-family: 'Source Sans Pro', sans-serif;
  color: #black;
  background: #eee;
}
.container {

	/* padding-top: 160px; */
	z-index: 1;

width: 1000px;
  justify-content: space-evenly;
  flex-wrap: wrap; 
  
   
      display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-gap: 20px;
  align-items: center; 
  
} 
.card {
  margin: 10px;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 2px 20px rgba(0, 0, 0, 0.2);
  overflow: hidden;
  width: 300px;
}
.card-header img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}
.card-body {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  padding: 20px;
  min-height: 250px;
}

.tag {
  background: #cccccc;
  border-radius: 50px;
  font-size: 12px;
  margin: 0;
  color: #fff;
  padding: 2px 10px;
  text-transform: uppercase;
  cursor: pointer;
}
.tag-teal {
  background-color: #47bcd4;
}
.tag-purple {
  background-color: #5e76bf;
}
.tag-pink {
  background-color: #cd5b9f;
}

.card-body p {
  font-size: 13px;
  margin: 0 0 40px;
}

/* carousel */

.contained {
  position: relative;
  width: 320px;
  margin: 100px auto 0 auto;
  perspective: 1000px;
  
 padding-bottom: 180px;
}

.carousel {
  position: absolute;
  width: 100%;
  height: 100%;
  transform-style: preserve-3d; 
  animation: rotate360 100s infinite forwards linear;
}
.carousel__face { 
  position: absolute;
  width: 300px;
  height: 187px;
  top: 20px;
  left: 10px;
  right: 10px;
  background-size: cover;
  box-shadow:inset 0 0 0 2000px rgba(0,0,0,0.5);
  display: flex;
}

#linkTO {
  margin: auto;
  font-size: 2rem;
   top: 50%;
  left: 50%;
  position: absolute;
  color: #f8f7ff;
  text-decoration: none;
}
#linkTO2 {
  margin: auto;
  font-size: 2rem;
    top: 8px;
  left: 16px;
  position: absolute;
  color: #f8f7ff;
  text-decoration: none;
}
#linkTO3 {
  margin: auto;
  font-size: 2rem;
bottom: 8px;
  left: 16px;
  position: absolute;
  color: #f8f7ff;
  text-decoration: none;
}
#cardLink {
  
  color: #001233;
  text-decoration: none;
}


.carousel__face:nth-child(1) {
 
  transform: rotateY(  0deg) translateZ(430px); }
.carousel__face:nth-child(2) { 
  
    transform: rotateY( 40deg) translateZ(430px); }
.carousel__face:nth-child(3) {
  transform: rotateY( 80deg) translateZ(430px); }
.carousel__face:nth-child(4) {
  transform: rotateY(120deg) translateZ(430px); }
.carousel__face:nth-child(5) { 
 transform: rotateY(160deg) translateZ(430px); }
.carousel__face:nth-child(6) { 
 transform: rotateY(200deg) translateZ(430px); }
.carousel__face:nth-child(7) { 
 transform: rotateY(240deg) translateZ(430px); }
.carousel__face:nth-child(8) {
  transform: rotateY(280deg) translateZ(430px); }
.carousel__face:nth-child(9) {
  transform: rotateY(320deg) translateZ(430px); }



@keyframes rotate360 {
  from {
    transform: rotateY(0deg);
  }
  to {
    transform: rotateY(-360deg);
  }
}

/* Breakout Section */


.why-sip .box {
 
padding-top: 30px;
	z-index: 1;
	/* width: 800px; */
	
  flex-wrap: wrap; 
  
/*   justify-content: space-evenly; */
align-items: center; 
 
  background-color: white;
  box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
  transition: all ease-in-out 0.3s;
  height: 100%; 
  max-width: 80%
 
}
.why-sip .box span {
 display: block;
  font-size: 28px;
  font-weight: 700;
  color: #fec89a; 
   width: 80%  
}
.why-sip .box h4 {
  font-size: 24px;
  font-weight: 600;
  padding: 0;
  margin: 20px 0;
  color: black;
}
.why-sip .box p {
  color: black;
  font-size: 15px;
  margin: 0;
  padding: 0;
}
.why-sip .box:hover {
  background: #fec89a;
  padding: 30px 30px 70px 30px;
  box-shadow: 10px 15px 30px rgba(0, 0, 0, 0.18);
}
.why-sip .box:hover span, .why-us .box:hover h4, .why-us .box:hover p {
  color: #fec89a;
}

section {
  padding: 60px;
  align-items: center; 
 
  
}
.container2 {

padding-top: 30px;
}

h2 {
  font-family: 'Playfair Display', serif;
  color: #black;
  size: 25px;
}
.links {
  margin: auto;
  font-size: 20px;
   top: 50%;
  left: 50%;
  position: static;
  color: #001233;
  
}

</style>
<body>


	<%@ include file="loggedInNavbar.jsp"%>
	
	<section>
	<div class="contained">
  <div class="carousel">
    <div class="carousel__face">    <img class="d-block w-100" src="https://www.thetimes.co.uk/imageserver/image/%2Fmethode%2Ftimes%2Fprod%2Fweb%2Fbin%2Fd2c1221a-47c7-11ec-9969-911e63457092.jpg?crop=5170%2C2908%2C372%2C545&resize=1200" alt="first slide">
   <a id= linkTO href="addMeet.do">Host a Meetup</a></div>
    <div class="carousel__face"> <img class="d-block w-100" src="https://www.arizonafoothillsmagazine.com/taste/wp-content/uploads/cocktails-cheers1-1.jpg" alt="first slide"></div>
    <div class="carousel__face"><img class="d-block w-100" src="https://cdn.vox-cdn.com/thumbor/RiWuh6mgcFqAyzG9rtaZiBg2B2Q=/0x0:4356x2754/1200x800/filters:focal(1830x1029:2526x1725)/cdn.vox-cdn.com/uploads/chorus_image/image/69137932/shutterstock_592709111.0.jpg" alt="first slide"> <a id= linkTO2 href="newRecipe.do">Share A Recipe</a></div>
    <div class="carousel__face"><img class="d-block w-100" src="https://www.urologygroup.com/wp-content/uploads/2021/12/Mocktails-1.jpg" alt="first slide"></div>
    <div class="carousel__face"><img class="d-block w-100" src="https://www.shemazing.net/wp-content/uploads/2018/06/cocktailsfeature.jpg" alt="first slide"><a id= linkTO3 href="surpriseMe.do">Feeling Adventurous?</a></div>
    <div class="carousel__face"><img class="d-block w-100" src="https://www.foodsmart.com/hubfs/Canva%20images/mocktails.png" alt="first slide"></div>
  <div class="carousel__face"><img class="d-block w-100" src="https://www.urologygroup.com/wp-content/uploads/2021/12/Mocktails-1.jpg" alt="first slide"></div>
    <div class="carousel__face"><img class="d-block w-100" src="https://img.kidspot.com.au/_Tr8wlAb/kk/2020/11/watermelon-crush-7up-mocktail-recipe-604802-2.png" alt="first slide"></div>
    <div class="carousel__face"><img class="d-block w-100" src="https://www.thelittleepicurean.com/wp-content/uploads/2015/12/sparkling-blackcurrant-raspberry-mocktail-2-700x450.jpg" alt="first slide"></div> 
  </div>
</div>
	</section>

  <section id="why-sip" class="why-sip">
      <div class="container2">

        <div class="row">

          <div class="col-lg-4">
            <div class="box">
              <!-- <span>01</span> -->
              <h2>Want to host a Sip n' Social Meetup?</h2>
              <p><a class= links href="addMeet.do">Head to the meetup page to set one up!</a></p>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="box">
             <!--  <span>02</span> -->
              <h2>Have a recipe you know everyone will love?</h2>
              <a class= links href="newRecipe.do">Click here to share it with the Sip community!</a>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="box">
              <!-- <span>03</span> -->
              <h2>Need us to pick a drink for you?</h2>
              <p><a class= links href="surpriseMe.do">I'm feelin' adventurous!</a></p>
            </div>
          </div>

        </div>
      </div>
    </section>

<section>
<h2>Meetups in your area: </h2>
<div class="container">
    <c:forEach var="m" items="${meetup}">
  <div class="card ">

    <div class="card-body">
      <span class="tag tag-teal">${m.meetupDate}</span>
      <h4>
        <a id= cardLink href="getMeetups.do?Id=${m.id}">${m.title}</a>
      </h4>
      <p>
        ${m.address}
      </p>
    <br>
    </div>
  </div>
	</c:forEach>
  </div>
  </section>


</body>
</html>