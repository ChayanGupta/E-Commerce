<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" type="image/png" href="favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Product : Infiniti Collection</title>
    <style type="text/css">
    	.custom-bg{
    		background:#673ab7 !important;
    	}
    	body{
    		overflow-x:hidden;
    	}
    </style>
  </head>
  <body>

      <%
  	FactoryProvider.getFactory();
  %>
   <%@page import="entiti.Product" %>
<%
	Product user=(Product)session.getAttribute("current-user");
	if(user!=null)
	{Product user4=(Product)session.getAttribute("current-user");
%>
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
	        			<a class="nav-link" href="productpage.jsp" style="color:rgb(102, 255, 255)">Products</a>
	      			</li>
	      			<li class="nav-item active">
	        			<a class="nav-link" href="" style="color:rgb(102, 255, 255)"><%= user4.getUserName() %></a>
	      			</li>
	      			<li class="nav-item active">
	        			<a href="Logout.jsp"><button class="nav-link custom-bg c" style="border-style:hidden; color:rgb(102, 255, 255); cursor:pointer" onClick="delete_local()">Logout</button></a>
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
	        			<a class="nav-link" href="productpage.jsp" style="color:rgb(102, 255, 255)">Products</a>
	      			</li>
	      			<li class="nav-item active">
	        			<a class="nav-link" href="Registration.jsp" style="color:rgb(102, 255, 255)">Register</a>
	      			</li>
	      			<li class="nav-item active">
	        			<a class="nav-link" href="Login.jsp" style="color:rgb(102, 255, 255)">Login</a>
	      			</li>
	    		</ul>
	  		</div>
  		</div>
	</nav>
	
<%
	}
%>
	<!-- navbar ends -->

	<!-- content starts -->
		<%@page import="mypackage.FactoryProvider" %>
		<%@page import="dao.ProductDao" %>
		<%@page import="java.util.List" %>
		<%@page import="entiti.Product" %>
		<%@page import="dao.CategoryDao" %>
		<%@page import="entiti.Category" %>
		<%@page import="mypackage.Helper" %>
		
	
	
	<%
        String uri=request.getQueryString();
		String c="";
		if(uri.length()==10)
		{
			String a=String.valueOf(uri.charAt(8));
			String b=String.valueOf(uri.charAt(9));
			c=a+b;
		}
		else
		{
			c=String.valueOf(uri.charAt(8));
		}
		int i=Integer.parseInt(c);
		ProductDao dao=new ProductDao(FactoryProvider.getFactory());
		List<Product> list=dao.getProductByProductId(i);
	%>
	
	
	<%
		for(Product p:list)
		{
		
	%>
			
			<div class="row mt-5 ml-3 mr-3">
			  <div class="col-sm-6">
			    <div class="card" style="border:0px">
			      <div class="card-body">
			        <img src="img/img<%= p.getpId()-1%>.jpg" width=100% height=700px/>
			      </div>
			    </div>
			  </div>
			  <div class="col-sm-6">
			    <div class="card" style="border:0px">
			      <div class="card-header">
			        <h2 style="color:rgb(52, 152, 219)"><%= p.getpName() %></h2><br>
			      </div>
			      <div class="card-body">
			      <div class="row">
			      	<h4><i class="fa fa-heart" aria-hidden="true" style="color:red"></i> Wrap yourself in the Softness of the luxurious 100% Heavy Egyptian Cotton bedding like those found in World Class Hotels.</h4><br>
			      </div>
			      <div class="row">
			      	<h4><i class="fa fa-heart" aria-hidden="true" style="color:red"></i> These fine luxury bed linens are crafted from long staple cotton.</h4><br>
			      </div>
			      <div class="row">
			      	<h4><i class="fa fa-heart" aria-hidden="true" style="color:red"></i> Comfort, quality and opulence bedding set our luxury bedding in a class above the rest.</h4><br>
			      </div>
			      <div class="row">
			      	<h4><i class="fa fa-heart" aria-hidden="true" style="color:red"></i> Elegant yet durable, their softness is enhanced with each washing.</h4><br>
			      </div>
			      <div class="row">
			      	<h4><i class="fa fa-heart" aria-hidden="true" style="color:red"></i> If you have never experienced the luxury and elegance of high quality beddings .... try it! There is a difference !</h4><br>
			      </div>
			      <div class="row">
			      	<h4 style="color:red">Asin: <%= p.getAsin() %></h4><br><br>
			      </div>
			      <div class="row">
			      	<h4 style="color:red">Price: $<%= p.getpPrice() %> and FREE Shipping</h4><br>
			      </div>
			      </div>
			  </div>
			</div>
			</div>
			
			<div class="container">
				<br><h3 style="color:rgb(255, 193, 7 )">Product description</h3><br>
			     <h4 style="color:rgb(112, 123, 124)"><%= p.getpDesc() %></h4><br><br>
			     <img src="img/regular1.jpg" style="width:47%; height:400px">
			     <img class="ml-5" src="img/regular2.jpg" style="width:47%; height:400px">
			     <img class="mt-5" src="img/regular3.jpg" style="width:47%; height:400px">
			     <img class="ml-5 mt-5" src="img/regular4.jpg" style="width:47%; height:400px">
			 </div>	
			
	<%
		}
	%>

	<!-- content ends -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  </body>
</html>