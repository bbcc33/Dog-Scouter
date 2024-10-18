import Rails from "@rails/ujs";
Rails.start();
import 'materialize-css/dist/css/materialize.min.css'; // Import Materialize CSS
import 'materialize-css/dist/js/materialize.min.js';   // Import Materialize JS
document.addEventListener('DOMContentLoaded', function() {
  // Initialize Materialbox (if you need it)
  var elems = document.querySelectorAll('.materialboxed');
  M.Materialbox.init(elems);


  var elems = document.querySelectorAll('.parallax');
  var instances = M.Parallax.init(elems);

  // Initialize Materialize dropdown (if still using dropdown elsewhere in the app)
  var dropdownTriggers = document.querySelectorAll('.dropdown-trigger');
  M.Dropdown.init(dropdownTriggers, {
    coverTrigger: false
  });

  // Handle the city dropdown selection
  const citySelect = document.querySelector('#dog_sighting_city_id'); // This is the select element
  const cityNameDisplay = document.getElementById('city-name-display');
  
  // Display selected city on page load if a city is selected
  if (citySelect.value) {
    const selectedCityName = citySelect.options[citySelect.selectedIndex].text;
    cityNameDisplay.innerText = selectedCityName;
  }

  // Update the display when the user selects a city
  citySelect.addEventListener('change', function() {
    const selectedCityName = citySelect.options[citySelect.selectedIndex].text;
    cityNameDisplay.innerText = selectedCityName;

    // Optionally submit the form to filter results immediately (if needed)
    document.querySelector('.city-filter-form').submit();
  });
});