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

    <title>Bloom Games - Search</title>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
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
            
            <!-- Start -->
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

      <section class="jumbotron text-center">
        <div class="container">
          <h1 class="jumbotron-heading">Search</h1>

          <form>

            <!-- Substring Search Bar -->
            <div class="form-group">
              <!-- <label for="exampleInputEmail1">Email address</label> -->
              <input type="text" class="form-control" id="searchString" placeholder="Type Keyword(s) Here">
            </div>

            <!-- Select Genre -->
            <div class="form-group">
              <label for="exampleFormControlSelect1">Select Genre</label>
              <select class="form-control" id="exampleFormControlSelect1">
                <option>Adventure</option>
                <option>Shooter</option>
                <option>Action</option>
                <option>Virtual Reality</option>
              </select>
            </div>

            <!-- All/New/Preowned -->
            <div class="form-group">
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
              <label class="form-check-label" for="inlineRadio1">All</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
              <label class="form-check-label" for="inlineRadio2">New</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
              <label class="form-check-label" for="inlineRadio3">Preowned</label>
            </div>
            </div>


            <!-- Search Button -->
            <div><button type="submit" class="btn btn-primary">Search</button></div>

          </form>


          <!-- <p class="lead text-muted">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don’t simply skip over it entirely.</p> -->
          <!-- <p>
            <a href="search.jsp" class="btn btn-primary my-2"><i class="fas fa-search"></i> Search Games</a>
            <a href="#" class="btn btn-secondary my-2">Secondary action</a>
          </p> -->
        </div>
      </section>

      <div class="album py-5 bg-light">
        <div class="container">

            <!-- Game Card -->
            <!-- Apex Legends -->
            <div class="row">
              <div class="col-md-12">
                <div class="card mb-4 shadow-sm">
                  <img class="imageFill" src="images/games/apexLegends.png"  width="100%" height="225">

                  <div class="card-body">
                    <h5 class="card-title">Apex Legends</h5>
                    <p class="card-text">Conquer with character in the next evolution of Battle Royale.</p>
                    <div class="d-flex justify-content-between align-items-center">
                      <!-- <a href="#" class="btn btn-primary">Buy</a> -->
                      <div class="btn-group">
                      <a href="game.jsp"  class="btn btn-sm btn-outline-primary">View</a>
                      <button type="button" class="btn btn-sm btn-outline-primary">Add to Cart</button>
                      </div>

                      <small class="text-muted">$6000</small>
                    </div>
                  </div>
                </div>
              </div>
            </div>

    </main>

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