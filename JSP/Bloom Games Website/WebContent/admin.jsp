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

            <a class="active" href="admin.jsp"><i class="fas fa-columns"></i> Dashboard</a>

            <p>Games</p>
            <a href="addGame.jsp"><i class="fas fa-pen"></i> Add Games</a>
            <a href="updateGame.jsp"><i class="fas fa-cog"></i> Update Games</a>
            <a href="deleteGame.jsp"><i class="fas fa-trash"></i> Delete Games</a>

            <p>Genres</p>
            <a href="addGenre.jsp"><i class="fas fa-pen"></i> Add Genres</a>
            <a href="updateGenre.jsp"><i class="fas fa-cog"></i> Update Genres</a>
            <a href="deleteGenre.jsp"><i class="fas fa-trash"></i> Delete Genres</a>

            <a class="logout" href="#">Logout <i class="fas fa-sign-in-alt"></i></a>
        </div>

        <div class="adminSection">
        <h3>Dashboard</h3>
        <div class="dashboardSection">

            <div class="adminCard">
                <h3>Games</h3>
                <div class="container">
                    <a class="primaryButton" href="addGame.jsp"><i class="fas fa-pen"></i> Add Games</a>
                    <a class="primaryButton" href="updateGame.jsp"><i class="fas fa-cog"></i> Update Games</a>
                    <a class="primaryButton" href="deleteGame.jsp"><i class="fas fa-trash"></i> Delete Games</a>
                </div>
            </div>

            <div class="adminCard">
                <h3>Genres</h3>
                <div class="container">
                    <a class="primaryButton" href="addGenre.jsp"><i class="fas fa-pen"></i> Add Genres</a>
                    <a class="primaryButton" href="updateGenre.jsp"><i class="fas fa-cog"></i> Update Genres</a>
                    <a class="primaryButton" href="deleteGenre.jsp"><i class="fas fa-trash"></i> Delete Genres</a>
                </div>
            </div>

        </div>
        </div>
        

        <footer>
            <div class = footing>
            <!-- © 2019 ™Bloom Games -->
            <p>&copy; 2019 &trade;Bloom Games</p>
            </div>
        </footer>

    </body>
</html>
