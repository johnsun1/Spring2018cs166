<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<%if (session.getAttribute("username") !=  null) { response.sendRedirect("blog_list.jsp"); } %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css" >
		<title>CS166 Project - Register</title>
	</head>
	
	<body>
	<%@include file="include/HTML/nav_bar_public.html" %>
		<div class="container">
			<form id="registration_form" action="register_action.jsp" method="post">
				<div class="form-group">
					<label for="username">Username</label>
					<input type="text" class="form-control" name="username" maxlength="45">
				</div>
				
				<div class="form-group">
					<label for="password">Password</label>
					<input type="password" class="form-control" name="password" maxlength="100">
				</div>
				
				<input type="submit" value="Register" class="btn btn-success">
			</form>
		</div>
		<%@include file="include/HTML/footer.html" %>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>