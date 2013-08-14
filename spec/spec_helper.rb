# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

def sign_up(username)
  visit new_user_registration_url
  fill_in "user_username", with: username
  fill_in "user_email", with: "#{username}@example.com"
  fill_in "user_password", with: "password"
  fill_in "user_password_confirmation", with: "password"
  click_button "Sign up"
end

def sign_up_as_tester
  sign_up("tester")
end

def sign_out
  click_button "Sign Out"
end

def upload_recipe
  visit new_recipe_url
  fill_in "recipe_name", with: "test_recipe"
  fill_in "xml_url", with: "http://www.brewtoad.com/recipes/good-brewer-ish-hefeweizen.xml"
  click_button "Upload Recipe"
end

def brew_recipe
  click_link "Brew Me!"
  click_button "Let's Get Started"
end