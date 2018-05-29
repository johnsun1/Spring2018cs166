<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<%@include file="include/JSP/READ_DB.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>CS166 Project - Corporate Gladiators Ladder</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	
	<body>
	<% if (session.getAttribute("username") != null) {  %>
	<%@include file="include/HTML/nav_bar_member.html" %>
		<%
			//Query database for all company standings
			String query = "SELECT * FROM CorporateGladiators ORDER BY rating DESC;";
			PreparedStatement prepStmt = conn.prepareStatement(query);
			ResultSet rs = prepStmt.executeQuery();
			
			//Counter to keep track of company rankings
			int count = 1;
		%>
		<div class="container">
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">Rank</th>
		      <th scope="col">Name</th>
		      <th scope="col">Rating</th>
		      <th scope="col">Wins</th>
		      <th scope="col">Losses</th>
		    </tr>
		  </thead>
		  <tbody>
			<% while (rs.next()){ %>
				<tr>
					<th scope="row"><% out.print(count++); %></th>
					<td><% out.print(rs.getString("name")); %></td>
					<td><% out.print(rs.getInt("rating")); %></td>
					<td><% out.print(rs.getInt("win")); %></td>
					<td><% out.print(rs.getInt("loss")); %></td>
				</tr>
			<% } %>
		  </tbody>
		</table>
		<br><p>Click <a href='corporate_gladiators.jsp'>here</a> to vote again.</p>
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