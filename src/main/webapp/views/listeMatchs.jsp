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
  <p>Numéro du match : <%=ID%></p>
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