<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>






<script>
	function onPageReady()
	{
		// Query the table
		const table = document.getElementById('sortMe');

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

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Statistiques</title>
</head>
<body>
	<h1>Bienvenue sur la page des statistiques</h1>
	<table id="sortMe" class="table">
  <thead>
    <tr>
      <th>Name</th>
      <th data-type="number">number of match played</th>
      <th data-type="number">total play time</th>
      <th data-type="number">number of games won</th>
      <th data-type="number">number of sets lost</th>
      <th data-type="number">number of matches won</th>
    </tr>
  </thead>
  
  <tbody>
  	<tr>
        <td>Marc</td>
        <td>31</td>
        <td>1218</td>
        <td>27</td>
        <td>98</td>
        <td>28</td>
   </tr>
   
   <tr>
        <td>Jean</td>
        <td>6</td>
        <td>1089</td>
        <td>5</td>
        <td>17</td>
        <td>4</td>
   </tr>
   
   <tr>
        <td>Luc</td>
        <td>48</td>
        <td>1425</td>
        <td>13</td>
        <td>23</td>
        <td>4</td>
   </tr>
   
   <tr>
        <td>Matthieu</td>
        <td>40</td>
        <td>910</td>
        <td>39</td>
        <td>137</td>
        <td>9</td>
   </tr>
   
   <tr>
        <td>Baptiste</td>
        <td>17</td>
        <td>1345</td>
        <td>10</td>
        <td>43</td>
        <td>13</td>
   </tr>
   
   <tr>
        <td>Pierre</td>
        <td>20</td>
        <td>1323</td>
        <td>6</td>
        <td>13</td>
        <td>13</td>
   </tr>
   
   <tr>
        <td>Simon</td>
        <td>28</td>
        <td>1190</td>
        <td>28</td>
        <td>86</td>
        <td>14</td>
   </tr>
   
   <tr>
        <td>Zébédé</td>
        <td>14</td>
        <td>1031</td>
        <td>14</td>
        <td>64</td>
        <td>14</td>
   </tr>
   
   <tr>
        <td>Marie</td>
        <td>13</td>
        <td>936</td>
        <td>2</td>
        <td>39</td>
        <td>11</td>
   </tr>
  </tbody>
</table>
</body>
</html>