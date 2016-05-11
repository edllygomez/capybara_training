module PageObjects
  class HomePage

    attr_reader :bot

    def initialize(bot)
      @bot = bot
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
