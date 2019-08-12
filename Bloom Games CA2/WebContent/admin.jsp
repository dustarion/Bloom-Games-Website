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
	
/* 	for (int i = 0; i < CartItemList.size(); i++) {
		CartItem row = CartItemList.get(i);
		int GameID = row.GetGameID();
		GameDAO Game_DAO = new GameDAOImpl(DBSQL);
		Game currentGame = Game_DAO.GetGameInfo(GameID);
	} */
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

    <title>Bloom Games - Admin</title>

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
        <h2>Stock Report</h2>
        <p class="lead">Stock Reports are Shown Below</p>
      </div>

      <!-- Low Stock Card -->
      <div class="row">
      <div class="col-md-12">
      <div class="card mb-4 shadow-sm">

      <!-- Date of Transaction -->
      <h5 class="card-header">Stock Below Threshold</h5>
      <div class="card-body">
        <div class="row">
        <div class="col-md-6">
          <!-- Show All Stock Below ... -->
          <form action="" >
          <div class="input-group input-group-sm mb-3">
            <!-- Show Games With Stock Below... -->
            <div class="input-group-prepend">
              <span class="input-group-text" id="inputGroup-sizing-sm">Stock Threshold</span>
            </div>

            <!-- Threshold Input -->
            <input type="number" class="form-control" name="stockThreshold" aria-label="Small" aria-describedby="inputGroup-sizing-sm" value="20">

            <!-- Filter Button -->
            <div class="input-group-append">
              <input class="btn btn-primary" type="submit" value="Filter"/>
            </div>

          </div>
          </form>
        </div></div>
        

        <div class="row">
        <div class="col-md-12">
        <table class="table">

          <!-- Table Head -->
          <thead>
              <tr>
                <th scope="col">Title</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
              </tr>
          </thead>

          <!-- Table Body -->
          <tbody>

            <%
            
            int threshold = 10;
            
            if(request.getParameter("stockThreshold")!= null){
            	threshold = Integer.parseInt(request.getParameter("stockThreshold"));
            }
            
            for (Game row:gameList) {
            	if (row.GetQty() <= threshold) {
            		out.print("<tr><th scope=\"row\">" + row.GetGameTitle() + "</th>");
    				out.print("<td>$" + String.format("%.2f", row.GetPrice()) + "</td>");
    				out.print("<td>" + row.GetQty() + "x</td></tr>");
            	}
            }
            %>
          
          </tbody>
        </table>
        </div></div>

      </div></div></div></div>
      <!-- End of Low Stock Card -->



      <!-- All Stock Card -->
      <div class="row">
      <div class="col-md-12">
      <div class="card mb-4 shadow-sm">

      <!-- Date of Transaction -->
      <h5 class="card-header">All Stock</h5>
      <div class="card-body">

        <div class="row">
        <div class="col-md-12">
        <table class="table">

          <!-- Table Head -->
          <thead>
              <tr>
                <th scope="col">Title</th>
                <th scope="col">Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Edit Quantity</th>
              </tr>
          </thead>

          <!-- Table Body -->
          <tbody>

            <!-- Product Row -->
            <%
            for (Game row:gameList) {
            	out.print("<tr><th scope=\"row\">" + row.GetGameTitle() + "</th>");
    			out.print("<td>$" + String.format("%.2f", row.GetPrice()) + "</td>");
    			out.print("<td>" + row.GetQty() + "x</td>");
    			out.print("<td>");
    			
    			out.print("<form action=\"ServletGameUpdateQty?gameID=" + row.GetGameID() + "\" method=\"post\">");
	    			out.print("<div class=\"input-group input-group-sm mb-3\">");
	    			out.print("<input type=\"number\" class=\"form-control\" name=\"qty\" aria-label=\"Small\" aria-describedby=\"inputGroup-sizing-sm\" value=\"" + row.GetQty() + "\">");
	    			out.print("<div class=\"input-group-append\">");
	    			out.print("<input class=\"btn btn-primary\" type=\"submit\" value=\"Save\"/>");
	    			out.print("</div></div>");
    			out.print("</form>");
    			
    			out.print("</td></tr>");
            }
            %>
            <!-- End of Product Row -->
          
          </tbody>
        </table>
        </div></div>

      </div></div></div></div>
      <!-- End of All Stock Card -->

    </div></main>









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
    <script src="js/checkoutFormValidation.js"></script>
  </body>
</html>



















<!-- <div class="row">
            <div class="col-md-12">
              <div class="card mb-4 shadow-sm">
                <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
                  <title></title>
                  <rect width="100%" height="100%" fill="#55595c"/>
                  <text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text>
                </svg>
                <div class="card-body">
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                    </div>
                    <small class="text-muted">9 mins</small>
                  </div>
                </div>
              </div>
              </div>
            </div> -->