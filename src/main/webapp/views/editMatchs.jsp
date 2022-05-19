<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Arrays,java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="org.tutorial.Player" %>
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
var listeMatchsJS = new Array();


function modifierLog(i){
	console.log("Bouton Modifier was clicked : "+listeMatchsJS[i]+" ("+i+").");
	
	// prend les valeurs de la liste, dans la bonne ligne et prend la valeur
	var ajoutSet = document.getElementsByClassName("ModifForm"+i);
	
	ID = ajoutSet[0].value;
	J1 = ajoutSet[1].value;
	J2 = ajoutSet[2].value;
	date = ajoutSet[3].value;
	heure = ajoutSet[4].value;
	statut = ajoutSet[5].value;
	score = ajoutSet[6].value;
	court = ajoutSet[7].value;
	
	console.log("Nouveau match : " + ID+", "+J1+", "+J2+", "+ date+", "+heure+", "+statut+", "+score+", "+court);
}
	

function supprimerLog(i){
	console.log("Bouton Supprimer was clicked : "+i+".")
}

</script>

<body>
<%-- Script --%>

<%

ArrayList<Match> listeAnnexe = new ArrayList<Match>();

Connection c = DBManager.getInstance().getConnection();
try (Statement statement = c.createStatement()) {
  ResultSet rs = statement.executeQuery("SELECT * FROM info_team03_schema.matches;");
    while (rs.next()) {
    	int id = rs.getInt("id");
        String joueur1 = rs.getString("joueur1");
        String joueur2 = rs.getString("joueur2");
        int court = rs.getInt("court");
        Date jour = rs.getDate("jour");
        String heureDébut = rs.getString("heureDébut");
        String heureFin = rs.getString("heureFin");
        String score = rs.getString("score");
        String statut = rs.getString("statut");
        Match M = new Match(id, joueur1, joueur2, jour, "/", heureDébut, court, score, statut);
        listeAnnexe.add(M);
        System.out.println(heureDébut);
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

<h1>Liste des matchs</h1>

<ul>
	<%
	int it = -1;
	for (Match match:listeAnnexe) {
		it++;
		int ID = match.getId();
		String Joueur1 = match.getNom_joueur1();
		String Joueur2 = match.getNom_joueur2();
		Date date = match.getDate();
		String heurematch = match.getHeure();
		String statut = match.getStatus();
		String score = match.getScore();
		int court = match.getCourt();
	%>
	
	<script>
//On passe la liste Java en JS
var tmpMatch = new Array(7);
tmpMatch[0]='<%=ID%>';
tmpMatch[1]='<%=Joueur1%>';
tmpMatch[2]='<%=Joueur2%>';
tmpMatch[3]='<%=date%>';
tmpMatch[4]='<%=heurematch%>';
tmpMatch[5]='<%=statut%>';
tmpMatch[6]='<%=score%>';
tmpMatch[7]='<%=court%>';

listeMatchsJS.push(tmpMatch);

</script>
<li>

<button type="button" class="collapsible"><%=Joueur1%> - <%=Joueur2 %></button>
<div class="content">
 <p><input class="ModifForm<%=it%>" name="id" value='<%=ID%>'> - ID</input></p>
 <p><input class="ModifForm<%=it%>" name="J1" value='<%=Joueur1%>'> - Joueur 1</input></p>
 <p><input class="ModifForm<%=it%>" name="J2" value='<%=Joueur2%>'> - Joueur 2</input></p>
 <p><input type="date" class="ModifForm<%=it%>" name="date" value='<%=date%>'> - Date</input></p>
 <p><input type="time" class="ModifForm<%=it%>" name="date" value='<%=heurematch%>'> - Heure</input></p>
 <p><select class="ModifForm<%=it%>" name="Categ">
 	<option selected="<%=statut%>"><%=statut%></option>
 	<option value="N/A">N/A</option>
    <option value="Prévu">Prévu</option>
    <option value="En cours">En cours</option>
    <option value="Annulé">Annulé</option>
     <option value="Terminé">Terminé</option>
 </select> - Statut</p>
 <p><input class="ModifForm<%=it%>" name="Classement" value='<%=score%>'> - Score </input></p>
 <p><input type="number" min="0" step="1" class="ModifForm<%=it%>" name="court" value='<%=court%>'> - Court</input></p>

  <button id="mod_<%=it%>" class="Modifier">Confirmer modification</button>
  <script>
  var mods = document.getElementById("mod_<%=it%>");
  mods.addEventListener("click", function() {
  		modifierLog(<%=it%>);
    });
  </script>     
</div>

  <button id="sup_<%=it%>" class="Supprimer">Supprimer</button>

</li>
<%} %>
</ul>

<h2>Ajouter un nouveau match :</h2>
 <p><input class="ModifFormAjout" name="id" value=''> - ID</input></p>
 <p><input class="ModifFormAjout" name="J1" value=''> - Joueur 1</input></p>
 <p><input class="ModifFormAjout" name="J2" value=''> - Joueur 2</input></p>
 <p><input type="date" class="ModifFormAjout" name="date" value=''> - Date</input></p>
 <p><input type="time" class="ModifFormAjout" name="date" value=''> - Heure</input></p>
 <p><select class="ModifFormAjout" name="Categ">
 	<option value="N/A">N/A</option>
    <option value="Prévu">Prévu</option>
    <option value="En cours">En cours</option>
    <option value="Annulé">Annulé</option>
     <option value="Terminé">Terminé</option>
 </select> - Statut</p>
 <p><input class="ModifFormAjout" name="Classement" value=''> - Score </input></p>
 <p><input type="number" min="0" step="1" class="ModifFormAjout" name="court" value=''> - Court</input></p>
<button id="newMatch">Confirmer le nouveau match</button>

<script>

ajouterBouton = document.getElementById("newMatch");
ajouterBouton.addEventListener("click", function() {
	var ajoutSet = document.getElementsByClassName("ModifFormAjout");
	
	ID = ajoutSet[0].value;
	J1 = ajoutSet[1].value;
	J2 = ajoutSet[2].value;
	date = ajoutSet[3].value;
	heure = ajoutSet[4].value;
	statut = ajoutSet[5].value;
	score = ajoutSet[6].value;
	court = ajoutSet[7].value;
	
	if( ID!="" & J1!="" & J2!="" & date!="" & heure!="" & statut!="" & score!="" & court!=""){
		console.log("Nouveau match :" + ID+", "+J1+", "+J2+", "+ date+", "+heure+", "+statut+", "+score+ ", court :"+court+".");

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