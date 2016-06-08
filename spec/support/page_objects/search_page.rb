module PageObjects
  class SearchPage

    attr_reader :bot

    delegate :open_link, to: :router

    def initialize(bot)
      @bot = bot
    end

    private

    def router
      @router ||= Auto::Router.new(bot)
    end
  end
end
