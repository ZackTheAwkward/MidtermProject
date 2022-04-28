<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Created Meetups</title>
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
  background-color: #00798c;
}
.tag-purple {
  background-color: #00798c;
}
.tag-pink {
  background-color: #00798c;
}

.card-body p {
  font-size: 13px;
  margin: 0 0 40px;
}
</style>
<body>
<%@ include file="loggedInNavbar.jsp" %>


<div class="container">
    <c:forEach var="m" items="${userMeetups}">
  <div style class="card ">

    <div class="card-body">
      <span class="tag tag-teal">${m.meetupDate}</span>
      <h4>
        <a style= color:#000000 href="getMeetups.do?Id=${m.id}">${m.title}</a>
      </h4>
      <form action="updateMeetup.do" method="POST">
					<input type= "submit" value= "Update Meetup">
					<input type="hidden" name="id" value="${m.id }" /></form>
    <br>
    </div>
  </div>
	</c:forEach>
  </div>

</body>
</html>