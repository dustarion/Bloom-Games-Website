<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Delete Game</title>
	</head>
<body>

<%
	// Initialise Variables
	String gameIDString = request.getParameter("gameID");

	// Convert gameID to an integer
	int gameID = 0;
	System.err.println(gameIDString);
	try {
			gameID = Integer.parseInt(gameIDString);
	} catch (NumberFormatException nfe) {
	  	    System.err.println("NumberFormatException: " + nfe.getMessage());
	}
	
	try {
		
		//Step1: Load JDBC Driver
		Class.forName("com.mysql.jdbc.Driver");

		// Step 2: Define Connection URL
		String connURL = "jdbc:mysql://localhost/db1?user=root&password=12345&serverTimezone=UTC";

		// Step 3: Establish connection to URL
		Connection conn = DriverManager.getConnection(connURL);

		// Step 4: Create Statement object
		Statement stmt = conn.createStatement();
	
		// Delete Game Statements
		String deleteGameSqlStr = "DELETE FROM games WHERE (gameID = "+ gameIDString +");";
		PreparedStatement ps = conn.prepareStatement(deleteGameSqlStr);
		ps.executeUpdate();
		
		///display message
		out.print("<h1>Sucess</h1>");
		out.print("<a href='admin.jsp'>Click here to return to Dashboard");

		conn.close();
	} catch (Exception e) {
		out.print(e);
	}
%>




</body>
</html>