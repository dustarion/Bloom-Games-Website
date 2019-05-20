<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="ISO-8859-1">
        <title>Add Game</title>

        <!-- CSS File -->
        <link rel="stylesheet" type="text/css" href="styles.css">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

    </head>
    <body>

        <!-- Navigation Bar -->
        <div class="topnav">
            <!-- Logo -->
            <a class="logo" href="index.html"><img src="images/main/BloomLogo.png"> </a>

            <!-- Menu -->
            <a href="index.html">Home <i class="fas fa-home"></i></a>
            <a href="search.html">Search <i class="fas fa-search"></i></a>
            <a class="active" href="admin.html">Admin <i class="fas fa-user-alt"></i></a>

            <!-- Login -->
            <a class="login" href="index.html">Logout <i class="fas fa-sign-in-alt"></i></a>
        </div>

        <div class="sidenav">
            <h1>Admin Panel</h1>

            <a href="admin.html"><i class="fas fa-columns"></i> Dashboard</a>

            <p>Games</p>
            <a class="active" href="addGames.html"><i class="fas fa-pen"></i> Add Games</a>
            <a href="#"><i class="fas fa-cog"></i> Update Games</a>
            <a href="#"><i class="fas fa-trash"></i> Delete Games</a>

            <p>Genres</p>
            <a href="#"><i class="fas fa-pen"></i> Add Genres</a>
            <a href="#"><i class="fas fa-cog"></i> Update Genres</a>
            <a href="#"><i class="fas fa-trash"></i> Delete Genres</a>

            <a class="logout" href="#">Logout <i class="fas fa-sign-in-alt"></i></a>
        </div>

        <div class="adminSection">
            <h3>Add Game</h3>

            <!-- Add Game Form -->
            <form class="mainFormCard" action="addGameProcess.jsp">

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
                <input class="formTextField" type="date" name="releaseDate" placeholder="YYYY/MM/DD">
                <br>

                <p>Price</p>
                <input class="formTextField" type="number" name="price" placeholder="Enter Price" min="0" value="0" step=".01" required>
                <br>

                <p>Trailer Link</p>
                <input class="formTextField" type="text" name="trailer" placeholder="Enter a Youtube Link">
                <br>

                <p>Purchase Link</p>
                <input class="formTextField" type="text" name="purchase" placeholder="Enter a Purchase Link (e.g. steam)">
                <br>

                <!-- Image -->
                <p>Image Location</p>
                <input class="formTextField" type="text" name="imagelink" placeholder="Enter Image Link">
                <br>

                <!-- Genre -->
                <p>Genre</p>
                
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
							out.print("<input type=\"checkbox\" name=\"genreID\" value=\""+ rsGN.getInt("genreID") + "\">" + "<span class =\"inlinePara\">" + rsGN.getString("genreName")+ "</span>"+"<br>");
						}
						conn.close();
					}catch (Exception e) {
					
					}
				%>
                
<%--                 <div class="selectBox">
	                <select name="Select Genres" multiple>
	                    <!-- <option value="All" selected>All Genres</option> -->
	                    <!-- <option value="Adventure">Adventure</option>
	                    <option value="FPS">FPS</option>
	                    <option value="Survival">Survival</option>
	                    <option value="Strategy">Strategy</option> -->
                
		                <!-- Load Genres From Database -->
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
			         				out.print("<option name=\"genreID\" value=\"" + rsGN.getInt("genreID") + "\">" + rsGN.getString("genreName") + "</option>");
			        			}
			        			
			        			conn.close();
			        		}catch (Exception e) {
			        			out.print(e);
			        		}
		                %>
                
                	</select>
                </div> --%>
                <br>

                <!-- Radio Preowned -->
                <p>Pre-Owned</p>
                <div class="radioPreowned">
                <ul>  
                    <li>
                        <input type="radio" id="s-option" name="preOwned">
                        <label for="s-option">New</label>
                        <div class="check"><div class="inside"></div></div>
                    </li>
                      
                    <li>
                        <input type="radio" id="t-option" name="preOwned">
                        <label for="t-option">Preowned</label>
                        <div class="check"><div class="inside"></div></div>
                    </li>
                </ul>
                </div>


                <!-- Submit -->
                <input type="submit" value="Submit">




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
