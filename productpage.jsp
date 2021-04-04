<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" type="image/png" href="favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="style.css"/>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Products : Infiniti Collection</title>
    <script type="text/javascript" src="js/script.js"></script>
    <link rel="shortcut icon" type="image/png" href="favicon.png">
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
	        			<a class="nav-link" href="" style="color:rgb(102, 255, 255)"><%= user4.getUserName() %></a>
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
	        			<a class="nav-link" href="Login.jsp" style="color:rgb(102, 255, 255)">Login</a>
	      			</li>
	      			<li class="nav-item active">
	        			<a class="nav-link" href="Registration.jsp" style="color:rgb(102, 255, 255)">Register</a>
	      			</li>
	      			<li class="nav-item active">
	        			<a class="nav-link" href="" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size:30px; color:rgb(255, 255, 153)"></i><span class="ml-1 cart-items">(0)</span></a>
	      			</li>
	    		</ul>
	  		</div>
  		</div>
	</nav>
<%
	}
%>
	<!-- navbar ends -->
	
	<!-- product body starts -->
		<%@page import="mypackage.FactoryProvider" %>
		<%@page import="dao.ProductDao" %>
		<%@page import="java.util.List" %>
		<%@page import="entiti.Product" %>
		<%@page import="dao.CategoryDao" %>
		<%@page import="entiti.Category" %>
		<%@page import="mypackage.Helper" %>
		<div class="container-fluid">
		<div class="row mt-3 mx-2">
		<%
			FactoryProvider.getFactory();
 		%>
			<%
				String cat=request.getParameter("category");
				
				ProductDao dao=new ProductDao(FactoryProvider.getFactory());
				List<Product> list=null;
	
				if(cat==null)
				{	
					list=dao.getAllProducts();
				}
				else
				{
					int cid=Integer.parseInt(cat.trim());
					list=dao.getAllProductsById(cid);
				}
				CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
				List<Category> clist=cdao.getCategories();
			%>
			
			
			
			<!-- show categories -->
			
			<div class="col-md-2">
				<div class="list-group mt-4" role="toolbar">
			  <a href="productpage.jsp" class="list-group-item list-group-item-action active" style="font-size:24px">All Products</a>
			  
			  
				<%
					for(Category c:clist)
					{
				%>
						<a href="productpage.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action active mt-1" style="font-size:24px"><%= c.getCategoryTitle() %></a>
				<% 		
					}
				%>
				
				</div>
			</div>
			
			
			<!-- show products -->
			
			
			
			<div class="col-md-10">
				<div class="row mt-4">
					<div class="col md-12">
						<div class="card-columns">
							<%
								for(Product p:list)
								{
									if(p.getpName()!=null)
									{
							%>
						<!-- product card -->
						
						<div class="card product-card">
						<a href="display.jsp?product=<%= p.getpId()%>">
						<div class="container text-center">
							<img class="card-img-top" src="img/img<%= p.getpId()-1%>.jpg" alt="Card image cap" style="max-height:270px; max-width:100%">
						</div>
						
							<div class="card-body">
								<h5 class="card-title"><%= p.getpName() %></h5>
								<p class="card-text"><%= Helper.get10Words(p.getpDesc()) %></p>
							</div>
							</a>
							<div class="card-footer text">
								<button class="btn btn-primary text-white" onClick="add_to_cart(<%= p.getpId()%>,'<%= p.getpName()%>',<%= p.getpPrice()%>)">Add to Cart</button>
								<button class="btn btn-outline-primary">&#36;<%= p.getpPrice() %>/- &nbsp;<span class="text-secondary discount-label"><%= p.getpDiscount() %>% off</span></button>
								
							</div>
						</div>
						
							<%	
								}
									}
								
								if(list.size()==0)
								{
									out.println("No items in this category");
								}
							%>
						</div>
					</div>
				</div>
				
			</div>
			
		</div>
		</div>
		
	<!-- product body ends -->
	
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
  	<script type="text/javascript">
  		function goToCheckout()
  		{
	  		if(cart==null || cart.length==0)
	  		{
	  			document.getElementById("myBtn").disabled = true;
	  		}
	  		else
	  		{
	  			document.getElementById("myBtn").disabled = false;
	  			window.location="checkout.jsp";
	  		}
  		}
  	</script>
  </body>
</html>