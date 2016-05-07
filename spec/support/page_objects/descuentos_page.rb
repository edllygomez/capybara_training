module PageObjects
  class DescuentosPage

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def open_sutel_consulta
      bot.click_by_css(Selector.descuentos_sutel_lnk)
      bot.open_window('CETCA - Consulta de Homologaciones para SUTEL Costa Rica')
      SutelPage.new(bot)
    end
  end
end
