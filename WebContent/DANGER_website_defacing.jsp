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
		<title>CS166 Project - Website Defacing Demo Page</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
		<script>
		function onClick(token) {
			document.getElementById("text").innerHTML = "Hello World!";
		}
       </script>
	</head>
	
	<body>
		<% if (session.getAttribute("username") != null) {  %>
		<%@include file="include/HTML/nav_bar_member.html" %>
			<div class="container">
				<p>Website defacing describes a type of attack, where Trudy uses her 
				code to change the look of the website. One way this may occur, is through the 
				use of a carefully crafted string combined with a poorly written web form.</p>
				<p id="text">This is a paragraph. Trudy could use javascript to change its contents
				to almost anything. For this demo, we are going to change it to a well known string.</p>
				<button onclick="onClick()">Try Me</button>
				<br><br><p>While this demo is simple, it illustrates the point. If Trudy can
				somehow inject her HTML and JavaScript code, and get it to run, she can change almost 
				any element on the website; if it is not designed well. For instance: If Trudy is making
				a blog post, she can include html in her post that creates a button. That button,
				when clicked, would execute some JavaScript to change elements on the website.</p>
				<p>One way to prevent this kind of attack, is to sanitize user input for JavaScript
				and HTML. Another way is to avoid giving ids to elements unnecessarily. It will be
				more difficult for Trudy to change an element if she cannot reference it.</p>
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