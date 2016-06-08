module Auto
  class Router

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def open(url)
      bot.open(url)
    end

    def open_link(link_text)
      bot.click_lnk(link_text)
    end
  end
end
