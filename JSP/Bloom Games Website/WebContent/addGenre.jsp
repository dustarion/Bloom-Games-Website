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
            <a class="logo" href="index.html"><img src="../images/main/BloomLogo.png"> </a>

            <!-- Menu -->
            <a href="../index.html">Home <i class="fas fa-home"></i></a>
            <a href="../search.html">Search <i class="fas fa-search"></i></a>
            <a class="active" href="../admin.html">Admin <i class="fas fa-user-alt"></i></a>

            <!-- Login -->
            <a class="login" href="../index.html">Logout <i class="fas fa-sign-in-alt"></i></a>
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
            <h3>Add Genre</h3>
            <form class="mainFormCard" action="addGenreProcess.jsp">     	

                <!-- Genre Title -->
                <p>Genre Title</p>
                <input class="formTextField" type="text" name="gameTitle" placeholder="Enter Genre Title">
                <br>

                <!-- Submit -->
                <input type="submit" value="Add Genre">
            </form>
            
            <!-- List Of Current Genres -->
            <br>
            <br>
            <br>
            <p><strong>Existing Genres</strong></p>
            <hr>

        </div>











        <footer>
            <div class = footing>
            <!-- © 2019 ™Bloom Games -->
            <p>&copy; 2019 &trade;Bloom Games</p>
            </div>
        </footer>

    </body>
</html>
