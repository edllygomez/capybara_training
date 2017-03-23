require 'spec_helper'

feature "As a sutel user, I'm able ", :js => true do

  background(:each) do
    page.driver.browser.manage.window.resize_to(1420, 1440)
  end

  given(:user_bot) { Bot::User.new }
  given(:expected_info) do
    {
        plan1_detalle: "¢2,500",
        plan2_detalle: "¢5,000",
        plan3_detalle: "¢10,000",
        plan1_vencimiento: "30 días",
        plan2_vencimiento: "45 días",
        plan3_vencimiento: "60 días",
        plan1_precio: "¢40.00",
        plan2_precio: "¢37.00",
        plan3_precio: "¢34.00"
      }
  end

  scenario "to verify the infomation on the table inside Tarifas Vigentes page" do
    home_page = PageObjects::HomePage.new(user_bot)
    home_page.open
    home_page.list_a_su_servicio
    tarifas_page = home_page.list_tarifas_vigentes
    table_info = tarifas_page.table_info
    table_info.each do |key, value|
      expect(expected_info[key]).to eq(value), "The #{key} found was #{value} but " \
        "expected_info[key] was expected"
    end
  end
end
