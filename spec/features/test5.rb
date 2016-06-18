require 'spec_helper'

feature "As a sutel user, I'm able ", :js => true do

  background(:each) do
    Capybara.current_driver = :selenium_safari
  end

  after(:each) do
    Capybara.use_default_driver
  end

  given(:user_bot) { Bot::User.new }
  given(:expected_url) { "https://www.facebook.com/SUTEL.CR" }

  scenario "to visit the Facebook Profile" do
    home_page = PageObjects::HomePage.new(user_bot)
    home_page.open
    url = home_page.list_facebook
    expect(url).to eq(expected_url), "The url found was #{url}"
  end
end
