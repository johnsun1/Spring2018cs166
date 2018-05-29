<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>CS166 Project - Privacy Policy</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	<body>
	<%if (session.getAttribute("username") == null) { %>
		<%@include file="include/HTML/nav_bar_public.html" %>
	<%} else { %>
		<%@include file="include/HTML/nav_bar_member.html" %>
	<%} %>
		<div class="container">
		<h2>Collection of Information</h2>
			<p>We collection information about you such as:</p>
			<p><b>Information you provide to us</b>: information that you provide when you register
			for an account on the site is collected. All passwords are hashed with SHA-256 and stored
			in our back end servers; hosted on Amazon Web Services.</p>
		<br>
		<h2>Use of Information</h2>
			<p>We use your information to authenticate and authorize you. For example, your information is used:</p>
			<p><b>To authenticate you</b>: to allow you into the member protected sections of the website.
			<br><b>To authorize you</b>: certain users have extra rights on the site; e.g., admins
			and moderators. Your user level is stored in the cookie, that is created when you
			log into the site. Using information from that cookie, we can determine what your user
			rights allow you access to on the site.</p>
		<br>
		<h2>Security</h2>
			<p>Our servers are hosted by Amazon Web Services, therefore our physical security is handled
			by them. User credentials are protected. Passwords are protected using SHA-256, 
			and all communications between the web and database servers are encrypted.</p>
		<br>
		<h2>Cookies</h2>
			<p>This website uses cookies to maintain state with users.</p>
		</div>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>