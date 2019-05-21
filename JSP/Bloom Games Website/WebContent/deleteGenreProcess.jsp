<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Update Genre</title>
	</head>
<body>

<%
	// Initialise Variables
	String genreIDString = request.getParameter("genreID");
	
	try {
			
			//Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");
	
			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/db1?user=root&password=12345&serverTimezone=UTC";
	
			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
	
			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();
		
			// Delete Genre Statements
			String deleteGenreSqlStr = "DELETE FROM genre WHERE (genreID = "+ genreIDString +");";
			
			PreparedStatement ps = conn.prepareStatement(deleteGenreSqlStr);
			ps.executeUpdate();
			
			///display message
			response.sendRedirect("result.jsp");
	
			conn.close();
		} catch (Exception e) {
			out.print(e);
			response.sendRedirect("result.jsp");
		}
%>




</body>
</html>