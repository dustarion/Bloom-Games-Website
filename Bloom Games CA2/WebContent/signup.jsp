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

    <title>Bloom Games - Signup</title>

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

          </ul>

          <ul class="navbar-nav navbar-right">
            <!-- Login/Signup Buttons -->
            <a class="nav-link" href="signup.jsp"><i class="fas fa-user-alt"></i> Sign Up</a>
            <a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>

          </ul>

        </div>
      </div>
    </nav>

    <!-- Signup Section -->
    <div class="container">

      <!-- Signup Message -->
      <div class="py-5 text-center">
        <h2>Signup</h2>
        <p class="lead">Welcome to Bloom Games. Create your account to get started.</p>
      </div>

      <div class="row">

        <!-- Signup Form -->
        <div class="col-md-12 order-md-1">
          <h4 class="mb-3">Signup Details</h4>
          <form class="needs-validation" action="ServletRegister" method="POST">
          
          	<%
          	if(request.getParameter("fail")!= null){
          	
				if(request.getParameter("fail").equals("null")){
					out.print("<div class=\"alert alert-danger\" role=\"alert\">");
					out.print("Some Fields are Not Filled");
					out.print("</div>");
				}
          	
	          	if(request.getParameter("fail").equals("condition")){
					out.print("<div class=\"alert alert-danger\" role=\"alert\">");
					out.print("Data does not meet the needed conditions.");
					out.print("</div>");
				}
	          	
	          	if(request.getParameter("fail").equals("1")){
					out.print("<div class=\"alert alert-danger\" role=\"alert\">");
					out.print("Failed to Register");
					out.print("</div>");
				}
          	}
			%>
            
            <!-- First and Last Name -->
            <div class="row">

              <!-- First Name -->
              <div class="col-md-12 mb-3">
                <label for="firstName">Name</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="" value="" required>
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>

            </div>

            <!-- Mailing Address -->
            <div class="mb-3">
              <label for="address">Mailing Address</label>
              <input type="text" class="form-control" name="mailingAddress" id="mailingAddress" placeholder="1234 Main St" required>
              <div class="invalid-feedback">
                Please enter your mailing address.
              </div>
            </div>

            <!-- Email -->
            <div class="mb-3">
              <label for="email">Email </label>
              <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com" required>
              <div class="invalid-feedback">
                Please enter a valid email address.
              </div>
            </div>

            <!-- Contact Number -->
            <div class="mb-3">
              <label for="contactNumber">Contact Number</label>
              <input type="number" class="form-control" name="contactNumber" id="contactNumber" placeholder="xxxx xxxx" required>
              <div class="invalid-feedback">
                Please enter a valid contact number.
              </div>
            </div>

            <!-- Password -->
            <div class="mb-3">
              <label for="inputPassword">Password</label>
              <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
              <div class="invalid-feedback">
                Invalid password. Password must contain both alphabets and numbers and be between 8 to 16 characters long.
              </div>
            </div>
            
            <%
            if(request.getParameter("fail")!= null){
				if(request.getParameter("fail").equals("passwordMatch")){
					out.print("<div class=\"alert alert-danger\" role=\"alert\">");
					out.print("Passwords Do Not Match");
					out.print("</div>");
				}
            }
			%>

            <!-- Confirm Password -->
            <div class="mb-3">
              <label for="confirmPassword">Confirm Password</label>
              <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required>
              <div class="invalid-feedback">
                Password does not match.
              </div>
            </div>


            <!-- Divider Line -->
            <hr class="mb-4">

            <!-- Confirm Button -->
            <input type="submit" class="btn btn-lg btn-primary btn-block" name="submit" value="Signup">

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
    <script src="js/CheckoutFormValidation.js"></script>
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