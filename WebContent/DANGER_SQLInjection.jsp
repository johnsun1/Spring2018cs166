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
		<title>CS166 Project - SQL Injection Demo Page</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	<body>
	<% if (session.getAttribute("username") != null) {  %>
	<%@include file="include/HTML/nav_bar_member.html" %>
	<div class="container">
	<p>An SQL Injection attack, is when Trudy uses a carefully crafted string to exploit poorly written code and execute arbitrary SQL. An attack can be prevented by: 
	input sanitation, input validation, using APIs to interact with the system, and using SQL users with limited access and abilities. 
	More information can be found on OWASP <a href="https://www.owasp.org/index.php/Injection_Prevention_Cheat_Sheet_in_Java#General_advices_to_prevent_Injection">here</a></p>
	<br>
	<b><u>SQL Injection Demonstration</u></b><br>
	<p>To see this attack in action, input anything for the username but for the password, enter the following: ' ' OR 1=1;. Because the code is poorly written, the script will authenticate you without valid credentials. Remember: Never trust user input!</p>
	<form action="DANGER_SQLInjection_action.jsp" method="post">
					<div class="form-group">
						<label for="username">Username</label>
						<input type="text" class="form-control" name="username">
					</div>
					
					<div class="form-group">
						<label for="password">Password</label>
						<input type="text" class="form-control" name="password">
					</div>
					
					<input type="submit" value="Login" class="btn btn-primary">
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