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
	String gameID = request.getParameter("gameID");
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
	if (genre != null){
		int[] genre_id = new int [genre.length];
		for(int i=0; i<genre.length; i++){
			try{
				genre_id[i] = Integer.parseInt(genre[i]);
			}catch(NumberFormatException e){
				
			}
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
		
		String SQLPrice = "'" + priceString + "'";
		
		String sqlGameUpdate = "UPDATE games SET";
		// Check which fields are not null.
		
		int elementsBeingUpdated = 0;
		
		// gameTitle
		if (gameTitle != null || gameTitle.length() != 0) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " gameTitle = "+ gameTitle;
			
			elementsBeingUpdated ++;
		}
		
		// description
		if (description != null || description.length() != 0) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " description = "+ description;
			
			elementsBeingUpdated ++;
		}
		
		// company
		if (company != null || company.length() != 0) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " company = "+ company;
			
			elementsBeingUpdated ++;
		}
		
		// releaseDate
		if (releaseDate != null || releaseDate.length() != 0) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " releaseDate = "+ releaseDate;
			
			elementsBeingUpdated ++;
		}
		
		// price
		if (price != 0) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " price = "+ SQLPrice;
			
			elementsBeingUpdated ++;
		}
		
		// trailerLocation
		if (releaseDate != null || releaseDate.length() != 0) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " releaseDate = "+ releaseDate;
			
			elementsBeingUpdated ++;
		}
		
		// purchaseLocation
		if (releaseDate != null || releaseDate.length() != 0) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " releaseDate = "+ releaseDate;
			
			elementsBeingUpdated ++;
		}
		
		// imageLocation
		if (releaseDate != null || releaseDate.length() != 0) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " releaseDate = "+ releaseDate;
			
			elementsBeingUpdated ++;
		}
		
		// preOwned
		if (releaseDate != null || releaseDate.length() != 0) {
			if (elementsBeingUpdated > 0) {
				sqlGameUpdate += ",";
			}

			sqlGameUpdate += " releaseDate = "+ releaseDate;
			
			elementsBeingUpdated ++;
		}
		
		
		
		
		
		sqlGameUpdate += "WHERE condition;";
		
		
		
		
/* 		UPDATE table_name
		SET column1 = value1, column2 = value2, ...
		WHERE condition; */
		
		
		
		
		//Populating the Game Entity
		String sqlGameUpdate = "INSERT INTO games (gameTitle, description, company, releaseDate, price, trailerLocation, purchaseLocation, imageLocation, preOwned, creatorID)  VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement ps = conn.prepareStatement(sqlGameInsert);
		ps.setString(1, gameTitle);
		ps.setString(2, description);
		ps.setString(3, company);
		ps.setString(4, releaseDate);
		ps.setDouble(5, price);
		ps.setString(6, trailerLocation);
		ps.setString(7, purchaseLocation);
		ps.setString(8, imageLocation);
		
		if (preOwned != 1) {
			ps.setString(9, 0);
		} else {
			ps.setString(9, 1);
		}
		ps.setInt(10, 1);
		
/* 		ps.setInt(6, price);
		ps.setString(7, imgLoc);
		ps.setString(8, NP); */
		int countGame = ps.executeUpdate();	
		
		
		//Populating Genre Entity
		/* String genreSqlStr = "INSERT INTO game_genre(gameID, genreID) VALUES (?, ?)";
		PreparedStatement psGenre = conn.prepareStatement(genreSqlStr);
		int countGenre = 0;
		for(int i=0; i<genre.length; i++){
			psGenre.setInt(1, gameId);
			psGenre.setInt(2, genre_id[i]);	
			countGenre = psGenre.executeUpdate();
		} */
		
		//display message
		//if (countGenre > 0 && countGame > 0) {
			out.print("<h1>Game Successfully added!</h1>");
			out.print("<a href='controlPanel.jsp'>Click here to return to Control Panel");
		//} else {
			//JOptionPane.showMessageDialog(null, "Error adding game", "Error", JOptionPane.ERROR_MESSAGE);
		//}

		conn.close();
	} catch (Exception e) {
		out.print("stage 2");
		out.print(e);
	}
%>




</body>
</html>