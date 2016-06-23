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
      fill_in_phone_number(form_data[:prepaid_number])
      add_number
      fill_in_id(form_data[:id])
      fill_in_email(form_data[:email])
      fill_in_code(form_data[:code])
    end

    def submit
      bot.click_by_id(Selector.prepaid_submit_btn)
    end

    def error_message
      @error_message ||= bot.text_by(:css, Selector.prepaid_error_msg)
    end

    private

    def fill_in(selector, text)
      bot.fill_txt(selector, text)
    end

    def fill_in_phone_number(phone)
      fill_in(Selector.prepaid_number_txt, phone)
    end

    def add_number
      bot.click_by_id(Selector.prepaid_add_number_btn)
    end

    def fill_in_id(id)
      fill_in(Selector.prepaid_id_owner_txt, id)
    end

    def fill_in_email(email)
      fill_in(Selector.prepaid_email_txt, email)
    end

   def fill_in_code(code)
      fill_in(Selector.prepaid_code_txt, code)
    end
  end
end
