<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<%@include file="include/JSP/WRITE_DB.jsp" %>
<%@page import="java.text.*, java.util.Date" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>CS166 Project - Update Blog Post</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	<body>
		<div class="container">
			<%
				//Check whether a session exists or not
				if (session.getAttribute("username") != null) { 
					//Get updated information
					String authorId = request.getParameter("aid");
					String pid = request.getParameter("pid");
					String title = request.getParameter("title");
					String body = request.getParameter("body");
					String date = new SimpleDateFormat("MM/dd/yyyy").format(new Date());
					String time = new SimpleDateFormat("HH:mm:ss").format(new Date());
					
					String query = "UPDATE BlogPosts SET authorId =?, body=?, title=?, date =?, time =? WHERE id=?;";
					
					PreparedStatement blogUpdater = conn.prepareStatement(query);
					
					//Set parameters of query
					blogUpdater.setString(1, authorId);
					blogUpdater.setString(2, body);
					blogUpdater.setString(3, title);
					blogUpdater.setString(4, date);
					blogUpdater.setString(5, time);
					blogUpdater.setString(6, pid);
					
					//Update blog post
					int rs = blogUpdater.executeUpdate();
					%>
					</div>
					<%
					//Check if update was successful
					if (rs == 1) {
						//Success
						response.sendRedirect("blog_list.jsp");
					} else {
						//Failure
						out.println("Something went wrong in making your post, please <a href='blog_create.jsp'>try again</a>");
					}
				} else {
					out.println("You need to be <a href='index.jsp'>logged in</a> to view this content.");
				}
			%>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>