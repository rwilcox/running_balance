source 'http://rubygems.org'

gem 'rails', '3.1.0.rc5'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'haml'
gem 'jquery-rails'
gem "devise"
gem "omniauth"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :test, :development do
  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "jasmine"
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'rspec-rails'
  gem 'shoulda-matchers'

  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'formtastic'
  gem 'pathy'
#  gem 'jasmine-headless-webkit'  # requires QT 4.7, but we only easily have 4.6 on Ubuntu. WD-rpw 08-11-2011
  gem 'rack-jsonp-middleware'
end

group :development, :test do
  gem 'therubyracer'
end

# group :production do
#   gem 'therubyracer-heroku'
# end