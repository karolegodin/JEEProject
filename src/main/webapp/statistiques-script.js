function onPageReady() {
  // Documentation: http://tristen.ca/tablesort/demo/
  new Tablesort(document.getElementById('table-stats'));
}

// Run the above function when the page is loaded & ready
document.addEventListener('DOMContentLoaded', onPageReady, false);

alert('You successfully linked your JavaScript file!');