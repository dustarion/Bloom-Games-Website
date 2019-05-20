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
            <!-- <form action="/action_page.php"> -->
            <form class="loginCard" action="loginProcess.jsp">
                <!-- Username -->
                <p>Username</p><br>
                <input class="loginTextfield" type="text" name="username" placeholder="Type Your Username" value="admin">
                <br>
                <!-- Password -->
                <p>Password</p><br>
                <input class="loginTextfield" type="text" name="password" placeholder="Enter Your Password" value="secretPassword">

                <!-- Login Button -->
                <input class="primaryButton" type="submit" value="Submit">
            </form>
        </div>

        <footer>
            <!-- © 2019 ™Bloom Games -->
            <p>&copy; 2019 &trade;Bloom Games</p>
        </footer>

    </body>
</html>
