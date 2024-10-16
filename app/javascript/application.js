import Rails from "@rails/ujs";
Rails.start();
import 'materialize-css/dist/css/materialize.min.css'; // Import Materialize CSS
import { M } from 'materialize-css';  // Import Materialize JS

document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.materialboxed');
  M.Materialbox.init(elems);

// Initialize Materialize dropdown on page load
  var dropdownTriggers = document.querySelectorAll('.dropdown-trigger');
  M.Dropdown.init(dropdownTriggers, {
    coverTrigger: false
  });

  // Handle city dropdown selection
  document.querySelectorAll('#city-dropdown a').forEach(function(anchor) {
    anchor.addEventListener('click', function(event) {
      var cityId = event.target.getAttribute('data-value');
      var cityName = event.target.textContent;

      // Set the hidden field's value to the selected city's ID
      document.getElementById('selected_city_id').value = cityId;

      // Optionally, update the button text to reflect the selected city
      document.querySelector('.dropdown-trigger').textContent = cityName;
    });
  });
});

