require 'spec_helper'

feature "As a kolbi user, I'm able ", :js => true do

  given(:user_bot) { Bot::User.new }
  given(:form_data) do
    {
      nombre: 'Juan Perez',
      telefono: '86655443',
      email: 'juanperez@email.com',
      provincia: 'San Jose',
      pais: 'Costa Rica'
    }
  end
  given(:error) do
    'Consulta y/o comentario (Favor indicar el teléfono al que se refiere la consulta o comentario)'
  end

  scenario "to perfom queries" do
    home_page = PageObjects::HomePage.new(user_bot)
    home_page.open
    tema = home_page.escribir_consulta
    movil = tema.movil
    movil.pospago
    movil.plan_pospago
    movil.consultar
    movil.fill_out(form_data)
    movil.enviar
    expect(movil.error_descripcion).to eq(error),
    "The message error obtained was #{movil.error_descripcion}"
  end
end
