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
Player J1 = new Player(1, "Mark", "Hamil",  false,  "UK",  69,  false, 10);
Player J2  = new Player(2, "Stephen", "Hawking",  false,  "UK",  72,  true, 42);

liste_temporaire.add(J1);
liste_temporaire.add(J2);



//out.println(J1);
//out.println( liste_temporaire.get(0) );
%>

<h1>Liste des joueurs</h1>

<ul name="liste_des_joueurs">

<li>
<div> ID: <% out.println( liste_temporaire.get(0).getId() ); %> </div>
<div> Nom : <% out.println( liste_temporaire.get(0).getFirst_name() ); %> <% out.println( liste_temporaire.get(0).getLast_name() ); %> </div>
</li>

</ul>

<%-- <a href="<%= request.getRequestURI() %>">Refresh</a> --%>

</body>
</html>