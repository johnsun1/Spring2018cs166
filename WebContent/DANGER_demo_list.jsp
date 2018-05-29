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
		<title>CS166 Project - InfoSec Demo</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	
	<body>
		<% if (session.getAttribute("username") != null) {  %>
		<%@include file="include/HTML/nav_bar_member.html" %>
			<div class="container">
				<p>This part of the site contains some demonstrations of common attacks on websites, as well as useful information regarding user authentication. 
				Each attack has its own page with the demo itself, and some information on preventing that attack.</p>
				<b>Attacks and Prevention</b><br>
				<ul>
					<li><a href="DANGER_SQLInjection.jsp">SQL Injection</a></li>
					<li><a href="DANGER_XSS.jsp">Cross Site Script Injection</a></li>
					<li><a href="DANGER_website_defacing.jsp">Web Site Defacing</a></li>
				</ul>
				<b>User Authentication</b>
				<ul>
					<li><a href="cookies.jsp">Cookies</a></li>
					<li><a href="session_management.jsp">Session Management Using JSP/Servlet Session Mechanism</a></li>
				</ul>
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