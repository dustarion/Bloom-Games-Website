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
	
	
	// Load Genre Details
	SqlDAO DBSQL = new SqlDAOImpl();
	GameDAO Games_DAO = new GameDAOImpl(DBSQL);
	GenresDAO Genre_DAO = new GenresDAOImpl(DBSQL);
	
	ArrayList<Genres> GenreList = Genre_DAO.GetGenresList();
	
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

    <title>Bloom Games - Admin/Genre</title>

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

          <!-- <i class="fas fa-user-shield"></i> Admin -->

          </ul>

        </div>
      </div>
    </nav>

    <main role="main">
    <div class="container">
      <!-- Stock Report Message -->
      <div class="py-5 text-center">
        <h2>Genres</h2>
        <p class="lead">Genres are Shown Below</p>
      </div>

      <!-- Low Stock Card -->
      <div class="row">
      <div class="col-md-12">
      <div class="card mb-4 shadow-sm">

      <!-- Card Header -->
      <h5 class="card-header">Genres</h5>
      <div class="card-body">
        <div class="row">
        <div class="col-md-6">

          <div class="input-group input-group-sm mb-3">

            <!-- Add New Genre -->
            <div class="input-group-prepend">
              <span class="input-group-text" id="inputGroup-sizing-sm">Add a New Genre</span>
            </div>

            <!-- New Genre Name -->
            <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Enter Genre Name">

            <!-- Add Button -->
            <div class="input-group-append">
              <button class="btn btn-primary" type="button">Add</button>
            </div>

          </div>
        </div></div>

        <div class="row">
        <div class="col-md-12">
        <table class="table">

          <!-- Table Head -->
          <thead>
              <tr>
                <th scope="col">Genre ID</th>
                <th scope="col">Genre Title</th>
                <th scope="col">Actions</th>
              </tr>
          </thead>

          <!-- Table Body -->
          <tbody>

            <!-- Product Row -->
            <%
            for (Genres row:GenreList) {
	            out.print("<tr><th scope=\"row\">" + row.GetGenreID() + "</th>");
	    		out.print("<td>" + row.GetGenreName() + "</td>");
	            
	    		out.print("<td><button class=\"btn btn-outline-primary\" type=\"button\" data-toggle=\"modal\" data-target=\"#editModal\" data-whatever=\""+ row.GetGenreID()+"##"+row.GetGenreName() +"\">&nbsp;&nbsp;Edit&nbsp;&nbsp;</button>");
	    		out.print("&nbsp;");
	    		out.print("<button class=\"btn btn-outline-danger\" type=\"button\" data-toggle=\"modal\" data-target=\"#deleteModal\" data-whatever=\"" + row.GetGenreID()+"##"+row.GetGenreName() + "\">Delete</button></td></tr>");
            }
            %>
            <!-- End of Product Row -->
          
          </tbody>
        </table>
        </div></div>

      </div></div></div></div>
      <!-- End of Low Stock Card -->

    </div></main>

    <!-- Edit Modal (Centered) -->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Edit Genre</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            
            <form>

              <!-- Genre ID -->
              <div class="form-group">
                <label for="genre-id" class="col-form-label">Genre ID</label>
                <input type="text" class="form-control" id="genre-id" value="123456" readonly>
              </div>

              <!-- Genre Name -->
              <div class="form-group">
                <label for="genre-title" class="col-form-label">Genre Name</label>
                <input class="form-control" id="genre-title" value="Adventure"></input>
              </div>
            </form>

          </div>
          <div class="modal-footer">

            <!-- Dismiss Button -->
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

            <!-- Save Changes Button -->
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Delete Modal (Centered) -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLongTitle">Confirm Deletion</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <p>Warning, this action cannot be undone.</p>
          </div>
          <div class="modal-footer">

            <!-- Dismiss Button -->
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

            <!-- Save Changes Button -->
            <button type="button" class="btn btn-danger">Save changes</button>
          </div>
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
    <script src="js/genreAdmin.js"></script>
  </body>
</html>












<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button> -->

<!-- Modal -->
<!-- <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div> -->