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
<%@ page import="java.sql.PreparedStatement" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Statistiques</title>
</head>
<jsp:include page="./navbar.jsp"></jsp:include>
<body>

<%

ArrayList<Player> listeAnnexe = new ArrayList<Player>();
ArrayList<Player> listeFemmes = new ArrayList<Player>();
ArrayList<Player> listeHommes = new ArrayList<Player>();


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
        P.setNbMatchesRemportes(-1);
        P.setDureeJeu(-1);
        P.setNbSetsPerdus(-1);
        P.setNbJeuxGagnes(-1);
        listeAnnexe.add(P);
        if(catégorie.equals("Homme"))
        {listeHommes.add(P);}
        else
        {listeFemmes.add(P);}
        //System.out.println();
        //System.out.println(catégorie + " = Homme : " + catégorie.equals("Homme"));
    }
  	
  	String action;
  	for (Player joueur:listeAnnexe) {
  		// -Calcul Temps de Jeu-
  		int tempsDeJeu = 0;
  		action = "SELECT * FROM info_team03_schema.matches WHERE joueur1 = '"+joueur.getLast_name()+"' OR joueur2 = '"+joueur.getLast_name()+"';";
  		rs = statement.executeQuery(action);
  		while (rs.next()) {
  			tempsDeJeu += rs.getInt("tdj");
  		}
  		joueur.setDureeJeu(tempsDeJeu);
  		
  		// -Calcul Nombre de Matches Remportés-
  		int nbMatchesRemportes = 0;
  		action = "SELECT * FROM info_team03_schema.matches WHERE gagnant = '"+joueur.getLast_name()+"';";
  		rs = statement.executeQuery(action);
  		while (rs.next()) {
  			nbMatchesRemportes += 1;
  		}
  		joueur.setNbMatchesRemportes(nbMatchesRemportes);
  		
  		// -Calcul Nombre de Jeux Gagnés, de Sets Perdus-
  		int nbJeuxGagnes = 0;
  		int nbSetsPerdus = 0;
  		int j11, j12, j21, j22, j31, j32;
  		String score;
  		// Le joueur est le joueur1
  		action = "SELECT * FROM info_team03_schema.matches WHERE joueur1 = '"+joueur.getLast_name()+"';";
  		rs = statement.executeQuery(action);
  		while (rs.next()) {
  			score = rs.getString("score");
  			j11 = Integer.parseInt(score.substring(0, 1));
  			j12 = Integer.parseInt(score.substring(2, 3));
  			j21 = Integer.parseInt(score.substring(4, 5));
  			j22 = Integer.parseInt(score.substring(6, 7));
  			j31 = Integer.parseInt(score.substring(8, 9));
  			j32 = Integer.parseInt(score.substring(10, 11));
  			// Jeux Gagnés
  			nbJeuxGagnes += j11;
  			nbJeuxGagnes += j21;
  			nbJeuxGagnes += j31;
  			// Sets Perdus
  			if(j11<j12){nbSetsPerdus += 1;}
  			if(j21<j22){nbSetsPerdus += 1;}
  			if(j31<j32){nbSetsPerdus += 1;}
  		}
  		// Le joueur est le joueur2
  		action = "SELECT * FROM info_team03_schema.matches WHERE joueur2 = '"+joueur.getLast_name()+"';";
  		rs = statement.executeQuery(action);
  		while (rs.next()) {
  			score = rs.getString("score");
  			j11 = Integer.parseInt(score.substring(0, 1));
  			j12 = Integer.parseInt(score.substring(2, 3));
  			j21 = Integer.parseInt(score.substring(4, 5));
  			j22 = Integer.parseInt(score.substring(6, 7));
  			j31 = Integer.parseInt(score.substring(8, 9));
  			j32 = Integer.parseInt(score.substring(10, 11));
  			// Jeux Gagnés
  			nbJeuxGagnes += j12;
  			nbJeuxGagnes += j22;
  			nbJeuxGagnes += j32;
  			// Sets Perdus
  			if(j11>j12){nbSetsPerdus += 1;}
  			if(j21>j22){nbSetsPerdus += 1;}
  			if(j31>j32){nbSetsPerdus += 1;}
  		}
  		joueur.setNbJeuxGagnes(nbJeuxGagnes);
  		joueur.setNbSetsPerdus(nbSetsPerdus);
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

	<h1>Bienvenue sur la page des statistiques</h1>
	<h2>Femmes</h2>
	
	<table id="SQLsortMeFemmes" class="table table-bordered table-striped table-hover">
		<thead>
    		<tr>
      			<th>Name</th>
      			<th data-type="string">Categorie</th>
      			<th data-type="number">Age</th>
      			<th data-type="number">Classement</th>
      			<th data-type="string">main</th>
      			<th data-type="number">Durée de jeu totale</th>
      			<th data-type="number">Nombre de Jeux Gagnés</th>
      			<th data-type="number">Nombre de Sets Perdus</th>
      			<th data-type="number">Nombres de Matches Remportés</th>
    		</tr>
  		</thead>
    
  <tbody>
	<%
	for (Player joueur:listeFemmes) {
		String Prenom = joueur.getFirst_name();
		String Nom = joueur.getLast_name();
		String Pays = joueur.getCountry();
		int Age = joueur.getAge();
		int classement = joueur.getWorld_rank();
		String main = joueur.getMain_hand();
		String categ = joueur.getCategory();
		int nbMatchesRemportes = joueur.getNbMatchesRemportes();
		int dureeDeJeuTotale = joueur.getDureeJeu();
		int nbJeuxGagnes = joueur.getNbJeuxGagnes();
		int nbSetsPerdus = joueur.getNbSetsPerdus();
	%>

  	<tr>
  		<td><%=Nom%></td>
        <td><%=categ%></td>
        <td><%=Age%></td>
        <td><%=classement%></td>
        <td><%=main%></td>
        <td><%=dureeDeJeuTotale%></td>
        <td><%=nbJeuxGagnes%></td>
        <td><%=nbSetsPerdus%></td>
        <td><%=nbMatchesRemportes%></td>
   </tr>
   <%} %>
   </tbody>
   
   
	
	<table id="SQLsortMeHommes" class="table table-bordered table-striped table-hover">
		<thead>
    		<tr>
      			<th>Name</th>
      			<th data-type="string">Categorie</th>
      			<th data-type="number">Age</th>
      			<th data-type="number">Classement</th>
      			<th data-type="string">main</th>
      			<th data-type="number">Durée de jeu totale</th>
      			<th data-type="number">Nombre de Jeux Gagnés</th>
      			<th data-type="number">Nombre de Sets Perdus</th>
      			<th data-type="number">Nombres de Matches Remportés</th>
    		</tr>
  		</thead>
    <h2>Hommes</h2>
  <tbody>
	<%
	for (Player joueur:listeHommes) {
		String Prenom = joueur.getFirst_name();
		String Nom = joueur.getLast_name();
		String Pays = joueur.getCountry();
		int Age = joueur.getAge();
		int classement = joueur.getWorld_rank();
		String main = joueur.getMain_hand();
		String categ = joueur.getCategory();
		int nbMatchesRemportes = joueur.getNbMatchesRemportes();
		int dureeDeJeuTotale = joueur.getDureeJeu();
		int nbJeuxGagnes = joueur.getNbJeuxGagnes();
		int nbSetsPerdus = joueur.getNbSetsPerdus();
	%>

  	<tr>
  		<td><%=Nom%></td>
        <td><%=categ%></td>
        <td><%=Age%></td>
        <td><%=classement%></td>
        <td><%=main%></td>
        <td><%=dureeDeJeuTotale%></td>
        <td><%=nbJeuxGagnes%></td>
        <td><%=nbSetsPerdus%></td>
        <td><%=nbMatchesRemportes%></td>
   </tr>
   <%} %>
   </tbody>
   
</body>
</html>

<script>
	
	//alert("ça marche");

	function onPageReady()
	{
		SortTable('SQLsortMeFemmes');
		SortTable('SQLsortMeHommes');
	}
	
	function SortTable(tableName)
	{
		// Query the table
		const table = document.getElementById(tableName);

		// Query the headers
		const headers = table.querySelectorAll('th');

		// Loop over the headers
		[].forEach.call(headers, function (header, index) {
		    header.addEventListener('click', function () {
		        // This function will sort the column
		        sortColumn(index);
		        //alert("click ok");
		    });
		});
		
		// Query all rows
		const tableBody = table.querySelector('tbody');
		const rows = tableBody.querySelectorAll('tr');

		const sortColumn = function (index) {
			// Get the current direction
		    const direction = directions[index] || 'asc';
			
		 	// A factor based on the direction
		    const multiplier = (direction === 'asc') ? 1 : -1;
		 		 	
		 	//alert(direction);
		 	//alert(multiplier);
		 	
		    // Clone the rows
		    const newRows = Array.from(rows);

		    // Sort rows by the content of cells
		    newRows.sort(function (rowA, rowB) {
		        // Get the content of cells
		        const cellA = rowA.querySelectorAll('td')[index].innerHTML;
		        const cellB = rowB.querySelectorAll('td')[index].innerHTML;

		     	// Transform the content of cells
		        const a = transform(index, cellA);
		        const b = transform(index, cellB);
		        
		        switch (true) {
		            case a > b:
		                return 1 * multiplier;
		            case a < b:
		                return -1 * multiplier;
		            case a === b:
		                return 0;
		        }
		    });
		    
			// Reverse the direction
			directions[index] = direction === 'asc' ? 'desc' : 'asc';

		    // Remove old rows
		    [].forEach.call(rows, function (row) {
		        tableBody.removeChild(row);
		    });

		    // Append new row
		    newRows.forEach(function (newRow) {
		        tableBody.appendChild(newRow);
		    });
		};
		
		// Transform the content of given cell in given column
		const transform = function (index, content) {
		    // Get the data type of column
		    const type = headers[index].getAttribute('data-type');
		    switch (type) {
		        case 'number':
		            return parseFloat(content);
		        case 'string':
		        default:
		            return content;
		    }
		};
		
		// Track sort directions
		const directions = Array.from(headers).map(function (header) {
		    return '';
		});
	}
	
	// Run the above function when the page is loaded & ready
	document.addEventListener('DOMContentLoaded', onPageReady, false);

	// Verifying linking worked
	//alert('You successfully linked your JavaScript file!');
</script>