<%@ page import="db.*"%>
<%@ page import="java.util.ArrayList"%>

<%
	// If the userID of the session exists, redirect to the home page.
	if(session.getAttribute("userid")!= null){
		response.sendRedirect("index.jsp");
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

    <title>Bloom Games - Login</title>

    <!-- Custom styles for this template -->
    <link href="css/styles.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">

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
<!--             <li class="nav-item">
              <a class="nav-link" href="cart.jsp"><i class="fas fa-shopping-cart"></i> Cart</a>
            </li> -->

          </ul>

          <ul class="navbar-nav navbar-right">
            <!-- Login/Signup Buttons -->
            <a class="nav-link" href="signup.jsp"><i class="fas fa-user-alt"></i> Sign Up</a>
            <a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>

          </ul>

        </div>
      </div>
    </nav>

    <div class="loginSection">
      <form class="form-signin" action="ServletLogin" method="POST">

      <!-- Title -->
      <h1 class="h3 mb-3 font-weight-normal">Member Login</h1>
      
      <% 
		if(request.getParameter("fail")!= null){
			out.print("<div class=\"alert alert-danger\" role=\"alert\">");
			out.print("Invalid Email or Password!");
			out.print("</div>");
		}
		%>

      <!-- Email Address -->
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="email" name="email" id="email" class="form-control" placeholder="Email address" required autofocus>

      <!-- Password -->
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>

      <!-- Or Signup Button -->
      

      <!-- Login Button -->
      <!-- <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button> -->
      <input type="submit" class="btn btn-lg btn-primary btn-block" name="submit" value="Login">

      <!-- Copyright Text -->
      <p class="mt-5 mb-3 text-muted">&copy; Bloom Games 2019</p>
    </form>
      
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