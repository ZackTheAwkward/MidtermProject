<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meetups</title>
</head>
<style>
* {
  box-sizing: border-box;
}
 body {

 justify-content: center;
  align-items: center;
  margin: 0;
  background-color: #f7f8fc;
  font-family: 'Montserrat', sans-serif;
  color: #10182f;
}
.container {

	padding-top: 20px;
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
  background: #00798c;
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
</style>
<body>
	<%@ include file="loggedInNavbar.jsp"%>

<div class="container">
    <c:forEach var="m" items="${meetup}">
  <div class="card ">
   <!--  <div class="card-header">
      <img src="https://c0.wallpaperflare.com/preview/483/210/436/car-green-4x4-jeep.jpg" alt="rover" />
    </div> -->

    <div class="card-body">
      <span class="tag tag-teal">${m.meetupDate}</span>
      <h4>
        <a href="getMeetups.do?Id=${m.id}">${m.title}</a>
      </h4>
      <p>
        ${m.address}
      </p>
    <br>
    </div>
  </div>
	</c:forEach>
  </div>

</body>
</html>