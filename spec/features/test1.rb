require 'spec_helper'

feature "As a sutel user, I'm able ", :js => true do

  background(:each) do
    page.driver.browser.manage.window.resize_to(1420, 1440)
  end

  given(:user_bot) { Bot::User.new }
  given(:imei) { '354445065269333'}
  given(:expected_message) { 'Apple iPhone 6' }

  scenario "to verify my IMEI" do
    home_page = PageObjects::HomePage.new(user_bot)
    home_page.open
    home_page.list_a_su_servicio
    imei_page = home_page.list_verificar_imei
    imei_page.verificar_imei(imei)
    expect(imei_page.imei_result).to have_content(expected_message),
      "The message expected was #{expected_message} but #{imei_page.imei_result} was found"
  end
end
