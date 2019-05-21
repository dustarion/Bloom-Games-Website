<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

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
            
            <%
            out.print("<form class=\"commentForm\" action=\"?gameID=" + gameID + "\">");
            %>
            <div class="commentFormName">
			<h3>Name</h3>
			<input class="textfield" type="text" name="name" placeholder="Enter Name Here">
                        
			</div>
			<div class="commentFormName">
			<h3>Rating</h3>
			<input class="textfield" type="number" min="0" max="5" value="1" step="1" name="rating" placeholder="Enter a rating from 1-5 here">
                        
			</div>

                    <!-- Comment Box -->
                    <div class="commentBox">
                        <textarea name="Text1" cols="40" rows="5" class="commentfield" type="textarea" name="comment" placeholder="Write Your Comment Here"></textarea>
                    </div>

                    <!-- Post Button -->
                    <input type="submit" value="Post">
                </div>


				<!-- Load From Database -->
        		<%
     				// Initialise Variables
    				//String gameIDString = request.getParameter("gameID");
                	//<h2>3 Comments</h2>
				%>

                <!-- Comment -->
                <div class="commentCard">
                    <h3>Dalton Prescott</h3>

                    <div class="rating">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                    </div>

                    <p class="date">12/07/2018</p>
                    <p>The Metro series so far has been defined by its claustrophobic setting and worldview. After nuclear war ravages Moscow in 2013, survivors who flee to the underground tunnels of the Metro system form their own independent states and societies, all in a bid to keep on living. That element of survival against the odds in a dangerous environment, rarely going outside into the irradiated city ruins, is inseparable from the franchise. So what happens when the series takes a step outside, hops on a train heading out of the tunnels, and goes above ground and into the heart of Russia?</p>
                </div>

                <!-- Comment -->
                <div class="commentCard">
                    <h3>Dalton Prescott</h3>

                    <div class="rating">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                    </div>

                    <p class="date">12/07/2018</p>
                    <p>The Metro series so far has been defined by its claustrophobic setting and worldview. After nuclear war ravages Moscow in 2013, survivors who flee to the underground tunnels of the Metro system form their own independent states and societies, all in a bid to keep on living. That element of survival against the odds in a dangerous environment, rarely going outside into the irradiated city ruins, is inseparable from the franchise. So what happens when the series takes a step outside, hops on a train heading out of the tunnels, and goes above ground and into the heart of Russia?</p>
                </div>

                <!-- Comment -->
                <div class="commentCard">
                    <h3>Dalton Prescott</h3>

                    <div class="rating">
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star"></span>
                        <span class="fa fa-star"></span>
                    </div>

                    <p class="date">12/07/2018</p>
                    <p>The Metro series so far has been defined by its claustrophobic setting and worldview. After nuclear war ravages Moscow in 2013, survivors who flee to the underground tunnels of the Metro system form their own independent states and societies, all in a bid to keep on living. That element of survival against the odds in a dangerous environment, rarely going outside into the irradiated city ruins, is inseparable from the franchise. So what happens when the series takes a step outside, hops on a train heading out of the tunnels, and goes above ground and into the heart of Russia?</p>
                </div>


            </div>


        </div>


        <footer>
            <!-- © 2019 ™Bloom Games -->
            <p>&copy; 2019 &trade;Bloom Games</p>
        </footer>

    </body>
</html>
