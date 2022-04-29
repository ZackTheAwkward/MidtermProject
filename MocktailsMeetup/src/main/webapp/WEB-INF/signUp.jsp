<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
<link rel="stylesheet"
	href=https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400>
<link rel="stylesheet"
	href=https://fonts.googleapis.com/css?family=Playfair+Display>
</head>
<style>

* {
	box-sizing: border-box;
}

body {
	background: #f6f5f7;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-family: 'Montserrat', sans-serif;
	height: 100vh;
	margin: -20px 0 50px;
}

h1 {
	text-align: center;
 	font-family: 'Playfair Display', serif;
	font-weight: bold;
	margin: 0;
}

h3 {
 	font-family: 'Playfair Display', serif;
	margin: 0;
}



h2 {
	text-align: center;
	font-family: 'Source Sans Pro', sans-serif;
	font-weight: 200;
}

p {
	font-size: 14px;
	font-weight: 100;
	line-height: 20px;
	letter-spacing: 0.5px;
	margin: 20px 0 30px;
}

span {
	font-size: 12px;
}

a {
	color: #FFFFFF;
	font-size: 20px;
	text-decoration: none;
	margin: 15px 0;
}

button {
	border-radius: 20px;
	border: 1px solid #FF4B2B;
	background-color: #FF4B2B;
	color: #FFFFFF;
	font-size: 12px;
	font-weight: bold;
	padding: 12px 45px;
	letter-spacing: 1px;
	text-transform: uppercase;
	transition: transform 80ms ease-in;
}

button:active {
	transform: scale(0.95);
}

button:focus {
	outline: none;
}

button.ghost {
	background-color: transparent;
	border-color: #FFFFFF;
}

form {
	background-color: #FFFFFF;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 50px;
	height: 100%;
	text-align: center;
}

input {
	background-color: #eee;
	border: none;
	padding: 12px 15px;
	margin: 8px 0;
	width: 100%;
}

.container {
	background-color: #fff;
	margin-top: 75px;
	border-radius: 10px;
	box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px
		rgba(0, 0, 0, 0.22);
	position: relative;
	bottom: 0;
	padding-top: 10;
	overflow: hidden;
	width: 768px;
	max-width: 100%;
	min-height: 480px;
}

.form-container {
	position: absolute;
	top: 0;
	height: 100%;
	transition: all 0.6s ease-in-out;
}

.sign-in-container {
	left: 0;
	width: 50%;
	z-index: 2;
}

.container.right-panel-active .sign-in-container {
	transform: translateX(100%);
}

.sign-up-container {
	left: 0;
	width: 50%;
	opacity: 0;
	z-index: 1;
}

.container.right-panel-active .sign-up-container {
	transform: translateX(100%);
	opacity: 1;
	z-index: 5;
	animation: show 0.6s;
}

@
keyframes show { 0%, 49.99% {
	opacity: 0;
	z-index: 1;
}

50
%
,
100
%
{
opacity
:
1;
z-index
:
5;
}
}
.overlay-container {
	position: absolute;
	top: 0;
	left: 50%;
	width: 50%;
	height: 100%;
	overflow: hidden;
	transition: transform 0.6s ease-in-out;
	z-index: 100;
}

.container.right-panel-active .overlay-container {
	transform: translateX(-100%);
}

.overlay {
	background: #00798c;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: 0 0;
	color: #FFFFFF;
	position: relative;
	left: -100%;
	height: 100%;
	width: 200%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.container.right-panel-active .overlay {
	transform: translateX(50%);
}

.overlay-panel {
	position: absolute;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 0 40px;
	text-align: center;
	top: 0;
	height: 100%;
	width: 50%;
	transform: translateX(0);
	transition: transform 0.6s ease-in-out;
}

.overlay-left {
	transform: translateX(-20%);
}

.container.right-panel-active .overlay-left {
	transform: translateX(0);
}

.overlay-right {
	right: 0;
	transform: translateX(0);
}

.container.right-panel-active .overlay-right {
	transform: translateX(20%);
}

</style>
<body>


<%@ include file="mainNavBar.jsp" %>

<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="login.do" method = "POST">
			<h1>Sign in</h1>
			
			<span>or use your account</span>
			<input type="text" name = "username" placeholder="Username" />
			<input type="password" name = "password" placeholder="Password" />
			<button>Sign In</button>
		</form>
	</div>
	
	<div class="form-container sign-in-container">
	<form action="createAccount.do" method="POST">
			<h1>Create Account</h1>
			
			<span>Welcome, Friend!</span>
			<input type="text" name="username" placeholder="Username" required/>
			<input type="text" name="password" placeholder="Password" required/>
			<input type="text" name="firstName" placeholder="First Name" required/>
			<input type="text" name="lastName" placeholder="Last Name" required/>
			<input type="text" name="email" placeholder="Email" required/>
			<input type="submit" value="Sign Up" > 
		</form>
		
	</div>
	
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>New to Sip n Social?</h1>
				<h3>Create an account to unlock all of our features!</h3>
				<h3>Share recipes, and join or host meetups!</h3>
				<button class="ghost" id="signUp">Sign Up</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Returning to Sip?</h1>
				<img alt="" src="https://live.staticflickr.com/65535/52036840052_cf16d87dd2.jpg" width="100px" height="100px">
				<h3>We've missed you!</h3>
				<a style= color:#FFFFFF;border-style:solid;border-color:#FFFFFF href="goLogin.do">  Sign In  </a>
			</div>
		</div>
	</div>
</div>

</body>
</html>