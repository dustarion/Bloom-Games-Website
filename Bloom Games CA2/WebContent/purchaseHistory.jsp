<%@ page import="db.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	SqlDAO DBSQL = new SqlDAOImpl();
	TransactionDAO Transaction_DAO = new TransactionDAOImpl(DBSQL);
	GameDAO Game_DAO = new GameDAOImpl(DBSQL);
	
	int userid = 0;
	// If the userID of the session doesnt exists, redirect to the login page.
	if(session.getAttribute("userid")!= null){
		userid = Integer.parseInt(session.getAttribute("userid").toString());
	} else {
		response.sendRedirect("login.jsp");
	}
	
	ArrayList<Transaction> TransactionList = Transaction_DAO.GetUserTransactions(userid);
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

    <title>Bloom Games - Purchase History</title>

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
      <!-- Checkout Message -->
      <div class="py-5 text-center">
        <h2>Purchase History</h2>
        <p class="lead">All confirmed purchases are shown below.</p>
      </div>

      <!-- Load Transactions -->
      <%
      
      if (TransactionList.size() > 0) {
	     
	      
	      for (Transaction row: TransactionList) {
	    	  
	    	  out.print("<div class=\"row\"><div class=\"col-md-12\"><div class=\"card mb-4 shadow-sm\">");
	
		      // Date of Transaction
		      out.print("<h5 class=\"card-header\">" + row.GetPurchaseDate() +  "</h5><div class=\"card-body\">");
		
		      for (GamePurchase Game: row.GetGamePurchaseList()) {
			      // Game Transaction Card
			      out.print("<div class=\"row\"><div class=\"col-md-12\"><div class=\"card mb-4 shadow-sm\"><div class=\"card-body\"><div class=\"row\"><div class=\"col-md-4\">");
			      out.print("<h3 class=\"card-title\">" + Game_DAO.GetGameInfo(Game.GetGameID()).GetGameTitle() + "</h3>");
			          
			      out.print("</div><div class=\"col-md-3\"><p>Unit Price</p>");
			      out.print("<h5 class=\"card-title\">$" + String.format("%.2f", Game.GetUnitPrice()) + "</h5>");
			      
			      out.print("</div><div class=\"col-md-3\"><p>Quantity</p>");
			      out.print("<h5 class=\"card-title\">" + Game.GetQuantity() + "</h5>");
			
			      out.print("</div><div class=\"col-md-2\"><p>Total Price</p>");
			      out.print("<h5 class=\"card-title\">$" + String.format("%.2f", Game.GetTotalPrice()) + "</h5>");
			      out.print("</div></div></div></div></div></div>");
			      // End of Game Transaction Card
		      }
		
		      // Total Amount in Cart
		      out.print("<p>Total Amount Spent:</p>");
		      out.print("<h3><strong>$" + String.format("%.2f", row.GetTotalPrice()) + "</strong></h3><br>"); 
		
		      // Transaction ID
		      out.print("<small>Transaction ID: </small>");
		      out.print("<small class=\"text-muted\">" + row.GetTransactionID() + "</small>");
		
		      out.print("</div></div></div></div>");
      	  }
	      
      } else {
    	  out.print("<div class=\"row\"><div class=\"col-md-12\"><div class=\"card mb-4 shadow-sm\">");
    	  out.print("<div class=\"card-body\">");
    	  out.print("<h3>No Purchases Found</h3>");
    	  out.print("</div></div></div></div>");
      }
      %>


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