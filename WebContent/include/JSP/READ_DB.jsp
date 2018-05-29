<!-- 
		CS 166 Project by John Sun at San Jose State University
		johnsun659@gmail.com
-->

<%@page import="java.sql.*" %>
<%

//Locally hosted
String host = ""; //Database IP
String schema = "cs166project"; //Schema name
String user = ""; //User name
String pass = ""; //Password
String port = "3306"; //Port number


	String jdbc = "jdbc:mysql://" + host + ":" + port + "/" + schema + "?user=" + user + "&password=" + pass;
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection conn = DriverManager.getConnection(jdbc);

%>