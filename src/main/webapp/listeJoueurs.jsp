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

ArrayList<Player> listeAnnexe = new ArrayList<Player>();
Player J1 = new Player("Mark", "Hamil",  "Droitier",  "UK",  69,  "F�minin", 10);
Player J2  = new Player("Stephen", "Hawking",  "Gaucher",  "UK",  72,  "Masculin", 42);
Player J3  = new Player("LAM", "SIPRENDI",  "Droitier",  "FR",  21,  "Masculin", 10938983);
Player J4  = new Player("Karlol", "Karglass",  "Droitier",  "UK",  17,  "Masculin", 42);

listeAnnexe.add(J1) ;
listeAnnexe.add(J2) ;
listeAnnexe.add(J3) ;
listeAnnexe.add(J4) ;
%>

<h1>Liste des joueurs</h1>

<ul>
	<%
	
	for (Player joueur:listeAnnexe) {
		String Prenom = joueur.getFirst_name();
		String Nom = joueur.getLast_name();
		String Pays = joueur.getCountry();
		int Age = joueur.getAge();
		int classement = joueur.getWorld_rank();
		String main = joueur.getMain_hand();
		String categ = joueur.getCategory();
	%>
<li>

<button type="button" class="collapsible"><%=Prenom%> <%=Nom %> (<%=Pays%>)</button>
<div class="content">
  <p>Cat�gorie : <%=categ%></p>
  <p>Age : <%=Age%></p>
  <p>Classement mondial : <%=classement%></p>
  <p>Main : <%=main%></p>
  
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