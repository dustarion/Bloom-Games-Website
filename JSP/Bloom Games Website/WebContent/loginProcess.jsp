<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.swing.JOptionPane" %>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
    
    	<meta charset="ISO-8859-1">
		<title>Login</title>
		
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
            <a href="admin.jsp">Admin <i class="fas fa-user-alt"></i></a>

            <!-- Login -->
            <a class="login" href="login.jsp">Login <i class="fas fa-sign-in-alt"></i></a>
        </div>

        <!-- Login Card -->
        <div class="loginSection">
        	<div class="loginCard">
			<% 
			
				// Initialise Variables
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				
				if (username != null) { if (!username.isBlank()) {
				if (password != null) { if (!password.isBlank()) {
					try{
						//Step1: Load JDBC Driver
						Class.forName("com.mysql.jdbc.Driver");
			
						// Step 2: Define Connection URL
						String connURL = "jdbc:mysql://localhost/db1?user=root&password=12345&serverTimezone=UTC";
			
						// Step 3: Establish connection to URL
						Connection conn = DriverManager.getConnection(connURL);
						// Step 4: Create Statement object
						Statement stmt = conn.createStatement();
			
						String checkAccountSqlStr = "SELECT COUNT(*), userID FROM users WHERE (username = \"" + username + "\") AND (password = \"" + password + "\") GROUP BY userID;";
						ResultSet rs = stmt.executeQuery(checkAccountSqlStr);
						
						int resultCount = 0;
						String userID = "";
						while(rs.next()){
							if (rs.getInt("COUNT(*)") == 1) {
								resultCount ++;
								userID = rs.getString("userID");
								break;
							}
						}
						conn.close();
						
						if (resultCount == 1) {
							
							response.sendRedirect("admin.jsp");
						} else {
							out.print("<p>Invalid Credentials</p>");
						}
					
					}catch (Exception e) {
						// out.print(e);
						out.print("<p>" + e + "</p>");		
					}
				}}}}
				
				// Empty Fields
			%>
			</div>
        </div>

        <footer>
            <!-- © 2019 ™Bloom Games -->
            <p>&copy; 2019 &trade;Bloom Games</p>
        </footer>

    </body>
</html>
