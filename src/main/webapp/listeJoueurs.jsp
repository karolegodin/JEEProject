<%@ page import="java.util.Arrays,java.util.List" %>
<%@ page import="org.tutorial.Player" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%-- Script --%>
<%
//Création d'une liste temporaire pour stocker des joueurs et voir comment gérer la page
java.util.ArrayList<Player> liste_temporaire = new java.util.ArrayList<Player>();

//Création de joueurs
Player J1 = new Player(1, "Mark", "Hamil",  false,  "UK",  8,  false, 10);

liste_temporaire.add(J1);
%>

<p>Liste des joueurs</p>

<ul name="liste_des_joueurs">
<li>ID : <% liste_temporaire.get(0).getId(); %>
Nom : <% liste_temporaire.get(0).getFirst_name(); %> <% liste_temporaire.get(0).getLast_name(); %> </li>

<a href="<%= request.getRequestURI() %>">Refresh</a>
</ul>
</body>
</html>