<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Arrays,java.util.List" %>
<%@ page import="org.tutorial.Player" %>
<%@ page import="org.tutorial.*" %>
    
<% java.util.ArrayList<Player> listeJoueurs = (java.util.ArrayList<Player>)request.getAttribute("listeJoueurs"); %>
<%-- TODO : créer une listeJoueurs dans le doProcess du servlet --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Liste des Joueurs</title>
</head>
<body>
<%-- Script --%>

<%
/*Création d'une liste temporaire pour stocker des joueurs et voir comment gérer la page
java.util.ArrayList<Player> liste_temporaire = new java.util.ArrayList<Player>();

//Création de joueurs
Player J1 = new Player(1, "Mark", "Hamil",  false,  "UK",  69,  false, 10);
Player J2  = new Player(2, "Stephen", "Hawking",  false,  "UK",  72,  true, 42);

liste_temporaire.add(J1);
liste_temporaire.add(J2);

l
d ID: <% out.println( joueur.get(0).getId() ); > </div>
d Nom : <% out.println( joueur.get(0).getFirst_name() ); > <% out.println( liste_temporaire.get(0).getLast_name() ); > </div>
l

//out.println(J1);
//out.println( liste_temporaire.get(0) );
*/
%>

<h1>Liste des joueurs</h1>

<ul>

<%	for (Player joueur:listeJoueurs) {
		int ID = joueur.getId();
		String Prenom = joueur.getFirst_name();
		String Nom = joueur.getLast_name();
	%>
<li>
<div> ID: <%=ID%> </div>
<div> Nom : <%=Prenom%> <%=Nom %> </div>
</li>
<%} %>
</ul>

<%-- <a href="<%= request.getRequestURI() %>">Refresh</a> --%>

</body>
</html>