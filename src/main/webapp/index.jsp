<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Roland Garros</title>
<link rel="stylesheet" type="text/css" href="rolandgarros.css"> 

</head>
<jsp:include page="./header.jsp"></jsp:include>
<body>
	<h1>Bienvenue sur la page d'accueil de Roland Garros</h1>
	<a href="<%= request.getRequestURI() %>"> Liste des joueurs </a>
</body>
<jsp:include page="./footer.jsp"></jsp:include>
</html>