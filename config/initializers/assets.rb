# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( bootstrap-theme.css ) + %w( bootstrap.css ) + %w( whhg.css ) + %w( main.css ) + %w( bootstrap.js ) + %w( jQueryv2.0.3.js ) + %w( map.js ) + %w( owl.carousel.js ) + %w( pxgradient-1.0.2.jquery.js )
