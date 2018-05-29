<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<%@include file="include/JSP/WRITE_DB.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css" >
		<title>CS166 Project - Update Post</title>
	</head>
	
	<body>
	<% if (session.getAttribute("username") != null) { %>
	<%@include file="include/HTML/nav_bar_member.html" %>
		<div class="container">
			<%  
				//Get post information
				String postId = request.getParameter("postId");
				int authorId = (int) session.getAttribute("id");
				String query = "SELECT * FROM BlogPosts WHERE id= ?";
				PreparedStatement prepStmt = conn.prepareStatement(query);
				
				//Set parameters
				prepStmt.setString(1, postId);
				
				//Update blog post
				ResultSet rs = prepStmt.executeQuery();
				rs.next(); //Should only return a single tuple
				%>
				<form action='blog_update_action.jsp' method='post'>
					<div class='form-group'>
						<label for='title'>Title</label>
						<input type='text' class='form-control' name='title' value='<% out.print(rs.getString("title")); %>'>
					</div>
					
					<div class='form-group'>
						<label for='body'>Body</label>
						<textarea class='form-control' name='body' rows="20"><% out.print(rs.getString("body")); %></textarea>
					</div>
					
					<input type='hidden' value='<% out.print(postId); %>' name='pid'>
					<input type='hidden' value='<% out.print(authorId); %>' name='aid'>
					
					<input type='submit' value='Update' class='btn btn-success'>
				</form>
				<br>
				<form action='blog_delete.jsp' method='post'>
					<input type='submit' value='Delete' class='btn btn-danger'> 
					<input type='hidden' value='<% out.print(postId); %>' name='pid'>
				</form>
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