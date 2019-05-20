<!DOCTYPE html>
<html>
    <head>
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
            <a href="admin.html">Admin <i class="fas fa-user-alt"></i></a>

            <!-- Login -->
            <a class="login" href="login.html">Login <i class="fas fa-sign-in-alt"></i></a>
        </div>

        <!-- Login Card -->
        <div class="loginSection">
            <!-- <form action="/action_page.php"> -->
            <form class="loginCard" action="admin.html">
                <!-- Username -->
                <p>Username</p><br>
                <input class="loginTextfield" type="text" name="Username" placeholder="Type Your Username" value="admin">
                <br>
                <!-- Password -->
                <p>Password</p><br>
                <input class="loginTextfield" type="text" name="Password" placeholder="Enter Your Password" value="secretPassword">

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