<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Arrays,java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="org.tutorial.Player" %>
<%@ page import="org.tutorial.*" %>
    
<% ArrayList<Player> listeJoueurs = (ArrayList<Player>)request.getAttribute("listeJoueurs"); %>
<%-- TODO : cr�er une listeJoueurs dans le doProcess du servlet --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Liste des Joueurs</title>
<link rel="stylesheet" type="text/css" href="rolandgarros.css"> 

<style>
.collapsible {
  background-color: #00503C;
  color: white;
  cursor: pointer;
  padding: 18px;
  width: 75%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color: #D35220;
}

.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #f1f1f1;
}
</style>
</head>
<jsp:include page="./navbar.jsp"></jsp:include>



<body>
<%-- Script --%>

<%
/*Cr�ation d'une liste temporaire pour stocker des joueurs et voir comment g�rer la page
java.util.ArrayList<Player> liste_temporaire = new java.util.ArrayList<Player>();

//Cr�ation de joueurs
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

//rs = statement.executeQuery("SELECT * FROM joueurs;");

//System.out.println(listeJoueurs);

ArrayList<Match> listeAnnexe = new ArrayList<Match>();

Date dateMatch = new Date();
Match J1 = new Match(1, "Mark Hamil",  "Stephen Hawking", dateMatch, "/", "14h30", 11, "/", "En cours");
Match J2  = new Match(2, "Leroy Jenkins",  "Nadal", dateMatch, "/", "14h30", 8, "/", "En cours");
Match J3  = new Match(3, "Federer",  "Monfils",  dateMatch, "/", "14h30", 17, "/", "En cours");
Match J4  = new Match(4, "Monpere",  "Monsaintesprit",  dateMatch, "/", "14h30", 2, "/", "En cours");

listeAnnexe.add(J1) ;
listeAnnexe.add(J2) ;
listeAnnexe.add(J3) ;
listeAnnexe.add(J4) ;
%>

<h1>Liste des matchs</h1>

<ul>
	<%
	
	for (Match match:listeAnnexe) {
		int ID = match.getId();
		String Joueur1 = match.getNom_joueur1();
		String Joueur2 = match.getNom_joueur2();
		Date date = match.getDate();
		String heurematch = match.getHeure();
		String statut = match.getStatus();
		String score = match.getScore();
		int court = match.getCourt();
	%>
<li>

<button type="button" class="collapsible"><%=Joueur1%> - <%=Joueur2 %></button>
<div class="content">
  <p>Num�ro du match : <%=ID%></p>
  <p>Date : <%=date%>        Heure : <%=heurematch %></p>
  <p>Court : <%=court%></p>
  <p>Statut : <%=statut%></p>
  <p>Score : <%=score%></p>
   
</div>


</li>
<%} %>
</ul>


<%-- Script de la liste extensible--%>
<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}
</script>
</body>
<jsp:include page="./footer.jsp"></jsp:include>
</html>