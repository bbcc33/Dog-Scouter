# config/importmap.rb
pin 'application', preload: true # This ensures application.js is preloaded
pin '@rails/ujs', to: 'rails-ujs.js' # Maps @rails/ujs to rails-ujs.js file
pin 'materialize', to: 'https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js'
