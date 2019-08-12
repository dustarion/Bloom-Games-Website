<%@ page import="db.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.ArrayList"%>

<%
	int userid = 0;
	Double totalCartCost = 0.0;
	
	// If the userID of the session doesnt exists, redirect to the login page.
	if(session.getAttribute("userid")!= null){
		userid = Integer.parseInt(session.getAttribute("userid").toString());
	} else {
		response.sendRedirect("login.jsp");
	}
	
	// Load Cart Details
	SqlDAO DBSQL = new SqlDAOImpl();
	CartDAO Cart_DAO = new CartDAOImpl(DBSQL);
	ArrayList<CartItem> CartItemList = Cart_DAO.GetCartItemList(userid);
	
	for (int i = 0; i < CartItemList.size(); i++) {
		CartItem row = CartItemList.get(i);
		int GameID = row.GetGameID();
		GameDAO Game_DAO = new GameDAOImpl(DBSQL);
		Game currentGame = Game_DAO.GetGameInfo(GameID);
		totalCartCost += currentGame.GetPrice() * row.GetQty();
	}
	
	System.out.print("\nTotal Cart Cost: " + totalCartCost);
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

    <title>Bloom Games - Cart</title>

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
            
            <%
			if(session.getAttribute("userid")!= null){
				// Check if Admin or Member
				if(session.getAttribute("admin").toString().equals("0")){
					// Member
					
					String name = session.getAttribute("name").toString();
					
					out.print("<li class=\"nav-item dropdown\">");
					out.print("<a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">");
					out.print("<i class=\"fas fa-user-alt\"></i> " + name + "</a>");
					out.print("<div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">");
					out.print("<a class=\"dropdown-item\" href=\"userSettings.jsp\"><i class=\"fas fa-cog\"></i> Settings</a>");
					out.print("<a class=\"dropdown-item\" href=\"cart.jsp\"><i class=\"fas fa-shopping-cart\"></i> Shopping Cart</a>");
					out.print("<a class=\"dropdown-item\" href=\"purchaseHistory.jsp\"><i class=\"fas fa-history\"></i> Purchase History</a>");
					out.print("<div class=\"dropdown-divider\"></div>");
					out.print("<a class=\"dropdown-item\" href=\"logout.jsp\"><i class=\"fas fa-sign-out-alt\"></i> Logout</a>");
					out.print("</div></li>");
			        
				} else {
					// Admin
					out.print("<li class=\"nav-item dropdown\">");
					out.print("<a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\">");
					out.print("<i class=\"fas fa-user-alt\"></i> Admin </a>");
					out.print("<div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\">");
					out.print("<a class=\"dropdown-item\" href=\"admin.jsp\"><i class=\"fas fa-box-open\"></i> Stock Report</a>");
					out.print("<a class=\"dropdown-item\" href=\"adminGames.jsp\"><i class=\"fas fa-gamepad\"></i> Games</a>");
					out.print("<a class=\"dropdown-item\" href=\"adminGenre.jsp\"><i class=\"fas fa-filter\"></i> Genre</a>");
					out.print("<div class=\"dropdown-divider\"></div>");
					out.print("<a class=\"dropdown-item\" href=\"logout.jsp\"><i class=\"fas fa-sign-out-alt\"></i> Logout</a>");
					out.print("</div></li>");
				}
				
			} else {
				// It's a guest, show login and signup buttons.
				out.print("<a class=\"nav-link\" href=\"signup.jsp\"><i class=\"fas fa-user-alt\"></i> Sign Up</a>");
				out.print("<a class=\"nav-link\" href=\"login.jsp\"><i class=\"fas fa-sign-in-alt\"></i> Login</a>");
			}
			%>

          </ul>

        </div>
      </div>
    </nav>

    <main role="main">
    <div class="container">
      <!-- Spacing Row -->
      <div class="row"><br></div>

      <!-- Shopping Cart -->
      <div class="row">
      <div class="col-md-12">
      <div class="card mb-4 shadow-sm">
      <h5 class="card-header">Your Cart</h5>
      <div class="card-body">

        <!-- Game Cart Card -->
        <%
        
        for (int i = 0; i < CartItemList.size(); i++) {
    		CartItem row = CartItemList.get(i);
    		int GameID = row.GetGameID();
    		GameDAO Game_DAO = new GameDAOImpl(DBSQL);
    		Game currentGame = Game_DAO.GetGameInfo(GameID);
    		
        
	        out.print("");
	        out.print("<div class=\"row\"><div class=\"col-md-12\"><div class=\"card mb-4 shadow-sm\"><div class=\"card-body\"><div class=\"row\"><div class=\"col-md-4\">");
	        
	       	//Product Name
	      	out.print("<h3 class=\"card-title\">" + currentGame.GetGameTitle() +"</h3>");
	      	out.print("<a href=\"game.jsp?gameID="+ row.GetGameID() +"\" class=\"btn btn-outline-primary\"> View </a>");
	        
	      	out.print("</div><div class=\"col-md-3\"><p>Price</p>");
	
	        // Price
	       	out.print("<h5 class=\"card-title\">$" + String.format("%.2f", currentGame.GetPrice()) + "</h5>");
	       	
	       	out.print("</div><div class=\"col-md-3\"><p>Quantity</p>");
	       	 
	       	// Quantity
	       	out.print("<h5 class=\"card-title\">" + row.GetQty() + "</h5>");
	       	
	       	// Quantity
	 		out.print("<div class=\"btn-group\">");
	       	
	 		// Add Qty
	 		if (row.GetQty() < currentGame.GetQty()) {
	 			out.print("<form action=\"ServletUpdateCart?gameID=" + row.GetGameID() + "&qty=" + (row.GetQty() + 1) + "\" method=\"post\">");
	 			out.print("<button type=\"submit\" class=\"btn btn-sm btn-outline-secondary\"><i class=\"fas fa-plus\"></i></button>");
	 			out.print("</form>");
	 		} else {
	 			out.print("<button type=\"button\" class=\"btn btn-sm btn-outline-secondary\"><i class=\"fas fa-plus\"></i></button>");
	 		}
	 		
	 		// Minus Qty
	 		if (row.GetQty() > 1 ) {
		 		out.print("<form action=\"ServletUpdateCart?gameID=" + row.GetGameID() + "&qty=" + (row.GetQty() - 1) + "\" method=\"post\">");
		 		out.print("<button type=\"submit\" class=\"btn btn-sm btn-outline-secondary\"><i class=\"fas fa-minus\"></i></button>");
		 		out.print("</form>");
	 		} else {
	 			out.print("<button type=\"button\" class=\"btn btn-sm btn-outline-secondary\"><i class=\"fas fa-minus\"></i></button>");
	 		}
	 		
	 		out.print("</div>");
	        
	 		out.print("</div><div class=\"col-md-2\"><p>Actions</p>");
	          
	        // Delete
	        out.print("<form action=\"ServletDeleteCartItem?gameID=" + row.GetGameID() + "\" method=\"post\">");
	        out.print("<input type=\"submit\" name=\"delete\" class=\"btn btn-danger\" value=\"Delete\" />");
	        out.print("</form>");
	          
	        out.print("</div></div></div></div></div></div>");
        }
        %>
        <!-- End of Game Cart Card -->


        <!-- Total Amount in Cart -->
        <%
        
        if (totalCartCost == 0.0) {
        	out.print("<h3><strong>Your Cart is Empty</strong></h3>");
        } else {
        	out.print("<p>Total Cart Cost:</p>");
        	out.print("<h3><strong>$" + String.format("%.2f", totalCartCost) + "</strong></h3>");
        	out.print("<br>");
        	
        	// Checkout Button
        	out.print("<a href=\"checkout.jsp\" class=\"btn btn-primary\">Checkout</a>");
        }
        %>

      </div></div></div></div>
      <!-- End of Shopping Cart -->


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