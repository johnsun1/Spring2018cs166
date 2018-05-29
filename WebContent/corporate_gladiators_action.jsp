<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<%@include file="include/JSP/WRITE_DB.jsp" %>
<%@page import="Ratings.ELOCalculator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>CS166 Project - Corporate Gladiators</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
		
		
	<body>
		<% //if (session.getAttribute("username") != null) {  %>
		<%
				//Get user input
				String company_one = request.getParameter("company_one");
				String company_two = request.getParameter("company_two");
				String company_name = request.getParameter("company_name"); //Chosen company
		
				//Determine which company was not chosen
				String notPicked;
				
				if (company_name.equals(company_one)) {
					notPicked = company_two;
				} else {
					notPicked = company_one;
				}
				
				//Get ratings for both companies
				String query = "SELECT * FROM CorporateGladiators WHERE name = ?;";
				
				PreparedStatement prepStmt = conn.prepareStatement(query);
				prepStmt.setString(1, company_name);
				ResultSet rs = prepStmt.executeQuery();
				rs.next();
				int chosen_rating = rs.getInt("rating");
				int chosen_win = rs.getInt("win");
				
				prepStmt = conn.prepareStatement(query);
				prepStmt.setString(1, notPicked);
				rs = prepStmt.executeQuery();
				rs.next();
				int not_chosen_rating = rs.getInt("rating");
				int not_chosen_loss = rs.getInt("loss");
				
				ELOCalculator calc = new ELOCalculator();
				
				//The first "player" is always the winner, therefore the winner is 'a'
				int[] new_ratings = calc.calculateRating(chosen_rating, not_chosen_rating, 'a');
			
				//Update ratings
				String updateQuery = "UPDATE CorporateGladiators SET rating=? WHERE name=?;";
				PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
				updateStmt.setInt(1, new_ratings[0]); //Update player A
				updateStmt.setString(2, company_name);
				updateStmt.executeUpdate();
				
				updateStmt = conn.prepareStatement(updateQuery);
				updateStmt.setInt(1, new_ratings[1]);
				updateStmt.setString(2, notPicked);
				updateStmt.executeUpdate();
				
				//Update win/loss
				//Update winner record
				String wUpdate = "UPDATE CorporateGladiators SET win=? WHERE name=?;";
				PreparedStatement wlStmt = conn.prepareStatement(wUpdate);
				wlStmt.setInt(1, chosen_win+1);
				wlStmt.setString(2, company_name);
				wlStmt.executeUpdate();
				
				//Update loser record
				String lUpdate = "UPDATE CorporateGladiators SET loss=? WHERE name=?;";
				wlStmt = conn.prepareStatement(lUpdate);
				wlStmt.setInt(1, not_chosen_loss+1);
				wlStmt.setString(2, notPicked);
				wlStmt.executeUpdate();
				
				//Redirect to user protected zone
				response.sendRedirect("corporate_gladiators_list.jsp");
		%>

		<% 
	    //} else {
	    //	out.println("You need to be <a href='index.jsp'>logged in</a> to view this content.");
		//}
		%>
	</body>
</html>