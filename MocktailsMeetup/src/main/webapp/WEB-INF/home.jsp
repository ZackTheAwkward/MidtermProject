<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sip n' Social Home</title>


<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@200&family=Yeseva+One&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500&family=Source+Sans+Pro:ital,wght@0,200;0,400;1,300&display=swap" rel="stylesheet">


<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>


</head>


<style>
.carousel-item {
  height: 100vh;
  padding-top: 0px;
  margin-bottom: 1px;
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
 
 body {
  font-family: 'Source Sans Pro', sans-serif;
  color: #black;
  background: #eee;
}

a {
  text-decoration: none;
  color: #ffb03b;
}

a:hover {
  color: #ffc56e;
  text-decoration: none;
}

h1, h4, h5,  {

font-family: 'Playfair Display', serif;
color: #black;
}

h2 {
  font-family: 'Playfair Display', serif;
  color: #black;
  size: 25px;
}

h6 {
  font-family: 'Source Sans Pro', sans-serif;
  color: #black;
  font-size: 16px;
  weight: thin;
  
/*   padding-top: 20px;
  padding-bottom: 200px; */
  letter-spacing: 2px;
}

input[type=submit] {
 width: 300px; 
 height: 50px; }



section {
  padding: 60px 0;
}

.section-bg {
  background-color: white;
}

.section-title {
  text-align: center;
  padding-bottom: 30px;
}
.section-title h2 {
  margin: 15px 0 0 0;
  font-size: 32px;
  font-weight: 700;
  color: #5f5950;
}
.section-title h2 span {
  color: #ffb03b;
}
.section-title p {
  margin: 15px auto 0 auto;
  font-weight: 200;
}
@media (min-width: 1024px) {
  .section-title p {
    width: 50%;
  }
}

/*--------------------------------------------------------------
# Breadcrumbs
--------------------------------------------------------------*/
.breadcrumbs {
  padding: 20px 0;
  background-color: #f2f1ef;
  min-height: 40px;
  margin-top: 120px;
}
@media (max-width: 992px) {
  .breadcrumbs {
    margin-top: 70px;
  }
}
.breadcrumbs h2 {
  font-size: 24px;
  font-weight: 300;
  margin: 0;
}
@media (max-width: 992px) {
  .breadcrumbs h2 {
    margin: 0 0 10px 0;
  }
}
.breadcrumbs ol {
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  padding: 0;
  margin: 0;
  font-size: 14px;
}
.breadcrumbs ol li + li {
  padding-left: 10px;
}
.breadcrumbs ol li + li::before {
  display: inline-block;
  padding-right: 10px;
  color: #6c757d;
  content: "/";
}
@media (max-width: 768px) {
  .breadcrumbs .d-flex {
    display: block !important;
  }
  .breadcrumbs ol {
    display: block;
  }
  .breadcrumbs ol li {
    display: inline-block;
  }
}

/*--------------------------------About------------------------------------------*/
.about {
  background: white;
}
.about .content {
  padding: 0 80px;
}
.about .content h3 {
  font-weight: 400;
  font-size: 45px;
  color: #black;
}
.about .content h4 {
  font-family: 'Source Sans Pro', sans-serif;
  font-size: 30px;
  font-weight: 200;
  margin-top: 5px;
}
.about .content p {
  font-size: 15px;
  color: #848484;
}
.about .content ul {
  list-style: none;
  padding: 0;
}
.about .content ul li + li {
  margin-top: 15px;
}
.about .content ul li {
  position: relative;
  padding-left: 26px;
}
.about .content ul i {
  font-size: 20px;
  color: #ffb03b;
  position: absolute;
  left: 0;
  top: 2px;
}
.about .content p:last-child {
  margin-bottom: 0;
}


@media (max-width: 1024px) {
  .about .content, .about .accordion-list {
    padding-left: 0;
    padding-right: 0;
  }
}
@media (max-width: 992px) {
  .about .content {
    padding-top: 30px;
  }
  .about .accordion-list {
    padding-bottom: 30px;
  }
}

@-webkit-keyframes pulsate-btn {
  0% {
    transform: scale(0.6, 0.6);
    opacity: 1;
  }
  100% {
    transform: scale(1, 1);
    opacity: 0;
  }
}

@keyframes pulsate-btn {
  0% {
    transform: scale(0.6, 0.6);
    opacity: 1;
  }
  100% {
    transform: scale(1, 1);
    opacity: 0;
  }
}
/*---------- Why We Sip-----------------------------------*/
.why-sip .box {
  padding: 50px 30px;
  background-color: white;
  box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
  transition: all ease-in-out 0.3s;
  height: 100%;
}
.why-sip .box span {
  display: block;
  font-size: 28px;
  font-weight: 700;
  color: #00798c;
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
  background: #00798c;
  padding: 30px 30px 70px 30px;
  box-shadow: 10px 15px 30px rgba(0, 0, 0, 0.18);
}
.why-sip .box:hover span, .why-us .box:hover h4, .why-us .box:hover p {
  color: white;
}

/*------Meetups --------------------------------------------------------------*/
.gallery {
  padding-bottom: 0;
}
.gallery .gallery-item {
  overflow: hidden;
  border-right: 3px solid #fff;
  border-bottom: 3px solid #fff;
}
.gallery .gallery-item img {
  transition: all ease-in-out 0.4s;
}
.gallery .gallery-item:hover img {
  transform: scale(1.1);
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



<main id="main">
    <section id="about" class="about">
      <div class="container-fluid">
	<a id="about_us" style="color:white;">About us</a>

        <div class="row">

          <div class="col-lg-5"> <img src="https://live.staticflickr.com/65535/52036960264_147fc36ec5_c.jpg" height="600px" width="600px">
		
          </div>

          <div class="col-lg-7 d-flex flex-column justify-content-center align-items-stretch">

            <div class="content">
              <h2>Come for the Recipes <br><strong>Stay for the Community</strong></h2>
              <br>

              <h6> Being social is already hard enough- we take the pressure out of going out, and staying sober. We offer a vast, and growing database of mocktail recipes that are sure to hit the spot for everyone! We hope you'll join the Sip community and find your crowd of like-minded go-outers.
              </h6>
              <br>
               <br>
               <br>
               <br>
               <h2>Not sure what you want?</h2>
               <p>Try our surprise recipe generator!</p>
              <div>
	<form action="surpriseMe.do">
					<input type="submit" value="I'm Feeling Adventrous"
						class="bg-light form-control"> <%-- <input type="hidden"
						name="id" value="${user.id }" --%> 
				</form>
	</div>



            </div>

          </div>

        </div>

      </div>
    </section>

    <section id="why-sip" class="why-sip">
      <div class="container">

        <div class="section-title">
          <h1>Why We Sip</h1>

        </div>

        <div class="row">

          <div class="col-lg-4">
            <div class="box">
              <span>01</span>
              <h4>A Space For All</h4>
              <p>Our meetups provide a fun, safe, and inclusive space for all. </p>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="box">
              <span>02</span>
              <h4>Come as a Stranger, Leave as a Friend</h4>
              <p>We've made some of our best friends here and can't wait to meet you!</p>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="box">
              <span>03</span>
              <h4>Pressure Free Community</h4>
              <p>No pressure to drink in this space</p>
            </div>
          </div>

        </div>
      </div>
    </section>

    <section id="gallery" class="gallery">
      <div class="container-fluid">

        <div class="section-title">
          <h2>Photos from Our Mocktail Meetups</h2>
          <p>some catchy paragraph about how great we are here </p>
        </div>

        <div class="row g-0">

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="#" class="gallery-lightbox">
                <img src="https://live.staticflickr.com/65535/52035055748_2ec180dea5_o.png" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="#" class="gallery-lightbox">
                <img src="https://live.staticflickr.com/65535/52035528860_f3e829e1bf_z.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="#" class="gallery-lightbox">
                <img src="https://live.staticflickr.com/65535/52033968787_4d396647fc_o.png" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="#" class="gallery-lightbox">
                <img src="https://live.staticflickr.com/65535/52033968757_5d5e9370dc_o.png" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="#" class="gallery-lightbox">
                <img src="https://live.staticflickr.com/65535/52035055678_ccb5617382_o.png" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="#" class="gallery-lightbox">
                <img src="https://live.staticflickr.com/65535/52035011911_dae8e6ccf9_o.png" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="#" class="gallery-lightbox">
                <img src="https://live.staticflickr.com/65535/52035055688_33aebd4640_o.png" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="#" class="gallery-lightbox">
                <img src="https://live.staticflickr.com/65535/52033968637_9bd49a87ac_o.png" alt="" class="img-fluid">
              </a>
            </div>
          </div>

        </div>

      </div>
     
    </section>




  </main>
  <br>
  <br>
  <br>
    <%@ include file="footer.jsp"%>


  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
