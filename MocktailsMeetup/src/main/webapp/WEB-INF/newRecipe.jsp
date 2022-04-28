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
 background-image: url("https://live.staticflickr.com/65535/52027907447_00bb6221dd_o.jpg");
 background-color: #cccccc;
}
}

a {
	color: #149ddd;
	text-decoration: none;
}

a:hover {
	color: #37b3ed;
	text-decoration: none;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Cormorant Garamond', serif;
}

.col1 {
	margin-top: 50px;
	padding-top: 50px;
	margin-right: 75px;
	margin-left: 150px;
	width: 500px;
	display: inline-block;
	justify-content: center;
	text-align: center;
	background-color: #fec89a;
	border-radius: 3%;
}

.col2 {
	margin-top: 50px;
	padding-top: 40px;
	padding-bottom: 40px;
	margin-right: 150px;
	width: 500px;
	display: inline-block;
	justify-content: center;
	background-color: white;
	padding-left: 20px;
	padding-right: 20px;
	border-radius: 3%;
}

}
input[type="text"] {
	width: 350px;
	padding-top: 0px;
}

.outer {
padding-top: 10px;
	width: 200px;
	text-align: center;
}

.inner {
	display: inline-block;
}

</style>
<body>
	<%@ include file="loggedInNavbar.jsp"%>


	<div>

		<div class="row no-gutters"></div>

		<div class="col2" id="rightSide">



			<form action="createdRecipe.do" method="POST">

				<input class="form-control-sm" type="text" name="name"
					placeholder="Name Your Recipe" /> <br> <input
					class="form-control-sm" type="text" name="description"
					placeholder="Tell us about it: " /> <br> <input
					class="form-control-sm" type="text" name="instructions"
					placeholder="How do you make it? : " /> <br> <input
					class="form-control-sm" type="text" name="servingSize"
					placeholder="How many people does this serve? " /> <br> <input
					type="submit" value="Thank you for sharing a new sip!" />

			</form>


		</div>
	</div>








</body>
</html>