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
		<title>CS166 Project - Corporate Gladiators</title>
		<link rel="stylesheet" href="css/bootstrap.min.css" >
	</head>
	
	<body>
	<% //if (session.getAttribute("username") != null) {  %>
	<%
		//Query database for all company information
		String query = "SELECT * FROM CorporateGladiators ORDER BY id ASC;";
		PreparedStatement prepStmt = conn.prepareStatement(query);
		ResultSet rs = prepStmt.executeQuery();
		
		//Get size of result set
		String cQuery = "SELECT COUNT(*) FROM CorporateGladiators;";
		PreparedStatement cPrepStmt = conn.prepareStatement(cQuery);
		ResultSet cRs = cPrepStmt.executeQuery();
		cRs.next();
		
		int sizeOfTable = cRs.getInt("COUNT(*)");
		boolean flag = true;
		
		//Initialize ints with sentinel values
		int randomNumberOne = -1;
		int randomNumberTwo = -1;
		
		//Loop ensures the two numbers are not the same
		while (flag) {
			//Select two random companies
			randomNumberOne = Math.abs((int)Math.round(Math.random() * sizeOfTable));
			randomNumberTwo = Math.abs((int)Math.round(Math.random() * sizeOfTable));
			
			//Check if numbers are the same, and check for sentinel value
			if ((randomNumberOne != randomNumberTwo) && randomNumberOne != -1 && randomNumberTwo != -1) {
				flag = false;
			}
		}
		
		//Check for zeroth row (invalid in ResultSet)
		if (randomNumberOne == 0) {
			randomNumberOne = 1;
		} else if (randomNumberTwo == 0) {
			randomNumberTwo = 1;
		}
		
		rs.absolute(randomNumberOne);
		String companyOne = rs.getString("name");
		
		rs.absolute(randomNumberTwo);
		String companyTwo = rs.getString("name");
	%>
	<%@include file="include/HTML/nav_bar_member.html" %>
	
	<div class="container">
		<p>Which company do you like more?</p>
		
		<form action="corporate_gladiators_action.jsp" method="post">
			<input type="radio" name="company_name" value='<% out.print(companyOne); %>'><% out.print(" "+companyOne); %> <br>
			<input type="radio" name="company_name" value='<% out.print(companyTwo); %>'><% out.print(" "+companyTwo); %> <br>
			
			<input type="hidden" name="company_one" value='<% out.print(companyOne); %>'>
			<input type="hidden" name="company_two" value='<% out.print(companyTwo); %>'>
			<input type="submit" value="Vote" class="btn btn-primary">
		</form>
		<br><p>Click <a href="corporate_gladiators_list.jsp">here</a> to see company standings.</p>
	
	</div>
	
	
	<%@include file="include/HTML/footer.html" %>
	<% 
	    //} else {
	    //	out.println("You need to be <a href='index.jsp'>logged in</a> to view this content.");
		//}
	%>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>