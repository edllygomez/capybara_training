module PageObjects
  class AvisosPage

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def open(index)
      link = bot.find_all(Selector.avisos_links)[index]
      title = bot.text(link)
      bot.click(link)
      sleep(5)
      title
    end
  end
end
