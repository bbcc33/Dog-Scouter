import Rails from "@rails/ujs";
Rails.start();
import 'materialize-css/dist/css/materialize.min.css'; // Import Materialize CSS
import 'materialize-css/dist/js/materialize.min.js';   // Import Materialize JS
document.addEventListener('DOMContentLoaded', function() {

  var elems = document.querySelectorAll('.materialboxed');
  M.Materialbox.init(elems);


  var elems = document.querySelectorAll('.parallax');
  var instances = M.Parallax.init(elems);

  var dropdownTriggers = document.querySelectorAll('.dropdown-trigger');
  M.Dropdown.init(dropdownTriggers, {
    coverTrigger: false
  });

  const citySelect = document.querySelector('#dog_sighting_city_id');
  const cityNameDisplay = document.getElementById('city-name-display');
  
  if (citySelect.value) {
    const selectedCityName = citySelect.options[citySelect.selectedIndex].text;
    cityNameDisplay.innerText = selectedCityName;
  }

  citySelect.addEventListener('change', function() {
    const selectedCityName = citySelect.options[citySelect.selectedIndex].text;
    cityNameDisplay.innerText = selectedCityName;

    document.querySelector('.city-filter-form').submit();
  });
});