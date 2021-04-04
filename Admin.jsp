<%@page import="entiti.Product" %>
<%
	Product user=(Product)session.getAttribute("current-user");
	if(user==null)
	{
		session.setAttribute("message","You are not logged in !! Login First");
		response.sendRedirect("Login.jsp");
		return;
	}
	else
	{
		if(user.getUserType().equals("normal"))
		{
			session.setAttribute("message", "You are not Admin ! Do not access this page");
			response.sendRedirect("Login.jsp");
			return;
		}
	}
%>


<%
	Product user1=(Product)session.getAttribute("current-user");
%>

<%@page import="dao.CategoryDao" %>
<%@page import="java.util.List" %>
<%@page import="entiti.Category" %>
<%@page import="mypackage.FactoryProvider" %>
<%@page import="mypackage.Helper" %>
<%@page import="java.util.Map" %>

<%
	CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
	List<Category> list=cdao.getCategories();
	Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
%>


<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="shortcut icon" type="image/png" href="favicon.png">
    <title>Admin Portal : Infiniti Collection</title>
    
    <style type="text/css">
    	.custom-bg{
    		background:#673ab7 !important;
    	}
    	.admin .card:hover{
    		background:#e2e2e2;
    		cursor:pointer;
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
    <nav class="navbar navbar-expand-lg navbar-dark custom-bg">
  		<div class="container">
	  		<a class="navbar-brand" href=" ">Infiniti Collection</a>
	  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    		<span class="navbar-toggler-icon"></span>
	  		</button>
	
	  		<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    		<ul class="navbar-nav ml-auto">
	      			<li class="nav-item active">
	        			<a class="nav-link" href=""><%= user1.getUserName()%><span class="sr-only">(current)</span></a>
	      			</li>
	      			<li class="nav-item">
	        			<a class="nav-link" href="logout">Logout</a>
	      			</li>
	    		</ul>
	  		</div>
  		</div>
	</nav>
	
	<!-- navbar ends -->

	<!-- admin page body starts -->
	
	<div class="container admin">
		<div class="container-fluid mt-3">
			<%
			String message=(String)session.getAttribute("message2");
			%>
			<%
			if(message==null)
			{}
			else if(message=="Category added Successfully")
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
	<%
			String mes=(String)session.getAttribute("message3");
			%>
			<%
			if(mes==null)
			{}
			else if(mes=="Product added Successfully!!")
			{
			
			%>
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
			  <strong><%=mes %></strong>
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    <span aria-hidden="true">&times;</span>
			  </button>
			</div>
			<%		
			session.removeAttribute("message");
		}
	%>
		</div>
		<div class="row mt-3">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:125px" class="img-fluid" src="img/teamwork.png" alt="user_icon">
						</div>
						<h1><%= m.get("userCount")%></h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:125px" class="img-fluid" src="img/list.png" alt="user_category">
						</div>
						<h1><%= list.size()%></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:125px" class="img-fluid" src="img/delivery-box.png" alt="user_product">
						</div>
						<h1><%= m.get("productCount")%></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-category-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:125px" class="img-fluid rounded-circle" src="img/math.png" alt="user_add_category">
						</div>
						<p class="mt-2">Click here to add new Category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-product-modal">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width:125px" class="img-fluid" src="img/plus.png" alt="user_add_product">
						</div>
						<p class="mt-2">Click here to add new Products</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>
		</div>
		
	</div>

	<!-- admin page body ends -->

	<!-- Modal for add category-->
	
	<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header custom-bg text-white">
	        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form action="ProductAddServlet" method="post">
	        	<input type="hidden" name="operation" value="addcategory">
	        	<div class="form-group">
	        		<input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required>
	        	</div>
	        	<div class="form-group">
	        		<textarea style="height:250px" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
	        	</div>
	        	<div class="container text-center">
	        		<button class="btn btn-outline-success">Add Category</button>
	        		<button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
	        	</div>
	        </form>
	      </div>
	    </div>
	  </div>
	</div>

<!--ends modal for add category -->

<!-- start of product modal -->
	
	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<form action="ProductAddServlet" method="post" enctype="multipart/form-data">
	      		<input type="hidden" name="operation" value="addproduct">
	      		<div class="form-group">
	      			<input class="form-control" type="text" name="pName" placeholder="Enter Title of Product" required>
	      		</div>
	      		<div class="form-group">
	      			<textarea style="height:150px" class="form-control" name="pDesc" placeholder="Enter Description of Product" required></textarea>
	      		</div>
	      		<div class="form-group">
	      			<input class="form-control" type="number" name="pPrice" placeholder="Enter Price of Product" required>
	      		</div>
	      		<div class="form-group">
	      			<input class="form-control" type="number" name="pDiscount" placeholder="Enter Discount on Product" required>
	      		</div>
	      		<div class="form-group">
	      			<input class="form-control" type="text" name="Asin" placeholder="Enter ASIN of Product" required>
	      		</div>
	      		
	      		<div class="form-group">
	      			<select name="catId" class="form-control" id="">
	      				<%
	      					for(Category c:list){
	      				%>
	      				<option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
	      				<% } %>
	      			</select>
	      		</div>
	      		<div class="form-group">
	      			<label for="pPic">Select Picture of Product</label>
	      			<br>
	      			<input type="file" id="pPic" name="pPic" required/>
	      		</div>
	      		<div class="container text-center">
	      			<button class="btn btn-outline-success">Add Product</button>
	      			<button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
	      		</div>
	      	</form>
	      </div>
	    </div>
	  </div>
	</div>

<!-- end of product model -->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  </body>
</html>