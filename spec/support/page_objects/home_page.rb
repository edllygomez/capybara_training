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

    private
      def router
        @router ||= Auto::Router.new(bot)
      end
  end
end
