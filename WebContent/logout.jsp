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
		<title>CS166 Project - Logout</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	<body>
			<%
				request.getSession().invalidate();
				response.sendRedirect("index.jsp");
			%>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>