module PageObjects
  class RegisterPrepaidPage

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def list_form
      bot.click_by_id(Selector.prepaid_register_number_btn)
      bot.click_by_id(Selector.prepaid_continue_btn)
      bot.click_by_id(Selector.prepaid_accept_terms_btn)
    end

    def select_costarricense
      bot.click_by_id(Selector.prepaid_costarricense_rdo)
    end

    def fill_out_costarricense_form(form_data)
    end
  end
end
