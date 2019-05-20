<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Update Game</title>
	</head>
<body>

<%
	// Initialise Variables
	String gameIDString = request.getParameter("gameID");
	String gameTitle = request.getParameter("gameTitle");
	String description = request.getParameter("gameDescription");
	String company = request.getParameter("company");
	String releaseDate = request.getParameter("releaseDate");
	String priceString = request.getParameter("price");
	String trailerLocation = request.getParameter("trailer");
	String purchaseLocation = request.getParameter("purchase");
	String imageLocation = request.getParameter("imagelink");
	String[] genre = request.getParameterValues("genreID");
	String preOwnedString = request.getParameter("preOwned");
	
	// Convert gameID to an integer
	int gameID = 0;
	try {
			gameID = Integer.parseInt(gameIDString);
	} catch (NumberFormatException nfe) {
	  	    System.err.println("NumberFormatException: " + nfe.getMessage());
	}
	
	// Convert Price to a float
	double price = 0.0;
	try {
		if (!priceString.isEmpty()) {
   			price = Double.parseDouble(priceString);
		}
 	} catch (NumberFormatException nfe) {
  	    System.err.println("NumberFormatException: " + nfe.getMessage());
  	  out.print("Price is Wrong");
  	}
	
	// creating an int array of genre_id
	int[] genre_id = {};
	if (genre != null){
		genre_id = new int [genre.length];
		for(int i=0; i<genre.length; i++){
			try{
				genre_id[i] = Integer.parseInt(genre[i]);
			}catch(NumberFormatException e){
				
			}
		}
	}
	
	// Convert preOwned to an integer
	int preOwned = 0;
	try {
		preOwned = Integer.parseInt(preOwnedString);
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
	
		// gameID is set to auto_increment
		
		String SQLPrice = "'" + priceString + "'";
		
		String sqlGameUpdate = "UPDATE games SET";
		// Check which fields are not null.
		
		int elementsBeingUpdated = 0;
		
		// gameTitle
		if (gameTitle != null) { if (!gameTitle.isBlank()) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " gameTitle = \""+ gameTitle +"\"";
			
			elementsBeingUpdated ++;
		}}

		// description
		if (description != null) { if (!description.isBlank()) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " description = \""+ description +"\"";
			
			elementsBeingUpdated ++;
		}}
		
		// company
		if (company != null) { if (!company.isBlank()) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " company = \""+ company +"\"";
			
			elementsBeingUpdated ++;
		}}
		
		// releaseDate
		if (releaseDate != null) { if (!releaseDate.isBlank()) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " releaseDate = '"+ releaseDate +"'";
			
			elementsBeingUpdated ++;
		}}
		
		// price
		if (price != 0) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " price = "+ SQLPrice;
			
			elementsBeingUpdated ++;
		}
		
		// trailerLocation
		if (trailerLocation != null) { if (!trailerLocation.isBlank()) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " trailerLocation = \""+ trailerLocation +"\"";
			
			elementsBeingUpdated ++;
		}}
		
		// purchaseLocation
		if (purchaseLocation != null) { if (!purchaseLocation.isBlank()) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " purchaseLocation = \""+ purchaseLocation +"\"";
			
			elementsBeingUpdated ++;
		}}
		
		// imageLocation
		if (imageLocation != null) { if (!imageLocation.isBlank()) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " imageLocation = \""+ imageLocation +"\"";
			
			elementsBeingUpdated ++;
		}}
		
		
		
		// preOwned
		if (elementsBeingUpdated > 0) {
			sqlGameUpdate += ",";
		}
		
		sqlGameUpdate += " preOwned = '"+ preOwned + "'";
		elementsBeingUpdated ++;

		// Close it off
		sqlGameUpdate += " WHERE (gameID = " + gameIDString + ");";
		
		// Send Request To Server
		PreparedStatement ps = conn.prepareStatement(sqlGameUpdate);
		ps.executeUpdate();
		
		//Updating Genre Entity
		int countGenre = 0;
		if (genre != null){
			
			// Remove all current rows with gameID
			String resetGenreSqlStr = "DELETE FROM game_genre WHERE (gameID = "+ gameIDString +");";
			System.err.println(resetGenreSqlStr);
			PreparedStatement psResetGenre = conn.prepareStatement(resetGenreSqlStr);
			psResetGenre.executeUpdate();
			
			// Update new rows
			String genreSqlStr = "INSERT INTO game_genre(gameID, genreID) VALUES (?, ?)";
			PreparedStatement psGenre = conn.prepareStatement(genreSqlStr);
		
			for(int i=0; i<genre.length; i++){
				psGenre.setInt(1, gameID);
				psGenre.setInt(2, genre_id[i]);	
				countGenre = psGenre.executeUpdate();
			}
		}
		
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