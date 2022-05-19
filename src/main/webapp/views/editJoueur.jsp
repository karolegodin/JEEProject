<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Arrays,java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="org.tutorial.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
    
<% ArrayList<Player> listeJoueurs = (ArrayList<Player>)request.getAttribute("listeJoueurs"); %>
<%-- TODO : créer une listeJoueurs dans le doProcess du servlet --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Liste des Joueurs</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/rolandgarros.css">

</style>
</head>
<jsp:include page="./navbar.jsp"></jsp:include>

<script>
<%-- Script --%>

var listeJoueursJS = new Array();

<%

ArrayList<Player> listeAnnexe = new ArrayList<Player>();

Connection c = DBManager.getInstance().getConnection();
try (Statement statement = c.createStatement()) {
  ResultSet rs = statement.executeQuery("SELECT * FROM info_team03_schema.joueurs ORDER BY catégorie DESC, classementMondial ASC;");
    while (rs.next()) {
    	String prénom = rs.getString("prénom");
        String nom = rs.getString("nom");
        String pays = rs.getString("pays");
        String catégorie = rs.getString("catégorie");
        int classementMondial = rs.getInt("classementMondial");
        String main = rs.getString("main");
        int age = rs.getInt("age");
        Player P = new Player(prénom, nom, catégorie, pays, classementMondial, main, age);
        listeAnnexe.add(P);
    }
} catch (SQLException e) {
	e.printStackTrace();
} finally {
    if (c != null) {
        try {
            c.close();
        } catch (SQLException e) {}
    }
}

%>


function modifierLog(i){
	console.log("Bouton Modifier was clicked : "+listeJoueursJS[i]+" ("+i+").");
	
	// prend les valeurs de la liste, dans la bonne ligne et prend la valeur
	prenom = document.getElementsByClassName("ModifForm"+i)[0].value;
	nom = document.getElementsByClassName("ModifForm"+i)[1].value;
	pays = document.getElementsByClassName("ModifForm"+i)[2].value;
	age = document.getElementsByClassName("ModifForm"+i)[3].value;
	categ = document.getElementsByClassName("ModifForm"+i)[4].value;
	classement = document.getElementsByClassName("ModifForm"+i)[5].value;
	main = document.getElementsByClassName("ModifForm"+i)[6].value;
	
	console.log("Nouvelle personne : " + prenom+", "+nom+", "+pays+", "+ age+", "+categ+", "+classement+", "+main);
}
	

function supprimerLog(i){
	console.log("Bouton Supprimer was clicked : "+i+".")
}


</script>

<body>


<h1>Liste des joueurs</h1>
Laisser un blanc laisse l'information inchangée.

