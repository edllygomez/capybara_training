require 'spec_helper'

feature "As a sutel user attempting to log into my Sutel account, ", :js => true do

  background(:each) do
    page.driver.browser.manage.window.maximize
  end

  LOGIN_LNK = "a[href*='/user/login']"
  USERNAME_TXT = 'edit-name'
  PASSWORD_TXT = 'edit-pass'
  LOGIN_BTN = 'edit-submit'
  ERROR_LBL = 'div.content div.messages ul'

  given(:username) { 'test_user' }
  given(:password) { 'test_password' }
  given(:expected_message) { 'Respuesta es un campo requerido.' }

  scenario "I can see an error message due to a missing captcha entered" do
    visit('/')
    find(LOGIN_LNK).click
    fill_in(USERNAME_TXT, :with => username)
    fill_in(PASSWORD_TXT, :with => password)
    find(:id, LOGIN_BTN).click
    message_found = find(ERROR_LBL).text
    expect(message_found).to have_content(expected_message),
      "The message expected was #{expected_message} but #{message_found} was found"
  end
end
