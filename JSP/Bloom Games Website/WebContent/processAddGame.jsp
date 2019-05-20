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
	//----------INIT--------------
	String name = request.getParameter("gameName");
	String description = request.getParameter("gameDescription"); 
	int price = Integer.parseInt(request.getParameter("price"));
	String company = request.getParameter("gameCompany"); 
	String releaseDate = request.getParameter("releaseDate"); 
	String imgLoc = request.getParameter("imageLocation"); 
	String NP = request.getParameter("preowned"); 
	String[] genre = request.getParameterValues("genre_id");
	
	//creating an int array of genre_id
	int[] genre_id = new int [genre.length];
	for(int i=0; i<genre.length; i++){
		try{
			genre_id[i] = Integer.parseInt(genre[i]);
		}catch(NumberFormatException e){
			
		}
	}

	try{
		Class.forName("com.mysql.jdbc.Driver");
	
		String connURL = "jdbc:mysql://localhost/db1?user=root&password=12345&serverTimezone=UTC";
	
		Connection conn = DriverManager.getConnection(connURL);

		Statement stmt = conn.createStatement();
		
		String gameIdSql = "SELECT game_id FROM game ORDER BY game_id";
		ResultSet rsGame = stmt.executeQuery(gameIdSql);
		
		//getting new game_id for new game
		rsGame.last();
		int gameId = rsGame.getInt("game_id") + 1;

		//Populating the Game Entity
		String sqlStr = "INSERT INTO game (game_id, game_title, company, release_date, description, price, image_location, preowned) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = conn.prepareStatement(sqlStr);
		ps.setInt(1, gameId);
		ps.setString(2, name);
		ps.setString(3, company);
		ps.setString(4, releaseDate);
		ps.setString(5, description);
		ps.setInt(6, price);
		ps.setString(7, imgLoc);
		ps.setString(8, NP);
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