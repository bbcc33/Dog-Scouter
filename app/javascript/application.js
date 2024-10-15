// // Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "controllers"
// import Rails from "@rails/ujs";
// Rails.start();


// // these below are sprockets not commented out code 

// //= require jquery
// //= require jquery_ujs
// //= require materialize
// //= require template_script // Add the JavaScript from your template
// //= require rails-ujs
// //= require turbolinks
// //= require_tree.


// // For Rails 6+ (Webpacker)
// document.addEventListener('DOMContentLoaded', function() {
//   var dropdownTriggers = document.querySelectorAll('.dropdown-trigger');
//   M.Dropdown.init(dropdownTriggers, {
//     coverTrigger: false
//   });

//   // Listen for click events on dropdown items
//   document.querySelectorAll('#city-dropdown a').forEach(function(anchor) {
//     anchor.addEventListener('click', function(event) {
//       // Get selected city's ID and name
//       var cityId = event.target.getAttribute('data-value');
//       var cityName = event.target.textContent;

//       // Set the hidden field's value to the selected city's ID
//       document.getElementById('selected_city_id').value = cityId;

//       // Optionally, you can update the button text to show the selected city
//       document.querySelector('.dropdown-trigger').textContent = cityName;
//     });
//   });
// });

  
// Import the necessary Materialize CSS and JS
import 'materialize-css/dist/css/materialize.min.css'; // Import Materialize CSS
import { M } from 'materialize-css';  // Import Materialize JS

// Initialize Materialize dropdown on page load
document.addEventListener('DOMContentLoaded', function() {
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
