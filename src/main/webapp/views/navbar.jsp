<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rolandgarros.css"> 
</head>
<body>
    <nav class="nav-second navbar custom-navbar navbar-expand-sm sticky-top bg-white">
        <div class="container">
        	<a class="navbar-brand" href="${pageContext.request.contextPath}">
        		<img src="${pageContext.request.contextPath}/img/Logo.svg">
        		<div class="navbar-title">
        			<strong class="small">Roland-Garros</strong>
        			<h1 class="sub small">16 mai - 5 Juin</h1>
        		</div>
        	</a>
            <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto"> 
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/views/listeJoueurs.jsp">Joueurs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/views/listeMatchs.jsp">Matchs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/views/statistiques.jsp">Statistiques</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/editJoueur">Modifier joueurs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/editMatchs">Modifier matchs</a>
                    </li>
                </ul> 
                <ul class="navbar-nav ml-auto">
                <%              	
                if (request.getSession().getAttribute("loginedUser") == null){
                %>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-primary btn-sm">Connexion</a>
                    </li>
                    <% } else { %>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/logout" class="btn btn-primary btn-sm">Déconnexion</a>
                    </li>
                 
                    <li class="nav-item"> <span style="color:red">[ ${loginedUser.userName} ]</span> </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>