<ul>
	<%
	int it = -1;
	
	for (Player joueur:listeAnnexe) {
		it++;
		String Prenom = joueur.getFirst_name();
		String Nom = joueur.getLast_name();
		String Pays = joueur.getCountry();
		int Age = joueur.getAge();
		int classement = joueur.getWorld_rank();
		String main = joueur.getMain_hand();
		String categ = joueur.getCategory();
	%>

<script>
//On passe la liste Java en JS
var tmpJoueur = new Array(7);
tmpJoueur[0]='<%=Prenom%>';
tmpJoueur[1]='<%=Nom%>';
tmpJoueur[2]='<%=Pays%>';
tmpJoueur[3]='<%=categ%>';
tmpJoueur[4]='<%=Age%>';
tmpJoueur[5]='<%=classement%>';
tmpJoueur[6]='<%=main%>';

listeJoueursJS.push(tmpJoueur);
</script>
	
<li class="edit">
<div>
<button type="button" id="<%=it%>" class="collapsible"><%=Prenom%> <%=Nom %> (<%=Pays%>)</button>
<div class="content">

 <p><input class="ModifForm<%=it%>" name="Prenom" value='<%=Prenom%>'> - Prenom</input></p>
 <p><input class="ModifForm<%=it%>" name="Nom" value='<%=Nom %>'> - Nom</input></p>
 <p><input class="ModifForm<%=it%>" name="Pays" value='<%=Pays%>'> - Pays</input></p>
 <p><input type="number" min="0" step="1" class="ModifForm<%=it%>" name="Age" value='<%=Age%>'> - Age</input></p>
 <p><select class="ModifFormA<%=it%>" name="Categ">
 	<option selected="<%=categ%>"><%=categ%></option>
 	<option value="N/A">N/A</option>
    <option value="Femme">Femme</option>
    <option value="Homme">Homme</option>
 </select> - Catégorie</p>
 <p><input type="number" min="0" step="1" class="ModifForm<%=it%>" name="Classement" value='<%=classement%>'> - Classement mondial</input></p>
  <p><select class="ModifForm<%=it%>" name="Main" value='<%=main%>'>
  	<option selected="<%=main%>"><%=main%></option>
 	<option value="N/A">N/A</option>
    <option value="Droitier">Droitier</option>
    <option value="Gaucher">Gaucher</option>
 </select> - Main</p>

  <button id="mod_<%=it%>" class="Modifier btn btn-primary btn-sm">Confirmer modification</button>
  <script>
  var mods = document.getElementById("mod_<%=it%>");
  mods.addEventListener("click", function() {
  		modifierLog(<%=it%>);
    });
  </script>
  
 </div> 
 </div>
  <button id="sup_<%=it%>" class="Supprimer btn btn-primary btn-sm">Supprimer</button>

</li>
<% } %>

<script>
console.log(listeJoueursJS);
</script>
</ul>

<h2>Ajouter un nouveau joueur :</h2>
 <p><input class="ModifFormAjout" name="Prenom" value=''> - Prenom</input></p>
 <p><input class="ModifFormAjout" name="Nom" value=''> - Nom</input></p>
 <p><input class="ModifFormAjout" name="Pays" value=''> - Pays</input></p>
 <p><input type="number" min="0" step="1" class="ModifFormAjout" name="Age" value=''> - Age</input></p>
 <p><select class="ModifFormAjout" name="Categ">
 	<option value="N/A">N/A</option>
    <option value="Femme">Femme</option>
    <option value="Homme">Homme</option>
 </select> - Catégorie</p>
 <p><input type="number" min="0" step="1" class="ModifFormAjout" name="Classement" value=''> - Classement mondial</input></p>
  <p><select class="ModifFormAjout" name="Main">
 	<option value="N/A">N/A</option>
    <option value="Droitier">Droitier</option>
    <option value="Gaucher">Gaucher</option>
 </select> - Main</p>
<button id="newPlayer" class="btn btn-primary btn-sm">Confirmer le nouveau joueur</button>


<script>

ajouterBouton = document.getElementById("newPlayer");
ajouterBouton.addEventListener("click", function() {
	var ajoutSet = document.getElementsByClassName("ModifFormAjout");
	
	prenom = ajoutSet[0].value;
	nom = ajoutSet[1].value;
	pays = ajoutSet[2].value;
	age = ajoutSet[3].value;
	categ = ajoutSet[4].value;
	classement = ajoutSet[5].value;
	main = ajoutSet[6].value;
	
	if( prenom!="" & nom!="" & pays!="" & age!="" & categ!="" & classement!="" & main!=""){
		console.log("Nouveau joueur :" + prenom+", "+nom+", "+pays+", "+ age+", "+categ+", "+classement+", "+main);

		<%--
	try (Statement statement = c.createStatement()) {
  ResultSet rs = statement.executeQuery(" @PLS fonction qui crée un nouveau joueur ");
} catch (SQLException e) {
	e.printStackTrace();
} finally {
    if (c != null) {
        try {
            c.close();
        } catch (SQLException e) {}
    }
}
--%>
	}else{
		console.log("/!\\ Attention : au moins un champ a été laissé vide.")
	}
	
});


<%-- Script de la liste extensible--%>
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