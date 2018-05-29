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
			<b><u>I love ponies!</u></b><br>
			<p>This post definitely does not contain random Javascript.</p>
			<p id="factorial"></p>
			<script>
				function fact(i) {
					if (i == 0) {
						return 1;
					} else {
						return i * fact(i-1);
					}
				}
				
				document.getElementById("factorial").innerHTML = "My favorite number is " + fact(10) + ".";
			</script>
			<small>Posted by <b>NOT_Trudy</b> on <b>01/01/01</b></small>
			<br><br>
			<p>Just there, in that simple post, Trudy was able to calculate 10! using Javascript. 
			The code that was used to accomplish this task is below.</p>
<pre><code>
function fact(i) {
	if (i == 0) {
		return 1;
	} else {
		return i * fact(i-1);
	}
}
				
fact(10);
</code></pre>
			<p>This code can be embedded within the script tag, within Trudy's post. The obvious way to prevent such an attack,
			would be to forbid all HTML and Javascript content within blog posts. However, there are legitimate reasons for a user
			to want to use Javascript and HTML. Therefore, this is still a security problem for blogs and message boards; any website
			that publically displays user input has this problem. </p>
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