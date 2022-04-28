<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Share A Recipe</title>
</head>


<style>

body {
	font-family: 'Source Sans Pro', sans-serif;
 background-image: url("https://live.staticflickr.com/65535/52035527082_9a164aab57_o.png");
 background-color: #cccccc;
 background-size: 100%;

}

a {
	color: #149ddd;
	text-decoration: none;
}

a:hover {
	color: #37b3ed;
	text-decoration: none;
}

h1 {
	font-family: 'Cormorant Garamond', serif;
	font-size: 100px;
	color: white;
}

.container {
padding-top: 150px;


}


.container input[type="text"] {
	width: 300px;
	padding-top: 10px;
	font-size: 15px;
	border-radius: 5px;
} 


</style>
<body>
	<%@ include file="loggedInNavbar.jsp"%>



 <div class="container">
		
<h1><strong>Add a New Recipe </strong></h1>

			<form action="createdRecipe.do" method="POST">

				<input class="form-control-sm" type="text" name="name"
					placeholder="Name of Recipe" /> <br><br> <input
					class="form-control-sm" type="text" name="description"
					placeholder="Tell us about it: " /> <br><br> <input
					class="form-control-sm" type="text" name="instructions"
					placeholder="How do you make it? : " /> <br><br> <input
					class="form-control-sm" type="text" name="servingSize"
					placeholder="How many people does this serve? " /> <br> <br>
					<input
					type="submit" value="Thank you for sharing a new sip!" />

			</form>
			
		</div>
			


		







</body>
</html>