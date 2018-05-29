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
		<%
			//Get user's choice and set attribute in session object
			String choice = request.getParameter("session_string");
			session.setAttribute("session_management_demo", choice);
		%>
		<p>Great choice! You have chosen <u><% out.print(session.getAttribute("session_management_demo")); %></u>. 
		Your choice from the previous page was stored into your session as an attribute. Now, whenever
		necessary, the website can refer to it to provide services. The code for all of this is listed below.</p>
<pre><code>
	//Create a session; this part was not used in this demo, as you already have an existing session
	HttpSession se = request.getSession(true);

	//Set a session attribute, using user input from a form
	String choice = request.getParameter("userChoice"); //Input from a field named "userChoice"
	se.setAttribute("demo", choice); //Assign the user's input to "demo"; like a HashMap
	
	//Retrieve our newly created attribute
	out.println(se.getAttribute("demo")); //This will print userChoice
</code></pre>
	<p>It is worth noting that retrieving an attribute will return an Object. It may be necessary to downcast your return value or it may not be usable.
	Furthermore, whenever you want to refer to the user's session on a different page, <u><i>session</i></u> may be used instead of <u><i>se</i></u>.</p>
	<p>Click <a href="DANGER_demo_list.jsp">here</a> to go back.</p>
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