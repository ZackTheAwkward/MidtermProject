<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mocktails Meetup</title>
</head>
<body>

<%@ include file="mainNavBar.jsp" %>

<h1>SEACRH BY CATEGORY PAGE </h1>


<h1>THIS IS OUR SEACH PAGE MAKE ME PRETTY </h1>

${DEBUG}

<form action="categories.do" method="GET">
  Search by Category: <input type="text" name="keyword" placeholder="Frozen, Fruit, POTATO"/>
  <input type="submit" value="Find Drink" />
</form> 



</body>
</html>

</body>
</html>