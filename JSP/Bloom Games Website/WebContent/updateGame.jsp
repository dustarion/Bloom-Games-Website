<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
    	<meta charset="ISO-8859-1">
        <title>Update Game</title>
        
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
            <a class="active" href="updateGame.jsp"><i class="fas fa-cog"></i> Update Games</a>
            <a href="deleteGame.jsp"><i class="fas fa-trash"></i> Delete Games</a>

            <p>Genres</p>
            <a href="addGenre.jsp"><i class="fas fa-pen"></i> Add Genres</a>
            <a href="updateGenre.jsp"><i class="fas fa-cog"></i> Update Genres</a>
            <a href="deleteGenre.jsp"><i class="fas fa-trash"></i> Delete Genres</a>

            <a class="logout" href="#">Logout <i class="fas fa-sign-in-alt"></i></a>
        </div>

        <div class="adminSection">
            <h3>Update Game</h3>

            <form class="mainFormCard" action="updateGameProcess.jsp">
                
                <!-- Select Game to Update -->
                <p>Select Game to Update</p>
                <div class="selectBox">
                	<select name="gameID">

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
					
								String sqlgenreName = "SELECT * FROM games";
								ResultSet rsGN = stmt.executeQuery(sqlgenreName);
								
								while(rsGN.next()){
									out.print("<option value=\"" + rsGN.getInt("gameID") + "\">"+ rsGN.getString("gameTitle") + "</option>");
								}
								conn.close();
							}catch (Exception e) {
							
							}
					%> 
              		</select>
              	</div>
              	<br>
              	<br>
              	<br>
                
                <!-- Game Title -->
                <p>Game Title</p>
                <input class="formTextField" type="text" name="gameTitle" placeholder="Enter Game Title">
                <br>
                
                <!-- Game Description -->
                <p>Game Description</p>
                <textarea name="gameDescription" cols="40" rows="5" class="formTextField" type="textarea" placeholder="Enter Game Description"></textarea>
                <br>

                <!-- Company Name -->
                <p>Company</p>
                <input class="formTextField" type="text" name="company" placeholder="Enter Company Name">
                <br>

                <p>Release Date</p>
                <input class="formTextField" type="date" name="releaseDate">
                <br>

                <p>Price</p>
                <input class="formTextField" type="number" name="price" placeholder="Enter Price">
                <br>

                <p>Trailer Link</p>
                <input class="formTextField" type="text" name="trailer" placeholder="Enter a Youtube Link">
                <br>

                <p>Purchase Link</p>
                <input class="formTextField" type="text" name="purchase" placeholder="Enter a Purchase Link (e.g. steam)">
                <br>

                <!-- Image -->
                <p>Image</p>
                <input class="formTextField" type="text" name="imageLink" placeholder="Enter an Image Link">
                <br>

                <!-- Genre -->
                <p>Genre</p>
                <br>
                
                <!-- Load Genre From Database -->
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
							out.print("<input type=\"checkbox\" name=\"genreID\" value=\""+ rsGN.getInt("genreID") + "\">" + "<span class =\"inlinePara\">" + rsGN.getString("genreName")+ "</span>"+"<br>");
						}
						conn.close();
					}catch (Exception e) {
					
					}
				%>
                
               <!--  <input type="checkbox" name="genreID" value="Shooter">
                <span class ="inlinePara">Shooter</span>
                <br>
                <input type="checkbox" name="genreID" value="Action">
                <span class ="inlinePara">Action</span>
                <br>
                <input type="checkbox" name="genreID" value="Adventure">
                <span class ="inlinePara">Adventure</span>
                <br>
                <input type="checkbox" name="genreID" value="Survival">
                <span class ="inlinePara">Survival</span>
                <br> -->
                
                <br>
                <br>

                <!-- Radio Preowned -->
                <p>Pre-Owned</p>
                <br>
                <input type="checkbox" name="preOwned" value="1"><span class ="inlinePara">Pre-Owned</span><br>


                <!-- Submit -->
                <input type="submit" value="Update">

            </form>
        </div>

        <footer>
            <div class = footing>
            <!-- © 2019 ™Bloom Games -->
            <p>&copy; 2019 &trade;Bloom Games</p>
            </div>
        </footer>

    </body>
</html>
