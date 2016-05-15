module PageObjects
  class ConsultaMovilPage

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def pospago
      bot.click_by_css(Selector.movil_pospago)
    end

    def plan_pospago
      bot.click_by_css(Selector.movil_plan_pospago_chk)
    end

    def consultar
      bot.click_by_css(Selector.movil_consultar_btn)
    end

    def fill_out(form_data)
      fill_in_nombre(form_data[:nombre])
      fill_in_telefono(form_data[:telefono])
      fill_in_email(form_data[:email])
      select_pais(form_data[:pais])
      fill_in_provincia(form_data[:provincia])
    end

    def enviar
      bot.click_by_css(Selector.movil_enviar_btn)
    end

    def error_descripcion
      bot.text_by(:css, Selector.movil_error_descripcion)
    end

    private

    def fill_in_nombre(nombre)
      fill_in(Selector.movil_nombre_cliente, nombre)
    end

    def fill_in_telefono(telefono)
      fill_in(Selector.movil_telefono_cliente, telefono)
    end

    def fill_in_email(email)
      fill_in(Selector.movil_email_cliente, email)
    end

    def fill_in_provincia(provincia)
      fill_in(Selector.movil_provincia_cliente, provincia)
    end

    def select_pais(pais)
      bot.select_from(pais, Selector.movil_pais_cliente)
    end

    def fill_in(locator, text)
      bot.fill_txt(locator, text)
    end
  end
end
