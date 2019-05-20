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
	String genreTitle = request.getParameter("genreTitle");
	
	if (genreTitle != null) { if (!genreTitle.isBlank()) {
		try {
			
			//Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
	
			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/db1?user=root&password=12345&serverTimezone=UTC";
	
			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
	
			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();
		
			// Add Genre Statements
			String addGenreSqlStr = "INSERT INTO genre (genreName) VALUES (\"" + genreTitle + "\")";
			//INSERT INTO `db1`.`genre` (`genreName`) VALUES ('Test');
			
			// String deleteGameSqlStr = "DELETE FROM games WHERE (gameID = "+ gameIDString +");";
			PreparedStatement ps = conn.prepareStatement(addGenreSqlStr);
			ps.executeUpdate();
			
			///display message
			out.print("<h1>Sucess</h1>");
			out.print("<a href='admin.jsp'>Click here to return to Dashboard");
	
			conn.close();
		} catch (Exception e) {
			out.print(e);
		}
	}}
	
	else {
		out.print("<h1>Field Empty</h1>");
		out.print("<a href='admin.jsp'>Click here to return to Dashboard");
	}
%>




</body>
</html>