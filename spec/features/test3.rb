require 'spec_helper'

feature "As a kolbi user, I'm able ", :js => true do

  given(:user_bot) { Bot::User.new }
  given(:criteria) { 'Samsung' }

  background(:each) do
    Capybara.current_driver = :selenium_firefox
  end

  after(:each) do
    Capybara.use_default_driver
  end

  scenario "to see the errors in the registration process" do
    home_page = PageObjects::HomePage.new(user_bot)
    home_page.open
    busqueda_page = home_page.buscar(criteria)
    results_txt = busqueda_page.results_txt
    results = busqueda_page.results
    expect(results_txt).to have_content("results found in for #{criteria}"), "No search performed"
    expect(results).not_to be_zero, "The result are 0"
  end
end
