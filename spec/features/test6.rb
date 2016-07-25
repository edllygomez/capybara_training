require 'spec_helper'

feature "As a sutel user, I'm able ", :js => true do

  after(:each) do
    Capybara.use_default_driver
  end

  given(:user_bot) { Bot::User.new }
  given(:expected_description) do
    "Es el Fondo Nacional de Telecomunicaciones (FONATEL), " \
    "que tiene como propósito llevar telefonía e internet  a zonas y comunidades donde aún no " \
    "hay  servicio, promoviendo acceso universal, servicio universal y solidaridad establecidos " \
    "en la Ley General de Telecomunicaciones N° 8642. Además de cumplir con las metas y " \
    "prioridades del Plan Nacional de Desarrollo de las Telecomunicaciones (PNDT)."
  end

  scenario "to visit Fonatel" do
    home_page = PageObjects::HomePage.new(user_bot)
    home_page.open
    home_page.list_fonatel
    fonatel_page = home_page.list_que_es_fonatel
    expect(fonatel_page.description).to eq(expected_description), "The description expected " \
      "was #{expected_description} but #{fonatel_page.description} was found"
  end
end
