<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/png" href="favicon.png">
</head>
<body>

	<%
		session.removeAttribute("current-user");
		response.sendRedirect("index.jsp");
	%>
</body>
</html>