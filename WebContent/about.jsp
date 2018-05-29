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
		<title>CS166 Project - About Us</title>
	</head>
	<body>
	<%@include file="include/HTML/nav_bar_public.html" %>
		<div class="container">
			<p>My name is John Sun, and I have designed this website for my CS 166 semester project.</p>
		</div>
		<%@include file="include/HTML/footer.html" %>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>