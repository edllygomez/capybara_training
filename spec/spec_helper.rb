# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
#require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'capybara/rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :selenium_firefox do |app|
  Selenium::WebDriver::Firefox.driver_path = "/Users/egomez/Documents/Drivers/geckodriver"
  Capybara::Selenium::Driver.new(app, browser: :firefox, marionette: true)
end

Capybara.register_driver :selenium_safari do |app|
  Selenium::WebDriver::Safari.driver_path = "/Applications/Safari\ Technology\ Preview.app/Contents/MacOS/safaridriver"
  Capybara::Selenium::Driver.new(app, browser: :safari)
end

Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium
Capybara.run_server = false
Capybara.app_host = 'https://sutel.go.cr/'
Capybara.default_max_wait_time = 60


 RSpec.configure do |config|
  config.include Capybara::DSL, :type => :feature
  require 'rspec/expectations'
  config.include RSpec::Matchers

  config.after(:each) do
    Capybara.current_session.driver.quit
  end
 end
