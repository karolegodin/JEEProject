<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Arrays,java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="org.tutorial.Player" %>
<%@ page import="org.tutorial.*" %>
    
<% ArrayList<Player> listeJoueurs = (ArrayList<Player>)request.getAttribute("listeJoueurs"); %>
<%-- TODO : créer une listeJoueurs dans le doProcess du servlet --%>

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

//rs = statement.executeQuery("SELECT * FROM joueurs;");

//System.out.println(listeJoueurs);

ArrayList<Player> listeAnnexe = new ArrayList<Player>();
Player J1 = new Player(1, "Mark", "Hamil",  false,  "UK",  69,  false, 10);
Player J2  = new Player(2, "Stephen", "Hawking",  false,  "UK",  72,  true, 42);
Player J3  = new Player(3, "LAM", "SIPRENDI",  false,  "FR",  21,  true, 10938983);
Player J4  = new Player(4, "Karlol", "Karglass",  true,  "UK",  17,  true, 42);

listeAnnexe.add(J1) ;
listeAnnexe.add(J2) ;
listeAnnexe.add(J3) ;
listeAnnexe.add(J4) ;
%>

<h1>Liste des joueurs</h1>

<ul>
	<%
	
	for (Player joueur:listeAnnexe) {
		int ID = joueur.getId();
		String Prenom = joueur.getFirst_name();
		String Nom = joueur.getLast_name();
		String Pays = joueur.getCountry();
		int Age = joueur.getAge();
		int classement = joueur.getWorld_rank();
	%>
<li>

<button type="button" class="collapsible"><%=Prenom%> <%=Nom %> (<%=ID%>)</button>
<div class="content">
  <p>Pays : <%=Pays%></p>
  <p>Age : <%=Age%></p>
  <p>Classement mondial : <%=classement%></p>
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