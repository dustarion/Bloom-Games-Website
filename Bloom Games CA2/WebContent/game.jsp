<%@ page import="db.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.ArrayList"%>
<%
	int gameid = 0;
	boolean cart = false;
	try {
		gameid = Integer.parseInt(request.getParameter("gameID"));
		if (request.getParameter("cart") != null) {
			if (request.getParameter("cart").toString().equals("true")) {
				// Add to Cart
				
				cart = true;
			} else {
				// Remove from Cart
			}
		}

	} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("index.jsp");
		System.out.println("Validation fail!");
		throw new javax.servlet.jsp.SkipPageException();
	}
	
	SqlDAO DBSQL = new SqlDAOImpl();
	GameDAO Game_DAO = new GameDAOImpl(DBSQL);
	Game game = Game_DAO.GetGameInfo(gameid);
	
	CommentDAO Comment_DAO = new CommentDAOImpl(DBSQL);
	ArrayList<Comment> comment_list = Comment_DAO.GetCommentList(gameid);
	
	if (game == null) {
		response.sendRedirect("index.jsp");
		System.out.println("Returning null!");
		throw new javax.servlet.jsp.SkipPageException();
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

    <title>Bloom Games - Game</title>

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
                    out.print("<i class=\"fas fa-user-alt\"></i> Profile </a>");
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

      <!-- Game Card -->
      <div class="row">
        <div class="col-md-12">
          <div class="card mb-4 shadow-sm">
            
            <!-- Load Game Information -->
            <%
            
            out.print("<img class=\"imageFill\" src=\"" + game.GetImageLocation() + "\"  width=\"100%\" height=\"500\">");

            out.print("<div class=\"card-body\">");
            
            out.print("<h1 class=\"card-title\">" + game.GetGameTitle() + "</h1>");
            out.print("<p class=\"card-text\">" + game.GetDescription() + "</p>");

          	// Release Date | Company | Preowned
           	out.print("<div class=\"row\">");
            out.print("<div class=\"col-md-12\">");
            out.print("<div class=\"card mb-4 shadow-sm\">");
            out.print("<div class=\"card-body\">");

            out.print("<div class=\"row\"><div class=\"col-md-4\">");
              
           	out.print("<h5 class=\"card-title\">" + game.GetReleaseDate() + "</h5>");
           	out.print("<p>Release Date</p></div>");

            // Company
            out.print("<div class=\"col-md-4\">");
            out.print("<h5 class=\"card-title\">" + game.GetCompany() + "</h5>");
            out.print("<p>Company</p></div>");

            // Preowned
            
            String preowned;
            if (game.GetPreOwned() == 1) {
            	preowned = "Pre Owned";
            } else {
            	preowned = "New";
            }
            
            out.print("<div class=\"col-md-4\">");
            out.print("<h5 class=\"card-title\">" + preowned + "</h5>");
            out.print("<p>Secondhand Status</p></div>");

           	out.print("</div></div></div></div></div>");

           	out.print("<div class=\"d-flex justify-content-between align-items-center\">");
           	
           	//out.print("<a href=\"cart.jsp?gameID=" + gameid + "&cart=true\" class=\"btn btn-primary\">Add To Cart ($" + game.GetPrice() + ")</a>");
           	if (game.GetQty() > 0) {
           	out.print("<form action=\"ServletAddToCart?gameID=" + gameid + "\" method=\"post\">");
           	out.print("<input type=\"submit\" name=\"addToCart\" class=\"btn btn-primary\" value=\"Add To Cart ($" + game.GetPrice() + ")\"/>");
           	out.print("</form>");
           	} else {
           		out.print("<input type=\"submit\" name=\"addToCart\" class=\"btn btn-primary\" value=\"Out Of Stock ($" + game.GetPrice() + ")\" disabled/>");
           	}
           	
           	out.print("<small class=\"text-muted\"><strong>" + game.GetQty() + "</strong> left in Stock</small>");
        	out.print("</div>");
			%>  

      </div></div></div></div>
      <!-- End of Game Card -->

      <!-- Comments Header -->
      <div class="row">
      <div class="col-md-12">
        <br>
        <h2>Comments</h2>
      </div></div>
      <!-- End of Comments Header -->

      <!-- Comment Card -->
      <div class="row">
      <div class="col-md-12">
      <div class="card mb-4 shadow-sm">
      <div class="card-body">
      <div class="row">

        <!-- Name, Rating, Date -->
        <div class="col-md-4">
        <!-- Name -->
        <h3 class="card-title">Dalton Prescott</h3>
        <!-- Rating -->
        <p><strong>3</strong> out of 5 Stars</p>

        <!-- Date -->
        <small class="text-muted">12/07/2018</small>
        </div>

        <!-- Comment Text -->
        <div class="col-md-8">
          <p>The Metro series so far has been defined by its claustrophobic setting and worldview. After nuclear war ravages Moscow in 2013, survivors who flee to the underground tunnels of the Metro system form their own independent states and societies, all in a bid to keep on living. That element of survival against the odds in a dangerous environment, rarely going outside into the irradiated city ruins, is inseparable from the franchise. So what happens when the series takes a step outside, hops on a train heading out of the tunnels, and goes above ground and into the heart of Russia?</p>
        </div>

      </div></div></div></div></div>
      <!-- End of Comment Card -->

      <!-- Dummy Comment Card -->
      <div class="row">
      <div class="col-md-12">
      <div class="card mb-4 shadow-sm">
      <div class="card-body">
      <div class="row">

        <!-- Name, Rating, Date -->
        <div class="col-md-4">
        <!-- Name -->
        <h3 class="card-title">Tom Misner</h3>
        <!-- Rating -->
        <p><strong>2</strong> out of 5 Stars</p>

        <!-- Date -->
        <small class="text-muted">6/07/2018</small>
        </div>

        <!-- Comment Text -->
        <div class="col-md-8">
          <p>The Metro series so far has been defined by its claustrophobic setting and worldview. After nuclear war ravages Moscow in 2013, survivors who flee to the underground tunnels of the Metro system form their own independent states and societies?</p>
        </div>

      </div></div></div></div></div>
      <!-- End of Dummy Comment Card -->

      <!-- Dummy Comment Card -->
      <div class="row">
      <div class="col-md-12">
      <div class="card mb-4 shadow-sm">
      <div class="card-body">
      <div class="row">

        <!-- Name, Rating, Date -->
        <div class="col-md-4">
        <!-- Name -->
        <h3 class="card-title">John Kennedy</h3>
        <!-- Rating -->
        <p><strong>5</strong> out of 5 Stars</p>

        <!-- Date -->
        <small class="text-muted">9/11/2001</small>
        </div>

        <!-- Comment Text -->
        <div class="col-md-8">
          <p>The Metro series so far has been defined by its claustrophobic setting and worldview. After nuclear war ravages Moscow in 2013, survivors who flee to the underground tunnels of the Metro system form their own independent states and societies, all in a bid to keep on living. That element of survival against the odds in a dangerous environment, rarely going outside into the irradiated city ruins.</p>
        </div>

      </div></div></div></div></div>
      <!-- End of Dummy Comment Card -->



      <!-- Comment Form -->
      <div class="row">
      <div class="col-md-12">
      <div class="card mb-4 shadow-sm">
      <h5 class="card-header">Leave A Comment</h5>
      <div class="card-body">
      <form>

        <!-- Name and Rating -->
        <div class="row">
          <!-- Name (Guest) -->
          <div class="form-group col-md-7">
            <label for="nameTextfield">Name</label>
            <input type="text" class="form-control" name="commenterName" id="nameTextfield" placeholder="Enter Name Here" required>
          </div>
          <!-- Rating -->
          <div class="form-group col-md-5">
            <label for="rating">Rating</label>
            <select id="rating" class="form-control" required>
              <option>1 Star</option>
              <option>2 Stars</option>
              <option>3 Stars</option>
              <option>4 Stars</option>
              <option>5 Stars</option>
            </select>
          </div>
        </div>

        <!-- Main Comment Body -->
        <div class="form-group">
          <!-- <label for="mainCommentBody">Example textarea</label> -->
          <textarea class="form-control" id="mainCommentBody" name="comment" rows="3" placeholder="Write Your Comment Here" required></textarea>
        </div>

        <!-- Comment button -->
        <button type="submit" class="btn btn-primary">Post Comment</button>

      </form>
      </div></div></div></div>
      <!-- End of Comment Form -->

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