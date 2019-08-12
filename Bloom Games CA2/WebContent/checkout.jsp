<%@ page import="db.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	SqlDAO DBSQL = new SqlDAOImpl();
	UserLoginDAO UserLogin_DAO = new UserLoginDAOImpl(DBSQL);
	
	int userID = 0;
	if(session.getAttribute("userid")!= null){
		userID = Integer.parseInt(session.getAttribute("userid").toString());
	} else {
		response.sendRedirect("login.jsp");
	}
		
	UserLogin CurrentUser = UserLogin_DAO.GetUserDetails(userID);
	Double totalCartCost = 0.0;
	
	// Load Cart Details
	CartDAO Cart_DAO = new CartDAOImpl(DBSQL);
	ArrayList<CartItem> CartItemList = Cart_DAO.GetCartItemList(userID);
		
	for (int i = 0; i < CartItemList.size(); i++) {
		CartItem row = CartItemList.get(i);
		int GameID = row.GetGameID();
		GameDAO Game_DAO = new GameDAOImpl(DBSQL);
		Game currentGame = Game_DAO.GetGameInfo(GameID);
		totalCartCost += currentGame.GetPrice() * row.GetQty();
	}
	
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

    <title>Bloom Games - Checkout</title>

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

    <!-- Checkout Section -->
    <div class="container">

      <!-- Checkout Message -->
      <div class="py-5 text-center">
        <h2>Checkout</h2>
        <p class="lead">Welcome to Checkout. Make payment here and get ready to receive your games! Please do not enter your real credit card details as this website is built for educational purposes.</p>
      </div>

      <div class="row">

        <!-- Cart Summary -->
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Transaction Summary</span>

          </h4>

          <ul class="list-group mb-3">
			
			<!-- Load Cart Summary From Server -->
			<%
            // Cart Summary Item
            
            for (int i = 0; i < CartItemList.size(); i++) {
    		CartItem row = CartItemList.get(i);
    		int GameID = row.GetGameID();
    		GameDAO Game_DAO = new GameDAOImpl(DBSQL);
    		Game currentGame = Game_DAO.GetGameInfo(GameID);
            
            	out.print("<li class=\"list-group-item d-flex justify-content-between lh-condensed\"><div>");
        		out.print("<h6 class=\"my-0\">" + currentGame.GetGameTitle() + "</h6>");
        		out.print("<small class=\"text-muted\">x"+ row.GetQty() + " ($" + String.format("%.2f", (currentGame.GetPrice() * row.GetQty())) +")</small></div>");
        		out.print("<span class=\"text-muted\">$" + String.format("%.2f", currentGame.GetPrice()) + "</span></li>");
            }

            // Total Price
            out.print("<li class=\"list-group-item d-flex justify-content-between\"><span>Total (SGD)</span>");
            out.print("<strong>$" + String.format("%.2f", totalCartCost) + "</strong></li>");
            %>

          </ul>
        </div>
        <!-- End of Cart Summary -->

        <!-- Checkout Form -->
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">Checkout Details</h4>
          <form class="needs-validation" action= "ServletCheckout" method="post">
            
            <!-- First and Last Name -->
            <div class="row">

              <!-- First Name -->
              <div class="col-md-12 mb-3">
                <label for="firstName">Name</label>
                <%
                out.print("<input type=\"text\" class=\"form-control\" id=\"name\" value=\"" + CurrentUser.GetName() + "\" required>");
                %>
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
            </div>

            <!-- Mailing Address -->
            <div class="mb-3">
              <label for="address">Mailing Address</label>
              <%
              out.print("<input type=\"text\" class=\"form-control\" id=\"address\" placeholder=\"1234 Main St\" value=\"" + CurrentUser.GetMailingAddress() + "\" required>");
              %>
              <div class="invalid-feedback">
                Please enter your mailing address.
              </div>
            </div>

            <!-- Email -->
            <div class="mb-3">
              <label for="email">Email </span></label>
              <%
              out.print("<input type=\"email\" class=\"form-control\" id=\"email\" placeholder=\"you@example.com\" value=\"" + CurrentUser.GetEmail() + "\" required>");
              %>
              <div class="invalid-feedback">
                Please enter a valid email address.
              </div>
            </div>

            <!-- Contact Number -->
            <div class="mb-3">
              <label for="contactNumber">Contact Number </span></label>
              <%
              out.print("<input type=\"number\" class=\"form-control\" id=\"contactNumber\" placeholder=\"xxxx xxxx\"value=\"" + CurrentUser.GetContactNumber() + "\" required>");
              %>
              <div class="invalid-feedback">
                Please enter a valid contact number.
              </div>
            </div>

            <!-- Dividing Line -->
            <br>
            <hr class="mb-4">

            <h4 class="mb-3">Payment</h4>
            <p>Please Enter Your Credit Card Details</p>

            <!-- Credit Card Details -->
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">Name on card</label>
                <input type="text" class="form-control" id="cc-name" placeholder="E.g. John Doe" required>
                <small class="text-muted">Full name as displayed on card</small>
                <div class="invalid-feedback">
                  Name on card is required
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">Credit card number</label>
                <input type="text" class="form-control" id="cc-number" placeholder="" required>
                <div class="invalid-feedback">
                  Credit card number is required
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">Expiration</label>
                <input type="text" class="form-control" id="cc-expiration" placeholder="mm/yyyy" required>
                <div class="invalid-feedback">
                  Expiration date required
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="cc-cvv">CVV</label>
                <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
                <div class="invalid-feedback">
                  Security code required
                </div>
              </div>
            </div>

            <!-- Divider Line -->
            <hr class="mb-4">

            <!-- Confirm Button -->
            <input type="submit" class="btn btn-primary btn-lg btn-block" value="Confirm Purchase" />

          </form>
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