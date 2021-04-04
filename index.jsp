<!doctype html>
<%@page import="mypackage.FactoryProvider"%>
<%@page import="entiti.Product" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" type="image/png" href="favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="style.css"/>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Old+Standard+TT:wght@700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
	
    <title>Infiniti Collection</title>
    <style type="text/css">
    	.c:focus {
  			outline: none;
  			box-shadow: none;
		}
    </style>
    <script type="text/javascript" src="js/script.js"></script>
  </head>
  <body>

  <%
	FactoryProvider.getFactory();
  %>
   
<%
	Product user=(Product)session.getAttribute("current-user");
	if(user!=null)
	{Product user1=(Product)session.getAttribute("current-user");
%>
	<nav class="navbar navbar-expand-lg navbar-light bg-warning">
  		<div class="container" style="font-size:22px">
  			Infiniti Collection
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav ml-auto menus">
			      <li class="nav-item active">
			        <a class="nav-link" href="#header_section">Home <span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item active">
			        <a class="nav-link" href="#service_section">Services</a>
			      </li>
			      <li class="nav-item active">
			        <a class="nav-link" href="#contact_section">Contact us</a>
			      </li>
			      <li class="nav-item active">
			        <a class="nav-link" href=""><%= user1.getUserName() %></a>
			      </li>
			      <li class="nav-item active">
			        <a href="Logout.jsp"><button class="nav-link custom-bg c" style="border-style:hidden; cursor:pointer; background-color:transparent" onClick="delete_local()">Logout</button></a>
			      </li>
			    </ul>
			</div>
  		</div>
	</nav>
<%	
	}
	else
	{
%>
  
  
  <!-- start of navbar -->
  
    <nav class="navbar navbar-expand-lg navbar-light bg-warning">
  		<div class="container" style="font-size:22px">
  			Infiniti Collection
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
			    <ul class="navbar-nav ml-auto menus">
			      <li class="nav-item active">
			        <a class="nav-link" href="#header_section">Home <span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item active">
			        <a class="nav-link" href="#service_section">Services</a>
			      </li>
			      <li class="nav-item active">
			        <a class="nav-link" href="#contact_section">Contact us</a>
			      </li>
			      <li class="nav-item active">
			        <a class="nav-link" href="Registration.jsp">Register</a>
			      </li>
			      <li class="nav-item active">
			        <a class="nav-link" href="Login.jsp">Login</a>
			      </li>
			    </ul>
			</div>
  		</div>
	</nav>
 <%
	}
  %> 
    <!-- end of navbar -->
    
    <!-- header section starts -->
    
    <header class="header" id="header_section">
    	<div class="container h-100">
    		<div class="row h-100 align-items-center">
    			<div class="col-md-12 text-center">
    				<h1 class="animate__animated animate__backInDown wow" style="color: lightblue; font-size:100px"><b>Infiniti Collection</b> </h1>
    				<p class="animate__animated animate__fadeIn wow" style="color: lightpink; font-size:20px">Welcome to Infiniti Collection, where you find the best-reviewed products.<br>Redecorate your room without a major overhaul using sheets. Check out our collection of bed sheets in tons of styles and colors. 
					Time to go under cover. Bed sheets are a great way to bring character to your bedroom. Take the opportunity to experiment with fresh hues and bring bold patterns into play. Solid colors are timeless while bold hues can make the bed the focus of the room. From modern to traditional, there are sheets to match almost any decor style.</p>
    				<form action="productpage.jsp">
    					<button type="submit" class="btn btn-primary animate__animated animate__backInUp wow">Explore Products</button>
    				</form>
    			</div>
    		</div>
    	</div>
    </header>
   
    <!-- end of header section -->
    
    <!-- start of services section -->
    
    <section class="services" id="service_section">
    	<div class="container text-center py-5">
    		<h1 style="color:darkblue">Services</h1>
    		<div class="row">
    			<div class="col-md-4">
    				<div class="card wow animate__animated animate__zoomIn">
    					<div class="card-body">
    						<i class="fa fa-car" style="font-size:48px;color:red;"></i>
    						<h1 style="color:purple">FAST SHIPPING</h1>
    						<p>We provide you a fast shipping service and delivers your order within 3-5 working days.</p>
    					</div>
    				</div>
    				
    			</div>
    			<div class="col-md-4">
    				<div class="card wow animate__animated animate__zoomIn">
    					<div class="card-body">
    						<i class="fa fa-smile-o" style="font-size:54px;color:red"></i><br><br>
    						<h1 style="color:purple">DISCOUNTS</h1>
    						<p>Huge discounts on the products through which you can save your money.<br>You can also get the huge discounts during the festive and wedding season</p>
    					</div>
    				</div>
    			</div>
    			<div class="col-md-4">
    				<div class="card wow animate__animated animate__zoomIn">
    					<div class="card-body">
    						<i class="fa fa-university" style="font-size:54px;color:red"></i><br><br>
    						<h1 style="color:purple">Payment mode</h1>
    						<p> Payment mode is totally depending upon you whether you want to pay by the credit cards or to cash on delivery. You can choose any payment mode.</p>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
    
    
    <!-- end of services section -->
    
   	<!-- contact section -->
   	
   	<section class="contact" id="contact_section">
   		<div class="container text-center py5">
   			<h1 style="color:blue">Let's Get In Touch!</h1>
   			<p>For any query's and confusion you can contact us.</p>
   			<i class="fa fa-phone" style="font-size:48px;color:red"></i>
   			<i class="fa fa-heart" style="font-size:48px;color:red"></i>
   			<p>+91 7428730894</p>
   		</div>
   	</section>
   	
   	<!-- end of contact section -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="wow.min.js"></script>
    <script>new WOW().init();</script>
  </body>
</html>