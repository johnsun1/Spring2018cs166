<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css" >
		<title>CS166 Project - Post</title>
	</head>
	
	<body>
		<% if (session.getAttribute("username") != null) {  %>
		<%@include file="include/HTML/nav_bar_member.html" %>
			<div class="container">
			
				<form action='blog_create_action.jsp' method='post'>
					<div class='form-group'>
						<label for='title'>Title</label>
						<input type='text' class='form-control' name='title'>
					</div>
					
					<div class='form-group'>
						<label for='body'>Body</label>
						<textarea class='form-control' name='body'  rows="20"></textarea>
					</div>
					
					<input type='submit' value='Post' class='btn btn-success'>
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