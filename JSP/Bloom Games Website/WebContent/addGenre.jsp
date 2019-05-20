<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
    
    	<meta charset="ISO-8859-1">
        <title>Add Genre</title>
        
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
            <a href="index.jsp">Home <i class="fas fa-home"></i></a>
            <a href="search.jsp">Search <i class="fas fa-search"></i></a>
            <a class="active" href="admin.jsp">Admin <i class="fas fa-user-alt"></i></a>

            <!-- Login -->
            <a class="login" href="index.jsp">Logout <i class="fas fa-sign-in-alt"></i></a>
        </div>

        <div class="sidenav">
            <h1>Admin Panel</h1>

            <a href="admin.jsp"><i class="fas fa-columns"></i> Dashboard</a>

            <p>Games</p>
            <a href="addGames.jsp"><i class="fas fa-pen"></i> Add Games</a>
            <a href="updateGame.jsp"><i class="fas fa-cog"></i> Update Games</a>
            <a href="deleteGame.jsp"><i class="fas fa-trash"></i> Delete Games</a>

            <p>Genres</p>
            <a class="active" href="addGenre.jsp"><i class="fas fa-pen"></i> Add Genres</a>
            <a href="updateGenre.jsp"><i class="fas fa-cog"></i> Update Genres</a>
            <a href="deleteGenre.jsp"><i class="fas fa-trash"></i> Delete Genres</a>

            <a class="logout" href="#">Logout <i class="fas fa-sign-in-alt"></i></a>
        </div>

        <div class="adminSection">
            <h3>Add Genre</h3>
            <form class="mainFormCard" action="addGenreProcess.jsp">     	

                <!-- Genre Title -->
                <p>Genre Title</p>
                <input class="formTextField" type="text" name="genreTitle" placeholder="Enter New Genre Title">
                <br>

                <!-- Submit -->
                <input type="submit" value="Add Genre">
            </form>
            
            <!-- List Of Current Genres -->
            <br>
            <br>
            <br>
            <p><strong><i class="fas fa-gamepad"></i> Existing Genres</strong></p>
            <hr>
            
            
            <!-- Load From Database -->
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
							out.print("<span class=\"inlinePara\">" + rsGN.getString("genreName") + "</span><br><hr>");
						}
						conn.close();
					}catch (Exception e) {
					
					}
				%>
				
        </div>

        <footer>
            <div class = footing>
            <!-- © 2019 ™Bloom Games -->
            <p>&copy; 2019 &trade;Bloom Games</p>
            </div>
        </footer>

    </body>
</html>
