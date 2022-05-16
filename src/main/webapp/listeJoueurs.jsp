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
<%-- TODO : crï¿½er une listeJoueurs dans le doProcess du servlet --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Liste des Joueurs</title>


</head>
<jsp:include page="./navbar.jsp"></jsp:include>



<body>
<%-- Script --%>

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
  <p>Catï¿½gorie : <%=categ%></p>
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