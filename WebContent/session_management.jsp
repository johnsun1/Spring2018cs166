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
		<title>CS166 Project - Session Management Demo Page</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	<body>
	<% if (session.getAttribute("username") != null) {  %>
	<%@include file="include/HTML/nav_bar_member.html" %>
		<div class="container">
			<p>This website was built using Tomcat. User sessions are created by an HttpSession object, and kept active for a certain period of time.
			A session can be invalidated, or have Strings added to or removed from it. Try adding some attributes to your session object from the list below.
			</p>
			
			<form action="session_management_action.jsp" method="post">
				<input type="radio" name="session_string" value="Steve Jobs"> Steve Jobs<br>
				<input type="radio" name="session_string" value="Richard Feynman"> Richard Feynman<br>
				<input type="radio" name="session_string" value="Stephen Hawking"> Stephen Hawking<br>
				<input type="submit" value="Go" class="btn btn-primary">
			</form>
			<br><p>Click <a href='DANGER_demo_list.jsp'>here</a> to go back.</p>
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