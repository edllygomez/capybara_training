module PageObjects
  class TemaConsultaPage

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def movil
      bot.click_by_css(Selector.tema_movil)
      ConsultaMovilPage.new(bot)
    end
  end
end
