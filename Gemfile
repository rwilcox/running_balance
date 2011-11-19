source 'http://rubygems.org'

gem 'rails', '~> 3.1.0'
gem 'pg'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'haml'
gem 'coffee-filter' #what's all this? <http://aledalgrande.posterous.com/52292198> - :coffeescript in your HAML!!! WD-rpw 08-11-2011
# JavasScript libs
gem 'jquery-rails'
gem 'modernizr-rails'
gem "devise"
gem "omniauth", ">= 0.2.6"
gem 'oa-openid', :require => 'omniauth/openid'
#gem "simple_eav"
gem 'formtastic', "~> 2.0.0.rc3"
gem 'show_for'
gem 'rabl'
gem 'rack-jsonp-middleware'
gem 'csv_builder'
gem 'mongrel', '1.2.0.pre2'
gem "delegate_presenter"

# Heroku deployment requirements
# group :production do
#   gem 'therubyracer-heroku'
#   gem 'pg'
# end


group :test, :development do
  # To use debugger
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'rspec-rails'
  gem "jasmine"
  gem 'mongrel', '1.2.0.pre2'
  gem 'therubyracer'
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'shoulda-matchers'
  gem "machinist", '>= 2.0.0.beta2'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'pathy'
#  gem 'jasmine-headless-webkit'  # requires QT 4.7, but we only easily have 4.6 on Ubuntu. WD-rpw 08-11-2011
  gem 'sham'
  gem 'faker'
  gem 'spork'
end
