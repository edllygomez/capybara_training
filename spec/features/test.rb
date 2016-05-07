require 'spec_helper'

feature "As a kolbi user, I'm able", :js => true do

  given(:user_bot) { Bot::User.new }
  given(:imei) { '354445065269333'}
  given(:expected_message) do
   'IMEI 354445065269333 fue encontrado exitosamente como identificador homologado.'
 end

  scenario "to verify my IMEI" do
    home_page = PageObjects::HomePage.new(user_bot)
    home_page.open
    descuentos_page = home_page.list_descuentos
    sutel_page = descuentos_page.open_sutel_consulta
    sutel_page.consult_imei(imei)
    expect(sutel_page.result_message).to eq(expected_message),
      "The message expected was #{expected_message} but #{sutel_page.result_message} was found"
  end
end
