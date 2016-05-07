module PageObjects
  class SutelPage

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def consult_imei(imei)
      bot.sent_text_by(:id, Selector.sutel_imei, imei)
      bot.click_by_id(Selector.sutel_verificar_btn)
    end

    def result_message
      bot.text_by(:css, Selector.sutel_query_msg)
    end
  end
end
