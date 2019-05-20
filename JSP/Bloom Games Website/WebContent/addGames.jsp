<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Genre</title>
</head>
<body>
	<form action="processAddGame.jsp" method="post">
	
		Enter Game Name: <input type="text" name="gameName" required> <br>
		Enter Game Description: <input type="text" name="gameDescription" required> <br> 
		Enter Game Price: <input type="number" name="price" min="0" value="0" step=".01" required> <br>
		
		Enter Game Genres: <br>


	<!-- Use Database -->	
	<%
		try{
			//Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/db1?user=root&password=12345&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
	
			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();

			String sqlgenreName = "SELECT * FROM genre";
			ResultSet rsGN = stmt.executeQuery(sqlgenreName);
			
 			while(rsGN.next()){
				out.print("<input type=\"checkbox\" name=\"genreID\" value=\""+ rsGN.getInt("genreID") + "\">" + rsGN.getString("genreName") +"<br>");
			}
			
			conn.close();
		}catch (Exception e) {
			out.print(e);
		}
		%>

		Enter Game Company: <input type="text" name="gameCompany" required><br>
		Enter Release Date: <input type="text" name="releaseDate" placeholder="YYYY/MM/DD"required><br>
		Image Location: <input type="text" name="imageLocation" required><br>
		Is the game new or preowned?<br> 
		<input type="radio"	name="preowned" value="N" required>New<br> 
		<input type="radio" name="preowned" value="P">Preowned<br> 
		
		<input type="submit" name="submitBtn" value="Submit"> 
		<input	type="reset" name="btnReset" value="Reset">
	</form>
	<br>
	
	<form action="controlPanel.jsp">
		<input type="submit" name="submit" value="Home">
	</form>

</body>
</html>