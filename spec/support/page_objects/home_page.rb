module PageObjects
  class HomePage

    attr_reader :bot, :action_bot

    def initialize(bot)
      @bot = bot
      @action_bot = Bot::Action.new
    end

    def open
      router.open('/')
    end

    def list_descuentos
      bot.click_by_css(Selector.home_banner_descuento)
      DescuentosPage.new(bot)
    end

    def buscar(text)
      fill_in_search(text)
      search
      ResultadosPage.new(bot)
    end

    def escribir_consulta
      contactanos = bot.find_by(:css, Selector.home_contactanos)
      action_bot.move_to(contactanos)
      action_bot.move_by_click(0, 100)
      TemaConsultaPage.new(bot)
    end

    private
    def router
      @router ||= Auto::Router.new(bot)
    end

    def fill_in_search(text)
      bot.sent_text_by(:id, Selector.home_buscar_input, text)
    end

    def search
      bot.click_by_css(Selector.home_buscar_btn)
    end
  end
end
