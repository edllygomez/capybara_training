require 'spec_helper'

feature "As a sutel user, I'm able ", :js => true do

  background(:each) do
    Capybara.current_driver = :selenium_firefox
  end

  after(:each) do
    Capybara.use_default_driver
  end

  given(:user_bot) { Bot::User.new }
  given(:search_criteria) { 'Registrar Prepago' }
  given(:link_text) { 'Usuarios prepago protegerán sus datos en nueva plataforma web' }
  given(:link_register) { 'https://registroprepago.sutel.go.cr' }
  given(:error_message) { 'Debe seleccionar un día para la fecha de vencimiento' }
  given(:register_page) { PageObjects::RegisterPrepaidPage.new(user_bot) }
  given(:form_data) do
    {
      prepaid_number: "88888888",
      id: "501110111",
      email: "test@test.com",
      code: "911",
    }
  end

  scenario "to register prepaid phone" do
    home_page = PageObjects::HomePage.new(user_bot)
    home_page.open
    search_page = home_page.search(search_criteria)
    search_page.open_link(link_text)
    search_page.open_link(link_register)
    register_page.list_form
    register_page.select_costarricense
    register_page.fill_out_costarricense_form(form_data)
    register_page.submit
     expect(register_page.error_message).to eq(error_message),
      "The message expected was #{error_message} but #{register_page.error_message} was found"
  end
end
