source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'letter_opener'
  gem 'quiet_assets'
  gem 'sqlite3'
  gem 'annotate'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
end

# For pagination
gem 'dm-aggregates'
gem 'kaminari'

gem 'beerxml', github: 'codekitchen/beerxml', ref: '9a6d514085d64b7077ea0e840ffdc3c52d27923c'

gem "chartkick"

# For cool select menus
gem "chosen-rails"

gem "ejs"

# For secret API keys
gem "figaro"

# For search
gem "fuzzily"



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

require 'open-uri'

# For user login and session management
gem 'devise'

gem 'jquery-rails'
gem 'jquery-ui-rails'

# For picture uploads
gem 'paperclip'
gem 'aws-sdk'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
