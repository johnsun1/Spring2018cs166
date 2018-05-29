<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<%@include file="include/JSP/READ_DB.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css" >
		<title>CS166 Project - Blog</title>
	</head>
	<body>
		<% if (session.getAttribute("username") != null) {  %>
		<%@include file="include/HTML/nav_bar_member.html" %>
		<div class="container">
			<%
				//Retrieve all blogs from db
				String query = "SELECT * FROM BlogPosts ORDER BY date DESC, time DESC;";
				PreparedStatement prepStmt = conn.prepareStatement(query);
				ResultSet rs = prepStmt.executeQuery();
			%>
				
				<ul class='list-group'>
	
				<% while (rs.next()) { %>
				
					<li class='list-group-item'>
						<u><h3><% out.println(rs.getString("title")); %></h3></u><br>
						<% out.println(rs.getString("body")); %> <br><br>
						
						<% 
							int author = rs.getInt("authorId"); 
							String que = "SELECT username FROM Users WHERE id = ?"; //Find author's username using their ID
							PreparedStatement prep = conn.prepareStatement(que);
							prep.setInt(1, author);
							ResultSet res = prep.executeQuery();
							res.next();
						%>
						
						<small>Posted by <b><% out.print(res.getString(1)); %></b> on <b><% out.print(rs.getString("date")); %></b>
						at <b><% out.print(rs.getString("time")); %></b></small>
						
						<% if (rs.getInt("authorId") == (int) session.getAttribute("id") || (int) session.getAttribute("userRole") == 1) { %>
						<br><br>
							<form action='blog_update.jsp' method='post'>
								<input type='hidden' value=' <% out.print(rs.getInt("id")); %>' name='postId'>
								<input type='submit' value='Update' class='btn btn-success'>
							</form>
					    <% } %>
				    </li>
				<% } %>
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