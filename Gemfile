source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.3'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end
# convert html to halm
gem "haml-rails", "~> 2.0"
#bootstrap gems
gem 'bootstrap', '~> 4.4.1'
gem 'jquery-rails'
#gema para obtener iconos y diseños
gem 'font-awesome-sass', '~> 5.13.0'
gem 'simple_form'
#se agrega gema para obtener data default en la DB
gem 'faker'
#se agrega gema de autenticacion por correo
gem 'devise'
#se agrega gema para mejorar los ids de las url a stings
gem 'friendly_id', '~> 5.2.4'
#se agrega gema para hacer consultas en la BD con formularios https://github.com/activerecord-hackery/ransack
gem 'ransack'
#se agrega gema para tener traza de actividades por usuarios
gem 'public_activity'
#se agrega gema para crear roles en la aplicacion
gem 'rolify'
#se agrega gema para conceder accesos y politicas de permisos
gem "pundit"
#se agrega gema para notificacion de errores por correo
gem 'exception_notification'
#se agrega gema para paginacion
gem 'pagy'
#se agrega gema mailgun-ruby para envio de correos
gem 'mailgun_rails'