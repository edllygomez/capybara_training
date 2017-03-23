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
  given(:form_data) do
    {
      lastname1: "Perez",
      lastname2: "Mora",
      name: "Juan",
      nationality: "costarricense",
      id: "114350876",
      job_title: "Ing. Computación",
      email: "juan_perez@mail.com",
      state: "Heredia",
      notification_detail: "Automated notification detail",
      operator_name: "Maria Cecilia Madrigal",
      tel_number_affected: "87766554",
      voucher_code: "123456789"
    }
  end
  given(:error_message) do
    "Firma digital * es un campo requerido.\n"\
    "Descripción detallada del problema es un campo requerido.\n"\
    "You need to select a term from the deepest level.\n"\
    "You need to select a term from the deepest level."
  end

  scenario "to post a complain" do
    home_page = PageObjects::HomePage.new(user_bot)
    home_page.open
    reclamos_page = home_page.list_reclamos
    reclamos_page.fill_out(form_data)
    reclamos_page.submit
    expect(reclamos_page.error_message).to eq(error_message),
     "The message expected was #{error_message} but #{reclamos_page.error_message} was found"
  end
end
