source 'https://rubygems.org'

gem 'rails', '~> 3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'
  gem 'jquery-rails'
  gem 'jquery-ui-rails'

  gem 'uglifier', '>= 1.0.3'
end

gem 'haml-rails'

gem 'stripe'

gem 'airbrake'
gem 'newrelic_rpm'

gem 'rvm-capistrano'


group :development, :test do
  gem 'ruby_parser'
  gem 'hpricot'
  gem 'taps'
  gem 'sqlite3'
  gem 'guard'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'ruby_gntp'
  gem 'rspec-rails', '>= 2.8.1'
end

group :test do
  gem "factory_girl_rails", ">= 1.6.0"
  gem "cucumber-rails", ">= 1.2.1", require: false
  gem "capybara", ">= 1.1.2"
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "launchy"
end

group :production do
  gem 'pg'
  gem 'thin'
end

gem 'ruby-prof'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
