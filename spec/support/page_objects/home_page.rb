module PageObjects
  class HomePage

    attr_reader :bot, :action_bot

    def initialize(bot)
      @bot = bot
      @action_bot = Bot::Action.new
    end

    def open
      router.open('/')
    end

    def list_a_su_servicio
      menu = bot.find_by(:css, Selector.home_a_su_servicio)
      action_bot.move_to(menu)
      sleep(1)
    end

    def list_verificar_imei
      action_bot.move_by(0, 160)
      action_bot.move_by_click(-400, 0)
      ImeiPage.new(bot)
    end

    def list_reclamos
      bot.click_by_css(Selector.home_reclamos_tile)
      ComplainsPage.new(bot)
    end

    def visit_aresep
      bot.click_by_css(Selector.home_aresep_lnk)
      bot.open_window("Inicio - ARESEP")
    end

    private

    def router
      @router ||= Auto::Router.new(bot)
    end
  end
end
