<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<%@include file="include/JSP/WRITE_DB.jsp" %>
<%@page import="JSON.Util, java.security.*, java.math.BigInteger, java.nio.charset.StandardCharsets, java.lang.String" %>

<html>
	<head>
		<title>CS166 Project - Registration</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	<body>
			<%	
				//Query DB to check for duplicate usernames
				String qstr = "SELECT * FROM Users WHERE username=?;";
				PreparedStatement qstrstmt = conn.prepareStatement(qstr);
			
				//Get user input
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				qstrstmt.setString(1, username);
				ResultSet bird = qstrstmt.executeQuery(); //Check for existing username
				
				
				//Hash password
				MessageDigest md = MessageDigest.getInstance("SHA-256");
				byte[] passwordBytes = password.getBytes(StandardCharsets.UTF_8); //Turn string into byte array
				byte[] digest = md.digest(passwordBytes); //Use newly generated byte array to get hash
				String hashedPassword = String.format("%032X", new BigInteger(1, digest));
				
				//Check for empty input and captcha response
				if ( !bird.next() && (!username.equals("") && !password.equals(""))) {
					//Prepare SQL query
					String query = "INSERT INTO Users (username, password) VALUES(?, ?);";
					
					PreparedStatement secureQuery = null;
					int rs = 0;
					
					try {
						secureQuery = conn.prepareStatement(query);
						
						//Set parameters of query
						secureQuery.setString(1, username);
						secureQuery.setString(2, hashedPassword);
						
						//Create account
						rs = secureQuery.executeUpdate();
					
						//Check if query returned any results
						//If there are no results, user failed to log in
						if (rs == 1) {
							//Start user session
							//Create a session and create attributes for later use
							HttpSession se = request.getSession(true);
							String uiq = "SELECT * FROM Users WHERE username=?";
							PreparedStatement prepStmt = conn.prepareStatement(uiq);
							prepStmt.setString(1, username);
							ResultSet ui = prepStmt.executeQuery();
							ui.next(); //Move cursor to first tuple
							
							se.setAttribute("username", username);
							se.setAttribute("id", ui.getInt("id"));
							se.setMaxInactiveInterval(300); //Set time before session is invalidated
						%> 
					<% 	
							//Redirect to user protected zone
							out.println("Registration successful. Click <a href='blog_list.jsp'>here</a> to continue.");
						} else {
							//Redirect to login page with error message
							out.println("Registration failed. Click <a href='register.jsp'>here</a> to continue.");
						}
						
					} catch (SQLException ex) {
						//out.println(ex);
					}
					%>
					<%
				} else {
					//User forgot to enter either username, password, or both
					out.println("Registration failed, due to failed captcha or invalid username or password; or maybe that user already exists. Click <a href='register.jsp'>here</a> to continue.");
				}
				
			%>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>