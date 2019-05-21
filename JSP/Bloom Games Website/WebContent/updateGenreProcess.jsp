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
	String genreTitle = request.getParameter("newGenreTitle");
	
	// Convert genreID to an integer
	int genreID = 0;
	try {
		genreID = Integer.parseInt(genreIDString);
	} catch (NumberFormatException nfe) {
		System.err.println("NumberFormatException: " + nfe.getMessage());
	}
	
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
		
			// Update Genre Statements
			String updateGenreSqlStr = "UPDATE genre SET genreName = \"" + genreTitle + "\" WHERE (genreID = " + genreID + ")";
			
			PreparedStatement ps = conn.prepareStatement(updateGenreSqlStr);
			ps.executeUpdate();
			
			///display message
			out.print("<h1>Sucess</h1>");
			response.sendRedirect("result.jsp");
	
			conn.close();
		} catch (Exception e) {
			out.print(e);
		}
	}}
	
	else {
		out.print("<h1>Field Empty</h1>");
		response.sendRedirect("result.jsp");
	}
%>




</body>
</html>