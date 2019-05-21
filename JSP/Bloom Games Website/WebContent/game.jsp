<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
    <head>
    
    	<meta charset="ISO-8859-1">
        <title>Game</title>
        
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

        <div class="gamePage">
        
        <!-- Load From Database -->
        <%
     	// Initialise Variables
    	String gameIDString = request.getParameter("gameID");
        
     	// Convert gameID to an integer
    	int gameID = 0;
    	try {
    			gameID = Integer.parseInt(gameIDString);
    	} catch (NumberFormatException nfe) {
    	  	    System.err.println("NumberFormatException: " + nfe.getMessage());
    	}
        
        try{
			//Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/db1?user=root&password=12345&serverTimezone=UTC";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			// Step 4: Create Statement object
			Statement stmt = conn.createStatement();

			String gamesSqlStr = "SELECT * FROM games WHERE gameID = " + gameIDString;
			ResultSet rs = stmt.executeQuery(gamesSqlStr);
			
			while(rs.next()){
				
				// Game Details
	            out.print("<div class=\"gameDetailsSection\"><div class=\"gameDetailsSectionLeft\"><div class=\"imageDetails\">");
				out.print("<img src=\"" + rs.getString("imageLocation") + "\">");
				out.print("<button class=\"primaryButton\" onclick=\"window.location.href = '" + rs.getString("purchaseLocation") + "';\">Purchase ($" + rs.getString("price") + ")</button>");
				
				out.print("</div></div><div class=\"gameDetailsSectionRight\"><div class=\"gameDetailsDescription\">");
				
				out.print("<h3>" + rs.getString("gameTitle") + "</h3>");
				out.print("<p>" + rs.getString("description") +"</p>");
				
				out.print("<table class=\"detailCard\"><tr><th>");
				out.print("<p><strong>Release Date</strong></p>");
				
				out.print("<p>" + rs.getString("releaseDate") + "</p></th><th>");
				
				out.print("<p><strong>Company</strong></p>");
				
				out.print("<p>" + rs.getString("Company") + "</p></th><th>");
				
				// Determine if Pre-Owned
				if (rs.getInt("preOwned") == 1) {
					// Pre-Owned
					out.print("<p class=\"highlight\">" + "Pre-Owned" + "</p>");
				} else {
					out.print("<p class=\"highlight\">" + "New" + "</p>");
				}
				                    
				out.print("</th></tr></table></div></div></div>");
				
				// Youtube Trailer
				String youtubeTrailer = "https://www.youtube.com/embed/";
				youtubeTrailer += rs.getString("trailerLocation").substring(32,43);
				
				out.print("<div class=\"trailerSection\"><div class=\"trailerCard\">");
				out.print("<iframe src=\"" + youtubeTrailer + "\" frameborder=\"0\" allow=\"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen>");
				out.print("</iframe></div></div>");
				
				
				
				
				
			}
			conn.close();
		}catch (Exception e) {
			System.err.println(e);
		}
        %>

            <div class="commentsSection">

            <form class="commentForm">
            <div class="commentFormName">
			<h3>Name</h3>
			<input class="textfield" type="text" name="name" placeholder="Enter Name Here" required>
                        
			</div>
			<div class="commentFormName">
			<h3>Rating</h3>
			<input class="textfield" type="number" min="0" max="5" value="5" step="1" name="rating" placeholder="Enter a rating from 1-5 here" required>
                        
			</div>
			<style type="text/css">
                        .hidden {
                            display: none;
                        }
			 </style>
			 
			 <%
			 	out.print("<input class=\"hidden\" type=\"text\" name=\"gameID\" value=\"" + gameID + "\">");
			 %>

                    <!-- Comment Box -->
                    <div class="commentBox">
                        <textarea name="comment" cols="40" rows="5" class="commentfield" type="textarea" name="comment" placeholder="Write Your Comment Here" required></textarea>
                    </div>

                    <!-- Post Button -->
                    <input type="submit" value="Post">
                </div>


				<!-- Load From Database -->
        		<%
     				// Initialise Variables
        			String commentName = request.getParameter("name");
        			String commentRating = request.getParameter("rating");
        			String commentText = request.getParameter("comment");
        			
        			if (commentText != null) {
	        			try{
							//Step1: Load JDBC Driver
							Class.forName("com.mysql.jdbc.Driver");
				
							// Step 2: Define Connection URL
							String connURL = "jdbc:mysql://localhost/db1?user=root&password=12345&serverTimezone=UTC";
				
							// Step 3: Establish connection to URL
							Connection conn = DriverManager.getConnection(connURL);
							// Step 4: Create Statement object
							Statement stmt = conn.createStatement();
				
							String sqlgenreName = "INSERT INTO comments (commenterName, rating, date, comment) VALUES ( ?, ?, ?, ?)";
							PreparedStatement ps = conn.prepareStatement(sqlgenreName, PreparedStatement.RETURN_GENERATED_KEYS);
							ps.setString(1, commentName);
							ps.setString(2, commentRating);
							ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
							ps.setString(4, commentText);
							ps.executeUpdate();
							
							ResultSet rs;
							java.math.BigDecimal iDColVar;
							int commentID = 0;
							
							rs = ps.getGeneratedKeys();
							
							while (rs.next()) {
								  java.math.BigDecimal idColVar = rs.getBigDecimal(1);     
								                                      // Get automatically generated key 
								                                      // value
								  System.out.println("automatically generated key value = " + idColVar);
									commentID = idColVar.intValue();
								}
							
							// Update Game_Comment
							String sqlgenreName2 = "INSERT INTO game_comment (commentID, gameCommentID) VALUES (?, ?)";
							PreparedStatement ps2 = conn.prepareStatement(sqlgenreName2);
							ps2.setInt(1, commentID);
							ps2.setInt(2, gameID);
							ps2.executeUpdate();
							
							
							conn.close();
						} catch (Exception e) {
							System.err.println(e);
						}
        			}
        			
				%>
				
				<h3>Comments</h3>
				
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
        		
					String sqlGameComments = "SELECT * FROM game_comment WHERE gameCommentID = '" + gameID + "'";
					ResultSet rsGC = stmt.executeQuery(sqlGameComments);
					
					while(rsGC.next()){
						String currentCommentID = rsGC.getString("commentID");
						
						System.err.println(currentCommentID);
						
						// Get Commentcard
						String sqlGetCommentID = "SELECT * from comments WHERE commentID =\"" + currentCommentID + "\"";
						Statement stmt3 = conn.createStatement();
						ResultSet rsComment = stmt3.executeQuery(sqlGetCommentID);
						while(rsComment.next()){
							rsComment.first();
							out.print("<div class=\"commentCard\">");
							out.print("<h3>" + rsComment.getString("commenterName") + "</h3>");
							out.print("<p><strong>Rating: </strong> " + rsComment.getString("rating") + "</p>");
							out.print("<p class=\"date\">" + rsComment.getString("date") + "</p>");
							out.print("<p>" + rsComment.getString("comment") + "</p>");
							out.print("</div>");
						}
						
						
						
					}
					
                
        		} catch (Exception e) {
					System.err.println(e);
				}
                %>

				
            </div>

        <footer>
            <!-- © 2019 ™Bloom Games -->
            <p>&copy; 2019 &trade;Bloom Games</p>
        </footer>

    </body>
</html>
