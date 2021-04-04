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
		if(user.getUserType().equals("admin"))
		{
			session.setAttribute("message", "You are not normal user ! Do not access this page");
			response.sendRedirect("Login.jsp");
			return;
		}
	}
%>

<%
	Product user2=(Product)session.getAttribute("current-user");
%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" type="image/png" href="favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <title>Infiniti Collection</title>
    
    <style type="text/css">
    	.custom-bg{
    		background:#673ab7 !important;
    	}
    </style>
  </head>
  <body>

 	<%
 		response.sendRedirect("productpage.jsp");
 	%>
  </body>
</html>