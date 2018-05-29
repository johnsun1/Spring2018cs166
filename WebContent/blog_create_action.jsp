<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<%@include file="include/JSP/WRITE_DB.jsp" %>
<%@page import="java.text.*, java.util.Date, java.sql.*" %>
<html>
	<head>
		<title>CS 166 Project - Create Blog Post</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	
	<body>
		<div class="container">
			<%
				//Get post details
				int authorId = (int) session.getAttribute("id");
				String title = request.getParameter("title");
				String body = request.getParameter("body");
				String date = new SimpleDateFormat("MM/dd/yyyy").format(new Date());
				String time = new SimpleDateFormat("HH:mm:ss").format(new Date());
				
				//Prepare and execute query to add post
				String query = "INSERT INTO BlogPosts (authorId, body, date, time, title) VALUES (?, ?, ?, ?, ?);";
				PreparedStatement prepStmt = conn.prepareStatement(query);
				
				//Set parameters of query
				prepStmt.setInt(1, authorId);
				prepStmt.setString(2, body);
				prepStmt.setString(3, date);
				prepStmt.setString(4, time);
				prepStmt.setString(5, title);
				
				//Create new blog post
				int rs = prepStmt.executeUpdate();
			%>
			</div>
			<% 
				//Redirect user to blog list
				if (rs == 1) {
					//Success
					response.sendRedirect("blog_list.jsp");
				} else {
					//Failure
					out.println("Something went wrong in making your post, please <a href='blog_create.jsp'>try again</a>");
				}
			%>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>
