<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<%@include file="include/JSP/WRITE_DB.jsp" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css" >
		<title>CS166 Project - Delete Post</title>
	</head>
	
	<body>
		<div class="container">
			<%
				String pid = request.getParameter("pid");
				String query = "DELETE FROM BlogPosts WHERE id="+pid+";";
				
				PreparedStatement prepStmt = conn.prepareStatement(query);
				int rs = prepStmt.executeUpdate();
				%>
				</div> 
				<% 
				//Check if update was successful
				if (rs == 1) {
					//Success
					out.println("Success! Click <a href='blog_list.jsp'>here</a> to continue.");
				} else {
					//Failure
					out.println("Something went wrong deleting your post, please <a href='blog_list.jsp'>try again</a>");
				}
			%>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>