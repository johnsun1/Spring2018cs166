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
		<title>CS166 Project - Cookie Demo Page </title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	
	<body>
		<% if (session.getAttribute("username") != null) {  %>
		<%@include file="include/HTML/nav_bar_member.html" %>
		
		<div class="container">
			<p>The session you have with the website right now is kept alive by a cookie. Here is some information about that cookie.</p>
			<u>Session ID:</u> <% out.print(" "+session.getId()); %> <br>
			<u>Username:</u> <% out.print(" "+session.getAttribute("username")); %> <br>
			<u>User ID:</u> <% out.print(" "+session.getAttribute("id")); %><br><br>
			<p>Technically this is not completely secure. Trudy could steal the cookie and learn your username, and your user authorization level; 
			as well as your user ID. The better way to maintain a session would be to use URL rewriting.</p> 
			<p>Click <a href='DANGER_demo_list.jsp'>here</a> to go back.</p>
		</div>
		
		<%@include file="include/HTML/footer.html" %>
		<% 
			} else {
					out.println("You need to be <a href='index.jsp'>logged in</a> to view this content.");
			} 
		%>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>