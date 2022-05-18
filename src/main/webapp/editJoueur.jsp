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

<script>
function createListItem(joueur){
	// Un élement de la liste : bouton dépliable, contenu
	let partie = document.createElement("li");
	
	// Retrieving joueur's values
	let Prenom = joueur.getFirst_name();
	let Nom = joueur.getLast_name();
	let Pays = joueur.getCountry();
	let Age = joueur.getAge();
	let classement = joueur.getWorld_rank();
	let main = joueur.getMain_hand();
	let categ = joueur.getCategory();
	
	// Collapsible
	let collapsible = document.createElement("button");
	collapsible.setAttribute("type","button");
	collapsible.setAttribute("class","collapsible");
	let contenuPrincipal = `${Prenom} ${Nom} (${Pays})`;
	partie.appendChild(collapsible);
	
	// Contenu du collapsible
	let content = document.createElement("div");
	content.setAttribute("class","content");

	// Joueur's values list
	let p_categ = document.createElement("p");
	let p_categ_word = `Catégorie : ${categ}`;
	p_categ.innerText = p_categ_word;
	content.appendChild(p_categ);
	
	// Adding a DELETE Button
	let delBtn = document.createElement("button");
	delBtn.innerHTML = "Supprimer";
	partie.appendChild(delBtn);
	
	// Adding a CHANGE Button
	let patchBtn = document.createElement("button");
	patchBtn.innerHTML = "Modifier";
	partie.appendChild(patchBtn);
	
	return liste;
}

function modifierLog(i){
	console.log("Bouton Modifier was clicked : "+i+".")
}

function supprimerLog(i){
	console.log("Bouton Supprimer was clicked : "+i+".")
}
</script>

<body>
<%-- Script --%>

<%

ArrayList<Player> listeAnnexe = new ArrayList<Player>();
Player J1 = new Player("Mark", "Hamil",  "Droitier",  "UK",  69,  "Féminin", 10);
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
	int iterateur = 0;
	for (Player joueur:listeAnnexe) {
		iterateur += 1;
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

  <p>Catégorie : <%=categ%></p>
  <p>Age : <%=Age%></p>
  <p>Classement mondial : <%=classement%></p>
  <p>Main : <%=main%></p>
  
</div>

  <button type="button" id="mod_button" class="Modifier">Modifier</button>
  <button type="button" id="del_button" class="Supprimer">Supprimer</button>




</li>
<% } %>
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

// Ajout des eventListeners des boutons "modifier"
var mod_list = document.getElementsByClassName("Modifier");
var i2;
for (i2 = 0; i2 < mod_list.length; i2++) {
	mod_list[i2].addEventListener("click", modifierLog(i2));
}

//Ajout des eventListeners des boutons "supprimer"
var mod_list = document.getElementsByClassName("Supprimer");
var i3;
for (i3 = 0; i3 < mod_list.length; i3++) {
	mod_list[i3].addEventListener("click", modifierLog(i3));
}

</script>
</body>
<jsp:include page="./footer.jsp"></jsp:include>
</html>