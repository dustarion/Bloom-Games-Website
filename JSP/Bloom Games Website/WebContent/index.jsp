<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
    
    	<meta charset="ISO-8859-1">
        <title>Home</title>
        
        <!-- CSS File -->
        <link rel="stylesheet" type="text/css" href="styles.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

    </head>
    <body>

        <!-- Navigation Bar -->
        <div class="topnav">
            <!-- Logo -->
            <a class="logo" href="index.jsp"><img src="images/main/BloomLogo.png"> </a>

            <!-- Menu -->
            <a class="active" href="index.jsp">Home <i class="fas fa-home"></i></a>
            <a href="search.jsp">Search <i class="fas fa-search"></i></a>
            <!-- <a href="admin.jsp">Admin <i class="fas fa-user-alt"></i></a> -->

            <!-- Login -->
            <a class="login" href="login.jsp">Login <i class="fas fa-sign-in-alt"></i></a>
        </div>

        <div class="homeSection1">
            <!-- Main Banner -->
            <div class="mainBanner">
                <h1>Power To The Players</h1>
            </div>

            <!-- Seperator -->
            <div class="pageSeperator"></div>
        </div>

        <div class="homeSection2">
            <h2>Latest Releases</h2>
            
            <!-- Load Games From Database -->
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
	
				String gamesSqlStr = "SELECT * FROM games";
				ResultSet rs = stmt.executeQuery(gamesSqlStr);
				
				while(rs.next()){
					
					// Load Game
		            out.print("<div class=\"gameCard\">");
						
		            	// Thumbnail
		                out.print("<img src=\"" + rs.getString("imageLocation") + "\">");

		                out.print("<h3>" + rs.getString("gameTitle") + "</h3>");
		                // http://localhost:8080/Bloom_Games_Website/Wenimages/games/nomanssky.jpg
		                
		                String shortDesc = rs.getString("description").substring(0, 247);
		                shortDesc += "...";
		                // Shorten the string to fit within rs.getString("imageLocation")
		                out.print("<p>" + shortDesc + "</p>");
		                
		                // Create Link With gameId
		                
		                //updateGenreProcess.jsp?genreID=6
		                String gameLink = "game.jsp?gameID=" + rs.getString("gameID");
		                
		                // Buttons
		                out.print("<a href=\"" + gameLink + "\" class=\"primaryButton\">Get the Game</a>");
		                
		                out.print("</div>");
				}
				conn.close();
			}catch (Exception e) {
			
			}
            
            
            
            %>

        </div>

        <footer>
            <!-- © 2019 ™Bloom Games -->
            <p>&copy; 2019 &trade;Bloom Games</p>
        </footer>

    </body>
</html>
