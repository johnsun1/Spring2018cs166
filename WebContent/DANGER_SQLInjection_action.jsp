<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<%@include file="include/JSP/READ_DB.jsp" %>
<%@page import="java.sql.*, java.security.*, java.math.BigInteger, java.nio.charset.StandardCharsets" %>
<%
	/**
		CS 166 Project by John Sun at San Jose State University
		john.sun@sjsu.edu
	**/
%>
<html>
	<head>
		<title>CS166 Project - SQL Injection Demo Page</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	<body>
	<% if (session.getAttribute("username") != null) {  %>
		<%
			//Get user input
			String username = request.getParameter("username");
			String password = request.getParameter("password");
					
			//Prepare SQL query - BAD PRACTICE
			String query = "SELECT * FROM Users WHERE username='" + username + "' AND password=" + password; 
			PreparedStatement userQuery = null;
			ResultSet rs = null;
			
			try {
				userQuery = conn.prepareStatement(query);
				rs = userQuery.executeQuery();

				//Check if query returned any results
				//If there are no results, user failed to log in
				if (rs.next()) {
					//Move cursor back, beyond first row
						%>
						<p>You have been successfully authenticated without valid user credentials. Spooky!</p>
						<p>Thankfully, these kinds of attacks are pretty easy to prevent. By using query parameterization.
						In Java, this means using the features of the PreparedStatement as follows:</p>
<pre><code>
String query = "SELECT * FROM Users WHERE username=? AND password=?;";
PreparedStatement secureQuery = connection.prepareStatement(query);
secureQuery.setString(1, username);
secureQuery.setString(2, password);
ResultSet rs = secureQuery.executeQuery();
</code></pre>
						<p>The user is not directly building the query string. Whatever the user enters, it will be treated as a string and not SQL. This also works for cases where valid user input can include some special characters. Building the query string by concatenating user input will result in an SQL error in this case.</p>
						<p>Click <a href='DANGER_demo_list.jsp'>here</a> to go back.</p>
					<% 
				} else {
						out.println("Whops something went wrong. <a href='DANGER_demo_list.jsp'>try again</a>");
				}
			} catch (SQLException ex) {
				//out.print(ex); //DEBUGGING
			}
		
			
		%>
			<% 
		} else {
				out.println("You need to be <a href='index.jsp'>logged in</a> to view this content.");
		} 
	%>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>