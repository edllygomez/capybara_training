module PageObjects
  class FonatelPage

    attr_reader :bot, :action_bot

    def initialize(bot)
      @bot = bot
    end

    def description
      @description ||= bot.text(first_paragraph)
    end

    private

    def first_paragraph
      @first_paragraph ||= bot.find_all(Selector.fonatel_description)[1]
    end
  end
end
