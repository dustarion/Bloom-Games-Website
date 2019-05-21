<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
    
    	<meta charset="ISO-8859-1">
		<title>Search</title>
		
        <!-- CSS File -->
        <link rel="stylesheet" type="text/css" href="styles.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

    </head>
    <body>

        <!-- Nav Bar -->
        <div class="topnav">
            <!-- Logo -->
            <a class="logo" href="index.jsp"><img src="images/main/BloomLogo.png"> </a>

            <!-- Menu -->
            <a href="index.jsp">Home <i class="fas fa-home"></i></a>
            <a class="active" href="search.jsp">Search <i class="fas fa-search"></i></a>
            <!-- <a href="admin.jsp">Admin <i class="fas fa-user-alt"></i></a> -->

            <!-- Login -->
            <a class="login" href="login.jsp">Login <i class="fas fa-sign-in-alt"></i></a>
        </div>

        <!-- Search -->
        <div class="searchActionSection">
            <!-- <form action="/action_page.php"> -->
            <form action="search.jsp">
                <!-- Search Bar -->
                <input class="searchbar" type="text" name="SearchQuery" placeholder="Type Anything To Search">
                <br>

                <!-- Genre Dropdown -->
                <div class="selectBox">
                Select Genre :
                <select name="genreID">
                <option value="">All</option>

                   		<!-- Load from Database -->
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
									out.print("<option value=\"" + rsGN.getInt("genreID") + "\">"+ rsGN.getString("genreName") + "</option>");
								}
								conn.close();
							}catch (Exception e) {
							
							}
						%>
                        
                    </select>
                </div>
                
                <!-- Pre-Owned -->
                <br>
                <div class="radioPreowned">
                	<span class ="inlinePara">New</span>		<input type="radio" name="PreOwned" value="0">
                	<span class ="inlinePara">Preowned</span>	<input type="radio" name="PreOwned" value="1">
                	<br>
                </div>

                <input type="submit" value="Search">
            </form> 
        </div>

        <div class="searchResultsSection">
        
        	<%
        	try {
        		
        		// Initialise Variables
        		String searchQuery = request.getParameter("SearchQuery");
        		String genreID = request.getParameter("genreID");
        		String preOwned = request.getParameter("PreOwned");
				
				//Step1: Load JDBC Driver
				Class.forName("com.mysql.jdbc.Driver");
		
				// Step 2: Define Connection URL
				String connURL = "jdbc:mysql://localhost/db1?user=root&password=12345&serverTimezone=UTC";
		
				// Step 3: Establish connection to URL
				Connection conn = DriverManager.getConnection(connURL);
		
				// Step 4: Create Statement object
				Statement stmt = conn.createStatement();	

				String gamesSqlStr = "SELECT * FROM games ";
				
				if (searchQuery != null) {
					gamesSqlStr += "WHERE (gameTitle LIKE '%" + searchQuery + "%') ";
				} else {
					gamesSqlStr += "WHERE (gameTitle LIKE '%') ";
				}
				
				if (preOwned != null) {
					 if (preOwned.equals("1")) {
						 // PreOwned
						 gamesSqlStr += "AND (preOwned = 1);";
						 
					 } else {
						 // New
						 gamesSqlStr += "AND (preOwned = 0);";
					 }
				} else {
					// Cap Off the SQL
					gamesSqlStr += ";";
				}
						
				ResultSet rs = stmt.executeQuery(gamesSqlStr);
				
				while(rs.next()){
					
					boolean skip = false;
					
					if (genreID != "") {
						
						skip = true;
								
						String currentGameID = rs.getString("gameID");
						
						// Check if the genre matches
						String getGenreSqlStr = "SELECT * FROM game_genre WHERE (gameID = " + currentGameID+ ");";
						Statement stmt2 = conn.createStatement();	
						ResultSet rsGenre = stmt2.executeQuery(getGenreSqlStr);
						
						while(rsGenre.next()){
							if (rsGenre.getString("genreID").equals(genreID)) {
								skip = false;
							}
						}
						
					}
					
					if (!skip) {
					
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
				}
				conn.close();
        	} catch (Exception e) {
    			out.print(e);
    		}
        	
        	%>

        </div>

        <footer>
            <!-- © 2019 ™Bloom Games -->
            <p>&copy; 2019 &trade;Bloom Games</p>
        </footer>

    </body>
</html>
