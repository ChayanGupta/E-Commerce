<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="shortcut icon" type="image/png" href="favicon.png">
    <title>Login User: Infiniti Collection</title>
    
    <style type="text/css">
    	.custom-bg{
    		background:#673ab7 !important;
    	}
    	body{
   			background:linear-gradient(to right, rgb(62,32,233), rgba(250,64,64,0.5));  	
      	}
    </style>
  </head>
  <body>

  <!-- navbar started -->
    <nav class="navbar navbar-expand-lg navbar-dark custom-bg">
  		<div class="container">
	  		<h3 style="font-size:30px; color:rgb(102, 255, 255)">Infiniti Collection</h3>
	  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    		<span class="navbar-toggler-icon"></span>
	  		</button>
	
	  		<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    		<ul class="navbar-nav ml-auto">
	      			<li class="nav-item active">
	        			<a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
	      			</li>
	      			<li class="nav-item">
	        			<a class="nav-link" href="Login.jsp">Login</a>
	      			</li>
	      			<li class="nav-item active">
	        			<a class="nav-link" href="Registration.jsp">Register</a>
	      			</li>
	    		</ul>
	  		</div>
  		</div>
	</nav>
	
	<!-- navbar ends -->

	<!-- login form starts -->
	
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header custom-bg text-white text-center">
						<h3>Login here</h3>
					</div>
					<div class="card-body" style="background-color:rgb(244, 143, 177)">
		
	
	<%
		String message=(String)session.getAttribute("message");
		if(message==null)
		{}
		else if(message=="Email and Password Mismatch!" || message=="You are not logged in !! Login First")
		{
	%>
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
			  <strong><%=message %></strong>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
	<%		
			session.removeAttribute("message");
		}
	%>
						<form action="login" method="post">
						  <div class="form-group">
						    <label for="exampleInputEmail1" style="font-weight:bold">Email address</label>
						    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
						    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1" style="font-weight:bold">Password</label>
						    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
						  </div>
						  <div class="container text-center">
						  	<button type="submit" class="btn btn-success">Login</button>
						  	<button type="reset" class="btn btn-warning">Reset</button>
						  </div>
						</form>
					</div>
				</div>
				<div class="container text-center mt-3">
					<h4>New to Infiniti Collection?<a href="Registration.jsp" style="color:rgb(51, 255, 0 )"> &nbsp;Create an account.</a></h4>
				</div>
			</div>
		</div>
	</div>
	
	<!-- login form ends -->
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>