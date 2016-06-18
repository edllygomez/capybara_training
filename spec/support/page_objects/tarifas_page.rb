module PageObjects
  class TarifasPage

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def table_info
      columns = bot.find_all(Selector.tarifas_table)
      {
        plan1_detalle: bot.text(columns[5]),
        plan2_detalle: bot.text(columns[6]),
        plan3_detalle: bot.text(columns[7]),
        plan1_vencimiento: bot.text(columns[9]),
        plan2_vencimiento: bot.text(columns[10]),
        plan3_vencimiento: bot.text(columns[11]),
        plan1_precio: bot.text(columns[13]),
        plan2_precio: bot.text(columns[14]),
        plan3_precio: bot.text(columns[15])
      }
    end
  end
end
