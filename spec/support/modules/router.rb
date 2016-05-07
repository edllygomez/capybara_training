module Auto
  class Router

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def open(url)
      bot.open(url)
    end
  end
end
