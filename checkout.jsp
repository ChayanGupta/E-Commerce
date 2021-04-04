<%@page import="entiti.Product" %>
<%
	Product user=(Product)session.getAttribute("current-user");
	if(user==null)
	{
		session.setAttribute("message","You are not logged in !! Login First");
		response.sendRedirect("Login.jsp");
		return;
	}
	
%>



<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" type="image/png" href="favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="style.css"/>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <title>Checkout : Infiniti Collection</title>
    <script type="text/javascript" src="js/script.js"></script>
    
    <style type="text/css">
    	.custom-bg{
    		background:#673ab7 !important;
    	}
    	.c:focus {
  			outline: none;
  			box-shadow: none;
		}
		body{
   			background:linear-gradient(to right, rgb(62,32,233), rgba(250,64,64,0.5));  	
      	}
    </style>
  </head>
  <body>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
%>
  
  <!-- navbar started -->
    <nav class="navbar navbar-expand-lg navbar-dark custom-bg" style="text-color:red">
  		<div class="container" style="font-size:20px">
	  		<h3 style="font-size:30px; color:rgb(102, 255, 255)">Infiniti Collection</h3>
	  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    		<span class="navbar-toggler-icon"></span>
	  		</button>
	
	  		<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    		<ul class="navbar-nav ml-auto">
	      			<li class="nav-item active">
	        			<a class="nav-link" href="index.jsp" style="color:rgb(102, 255, 255)">Home <span class="sr-only">(current)</span></a>
	      			</li>
	      			<li class="nav-item active">
	        			<a class="nav-link" href="productpage.jsp" style="color:rgb(102, 255, 255)">Products <span class="sr-only">(current)</span></a>
	      			</li>
	      			<li class="nav-item active">
	        			<a href="Logout.jsp"><button class="nav-link custom-bg c" style="border-style:hidden; color:rgb(102, 255, 255); cursor:pointer" onClick="delete_local()">Logout</button></a>
	      			</li>
	      			<li class="nav-item active">
	        			<a class="nav-link" href="" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size:30px; color:rgb(255, 255, 153)"></i><span class="ml-1 cart-items">(0)</span></a>
	      			</li>
	    		</ul>
	  		</div>
  		</div>
	</nav>
	
	<!-- navbar ends -->
	
	<!-- checkout body starts -->
	
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-7">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-4" style="color:rgb(136, 78, 160)">Your Selected Items</h3>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>
			<div class="col-md-5">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mb-4" style="color:rgb(136, 78, 160)">Your Details for Checkout</h3>
						<form action="">
							<div class="form-group">
							    <label for="email">Email address</label>
							    <input value="<%= user.getUserEmail() %>" type="email" class="form-control form-control-lg" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
							    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							</div>
							<div class="form-group" style="font-size: 20px">
							    <label for="name">Your Name</label>
							    <input value="<%= user.getUserName() %>" type="text" class="form-control form-control-lg" id="name" aria-describedby="emailHelp" placeholder="Enter name">
							</div>
							<div class="form-group" style="font-size: 20px">
							    <label for="phone">Your Contact</label>
							    <input value="<%= user.getUserPhone() %>" type="text" class="form-control form-control-lg" id="name" aria-describedby="emailHelp" placeholder="Enter Contact Number">
							</div>
							<div class="form-group" style="font-size: 20px">
							    <label for="address">Shipping Address</label>
							    <textarea class="form-control form-control-lg" id="address" rows="4"></textarea>
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary">Order Now</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- checkout body ends -->
	
	<!-- modal -->
		
		<%@include file="common_modals.jsp" %>
		 
	<!-- modal -->
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	<script type="text/javascript" src="js/script.js"></script>
  	<script type="text/javascript">
  	$(document).ready(function(){
  		updateCart()
  	})
  	</script>
  </body>
</html>