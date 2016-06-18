require 'spec_helper'

feature "As a sutel user, I'm able ", :js => true do

  background(:each) do
    Capybara.current_driver = :selenium_safari
  end

  after(:each) do
    Capybara.use_default_driver
  end

  given(:user_bot) { Bot::User.new }

  scenario "to visit Avisos" do
    home_page = PageObjects::HomePage.new(user_bot)
    home_page.open
    avisos_page = home_page.list_avisos
    aviso_title = avisos_page.open(0)
    expect(title).to have_content(aviso_title), "The title of the aviso found was #{title} but " \
      "#{aviso_title} was expected"
  end
end
