# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets folder are already added.

# Add Yarn node_modules folder to the asset load path for packages like Materialize or other frontend libraries.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile specific assets, including legacy files
Rails.application.config.assets.precompile += %w[application.js application.css legacy.js legacy.css]

# Ensure Sprockets also processes the assets in the builds folder created by esbuild.
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'builds')
