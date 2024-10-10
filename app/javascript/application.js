// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs";
Rails.start();


// these below are sprockets not commented out code 

//= require jquery
//= require jquery_ujs
//= require materialize
//= require template_script // Add the JavaScript from your template


document.addEventListener('DOMContentLoaded', function() {
    // Initialize Materialize Dropdown
    var elems = document.querySelectorAll('.dropdown-trigger');
    var instances = M.Dropdown.init(elems);
  
    // Dropdown click event listener
    document.querySelectorAll('#city-dropdown li a').forEach(function(element) {
      element.addEventListener('click', function() {
        // Get the selected city's ID
        var cityId = this.getAttribute('data-value');
        // Set the hidden input's value to the selected city ID
        document.getElementById('selected_city_id').value = cityId;
      });
    });
  });
  
  