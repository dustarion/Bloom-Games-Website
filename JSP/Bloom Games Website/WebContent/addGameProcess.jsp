<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
	</head>
<body>

<%
	// Initialise Variables
	
	String gameTitle = request.getParameter("gameTitle");
	String description = request.getParameter("gameDescription");
	String company = request.getParameter("company");
	String releaseDate = request.getParameter("releaseDate");
	String priceString = request.getParameter("price");
	String trailerLocation = request.getParameter("trailer");
	String purchaseLocation = request.getParameter("purchase");
	String imageLocation = request.getParameter("imagelink");
	String[] genre = request.getParameterValues("genreID");
	String preOwned = request.getParameter("preOwned");
	
	
	// Convert Price to a float
	try {
   		float price = Float.parseFloat(priceString);
 	} catch (NumberFormatException nfe) {
  	    System.err.println("NumberFormatException: " + nfe.getMessage());
  	  out.print("Price is Wrong");
  	}
	
	//creating an int array of genre_id
	int[] genre_id = new int [genre.length];
	for(int i=0; i<genre.length; i++){
		try{
			genre_id[i] = Integer.parseInt(genre[i]);
		}catch(NumberFormatException e){
			
		}
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
	
		// gameID is set to auto_increment

		//Populating the Game Entity
		String sqlStr = "INSERT INTO games (gameTitle, description, company, releaseDate, price, trailerLocation, purchaseLocation, imageLocation, preOwned) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = conn.prepareStatement(sqlStr);
		ps.setString(1, name);
		ps.setString(2, company);
		ps.setString(3, releaseDate);
		ps.setString(4, description);
		ps.setInt(5, price);
		ps.setString(6, imgLoc);
		ps.setString(7, NP);
		int countGame = ps.executeUpdate();		
		
		//Populating Genre Entity
		String genreSqlStr = "INSERT INTO game_genre(game_id, genre_id) VALUES (?, ?)";
		PreparedStatement psGenre = conn.prepareStatement(genreSqlStr);
		int countGenre = 0;
		for(int i=0; i<genre.length; i++){
			psGenre.setInt(1, gameId);
			psGenre.setInt(2, genre_id[i]);	
			countGenre = psGenre.executeUpdate();
		}
		
		//display message
		if (countGenre > 0 && countGame > 0) {
			out.print("<h1>Game Successfully added!</h1>");
			out.print("<a href='controlPanel.jsp'>Click here to return to Control Panel");
		} else {
			JOptionPane.showMessageDialog(null, "Error adding game", "Error", JOptionPane.ERROR_MESSAGE);
		}

		conn.close();
	} catch (Exception e) {
		out.print(e);
	}
%>




</body>
</html>