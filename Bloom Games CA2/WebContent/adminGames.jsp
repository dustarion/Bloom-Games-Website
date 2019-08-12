<%@ page import="db.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.ArrayList"%>

<%
	int userid = 0;
	
	// If the userID of the session doesnt exists, redirect to the login page.
	if(session.getAttribute("userid")!= null) {
		userid = Integer.parseInt(session.getAttribute("userid").toString());
	} else {
		response.sendRedirect("login.jsp");
	}
	
	// If the user is not an admin, redirect to login.
	if(session.getAttribute("admin")!= null) {
		if (session.getAttribute("admin").toString().equals("0")) {
			response.sendRedirect("login.jsp");
		}
	} else {
		response.sendRedirect("login.jsp");
	}
	
	
	// Load Stock Details
	SqlDAO DBSQL = new SqlDAOImpl();
	GameDAO Games_DAO = new GameDAOImpl(DBSQL);
	
	ArrayList<Game> gameList = Games_DAO.GetGamesList();
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

    <title>Bloom Games - Admin/Games</title>

    <!-- Custom styles for this template -->
    <link href="css/styles.css" rel="stylesheet">

  </head>
  <body>

    <!-- Site Name -->
    <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark">

      <div class="container">
        <!-- Bloom Games Logo 120/30?-->
        <a class="navbar-brand" href="#">Bloom Games</a>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">

            <li class="nav-item">
              <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="search.jsp"><i class="fas fa-search"></i> Search</a>
            </li>

            <!-- Shopping Cart -->
            <li class="nav-item">
              <a class="nav-link" href="cart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a>
            </li>

          </ul>

          <ul class="navbar-nav navbar-right">

          <!-- Admin Dropdown -->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user-shield"></i> 
                Admin
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="admin.jsp"><i class="fas fa-box-open"></i> Stock Report</a>
              <a class="dropdown-item" href="adminGames.jsp"><i class="fas fa-gamepad"></i> Games</a>
              <a class="dropdown-item" href="adminGenre.jsp"><i class="fas fa-filter"></i> Genres</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
          </li>

          </ul>

        </div>
      </div>
    </nav>

    <main role="main">
    <div class="container">
      <!-- Stock Report Message -->
      <div class="py-5 text-center">
        <h2>Games</h2>
        <p class="lead">Games are Shown Below</p>
      </div>

      <!-- Card -->
      <div class="row">
      <div class="col-md-12">
      <div class="card mb-4 shadow-sm">

      <!-- Card Header -->
      <h5 class="card-header">Games</h5>
      <div class="card-body">
        <div class="row">
        <div class="col-md-12">
        <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#addModal" >Add New Game</button>
        <br><br>
        </div></div>

        <div class="row">
        <div class="col-md-12">
        <table class="table">

          <!-- Table Head -->
          <thead>
              <tr>
                <th scope="col">Game ID</th>
                <th scope="col">Game Title</th>
                <th scope="col">Actions</th>
              </tr>
          </thead>

          <!-- Table Body -->
          <tbody>

            <!-- Product Row -->
            <%
            for (Game row:gameList) {
	            out.print("<tr><th scope=\"row\">" + row.GetGameID() + "</th>");
	            
	    		out.print("<td>" + row.GetGameTitle() + "</td><td>");
	            
	           	// Edit
	           	out.print("<form action=\"ServletGameDelete?gameID=" + row.GetGameID() + "\" method=\"post\">");
	           	out.print("<button class=\"btn btn-outline-primary\" type=\"button\" data-toggle=\"modal\" data-target=\"#addModal\" data-gameid=\"134314\">&nbsp;&nbsp;Edit&nbsp;&nbsp;</button>");
	            
	           	out.print("&nbsp;");
	           	
	           	// Delete
	           	out.print("<input type=\"submit\" name=\"delete\" class=\"btn btn-outline-danger\" value=\"Delete\" />");
	           	out.print("</form>");
	            
				out.print("</td></tr>");
			}
			%>
            
            <!-- End of Product Row -->
          
          </tbody>
        </table>
        </div></div>

      </div></div></div></div>
      <!-- End of Low Stock Card -->

    </div></main>
    
    <!-- Add Modal -->
    <div class="modal fade" id="addModal" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Add game</h5>
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="modal-form" action="ServletGameUpload" method="POST">
                    <div class="modal-body">

                        <input type="hidden" name="game_id" id="game-id">
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Game
                                Title:</label> <input type="text" class="form-control" id="gametitle"
                                name="gameTitle" required>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">
                            Image:</label> <input type="text" class="form-control" id="imagelocation"
                                name="imageLocation" required>

                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Company
                                Name:</label> <input type="text" class="form-control" id="company"
                                name="company" required>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Release
                                Date:</label> <input type="date" class="form-control" id="release_date"
                                name="releaseDate" required>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Genres:</label>
                            <select name="genres" class="form-control selectpicker"
                                multiple="multiple" id="genres" required>
                                <%
                                    ArrayList<Genres> genre_list = new ArrayList<Genres>();
                                    GenresDAO Genres_DAO = new GenresDAOImpl(DBSQL);
                                    genre_list = Genres_DAO.GetGenresList();
                                    for (Genres g : genre_list) {
                                %>
                                <option value="<%=g.GetGenreID()%>"><%=g.GetGenreName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Price:</label>
                            <input type="number" step="0.01" min="0.01" class="form-control"
                                id="price" name="price" required>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Quantity:</label>
                            <input type="number" step="1" min="0" class="form-control"
                                id="qty" name="qty" required>
                                <small
                                class="form-text text-muted">Setting the Quantity to '0' will reflect it as (out of stock)</small>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="col-form-label">Pre-Owned:</label>
                            <select name="preowned" class="form-control" id="preowned"
                                required>
                                <option value="0">No</option>
                                <option value="1">Yes</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="col-form-label">Description:</label>
                            <textarea class="form-control" id="description"
                                name="description" required></textarea>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                            data-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" value="Submit" name="submit">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <footer class="text-muted">
      <div class="container">
        <p class="float-right">
          <a href="#">Back to top</a>
        </p>
        <p>&copy;Bloom Games 2019</p>
      </div>
    </footer>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="js/gamescript.js"></script>
    <script src="js/genreAdmin.js"></script>
  </body>
</html>