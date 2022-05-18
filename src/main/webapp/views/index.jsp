<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Roland Garros</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rolandgarros.css"> 

</head>

<jsp:include page="./navbar.jsp"></jsp:include>

<body>
<header class="header">
	<div class="overlay">
		<img class="logo" alt="Logo" src="./img/Logo.svg">
			<h1 class="subtitle">Bienvenue sur le site (presque) officiel de</h1>
			<h1 class="title">Roland-Garros 2022</h1>
		</div>
</header>
</body>
<jsp:include page="./footer.jsp"></jsp:include>
</html>