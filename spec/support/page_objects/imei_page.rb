module PageObjects
  class ImeiPage

    attr_reader :bot, :action_bot

    def initialize(bot)
      @bot = bot
    end

    def verificar_imei(imei)
      bot.fill_txt(Selector.imei_txt, imei)
      bot.click_by_id(Selector.imei_submit_btn)
    end

    def imei_result
      @imei_result ||= bot.text_by(:css, "ul.form-result")
    end
  end
end
