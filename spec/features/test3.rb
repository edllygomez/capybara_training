require 'spec_helper'

feature "As a sutel user, I'm able ", :js => true do

  background(:each) do
    Capybara.current_driver = :selenium_firefox
    page.driver.browser.manage.window.resize_to(1420, 1440)
  end

  after(:each) do
    Capybara.use_default_driver
  end

  given(:user_bot) { Bot::User.new }
  given(:expected_title) { 'Inicio - ARESEP' }

  scenario "to visit ARESEP page" do
    home_page = PageObjects::HomePage.new(user_bot)
    home_page.open
    home_page.visit_aresep
    expect(title).to eq(expected_title),
     "The title expected was #{expected_title} but #{title} was found"
  end
end
