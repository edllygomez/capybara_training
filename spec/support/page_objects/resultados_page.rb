module PageObjects
  class ResultadosPage

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def results_txt
      bot.text_by(:id, Selector.busqueda_texto)
    end

    def results
      bot.find_all(Selector.busqueda_resultados).size
    end
  end
end
