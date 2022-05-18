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


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Statistiques</title>
</head>
<body>

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

	<h1>Bienvenue sur la page des statistiques</h1>
	
	<table id="SQLsortMe" class="table">
		<thead>
    		<tr>
      			<th>Name</th>
      			<th data-type="string">Categorie</th>
      			<th data-type="number">Age</th>
      			<th data-type="number">Classement</th>
      			<th data-type="string">main</th>
    		</tr>
  		</thead>
    
  <tbody>
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



  	<tr>
  		<td><%=Nom%></td>
        <td><%=categ%></td>
        <td><%=Age%></td>
        <td><%=classement%></td>
        <td><%=main%></td>
   </tr>
   <%} %>
   </tbody>
</table>
</body>
</html>

<script>
	
	alert("Ça marche");

	function onPageReady()
	{
		// Query the table
		const table = document.getElementById('SQLsortMe');

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