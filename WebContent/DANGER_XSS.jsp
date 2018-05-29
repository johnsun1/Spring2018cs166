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
		<title>CS166 Project - XSS Demo Page</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	
	<body>
		<% if (session.getAttribute("username") != null) {  %>
		<%@include file="include/HTML/nav_bar_member.html" %>
		<div class="container">
			<p>Cross-Site Script Injection (Stored CSS) is an attack where Trudy exploits a site's poor user input sanitation
			to post malicious Javascript in a public place. When other users view her post, their browser will execute arbitrary code.
			Check <a href="https://www.owasp.org/index.php/Cross-site_Scripting_(XSS)">here</a> for more information (WASP).</p>
			<p>The next page will contain some Javascript in the manner described above. Don't worry, nothing bad will happen. The
			point is to show that simply viewing a page can execute Javascript, that can act in an covert manner. 
			Click <a href="DANGER_XSS_action.jsp">here</a> to continue.</p>
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