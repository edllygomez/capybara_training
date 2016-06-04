module PageObjects
  class ComplainsPage

    attr_reader :bot

    def initialize(bot)
      @bot = bot
    end

    def fill_out(form_data)
      fill_in_lastname1(form_data[:lastname1])
      fill_in_lastname2(form_data[:lastname2])
      fill_in_name1(form_data[:name])
      fill_in_nationality(form_data[:nationality])
      fill_in_id(form_data[:id])
      fill_in_job_title(form_data[:job_title])
      fill_in_email(form_data[:email])
      fill_in_notification_detail(form_data[:notification_detail])
      fill_in_operator_name(form_data[:operator_name])
      fill_in_tel_number_affected(form_data[:tel_number_affected])
      fill_in_voucher_code(form_data[:voucher_code])
      select_state(form_data[:state])
      select_email_notification
    end

    def submit
      bot.click_by_id(Selector.complain_submit_btn)
    end

    def error_message
      @error_message ||= bot.text_by(:css, Selector.complain_error_msg)
    end

    private

    def fill_in(selector, text)
      bot.fill_txt(selector, text)
    end

    def fill_in_lastname1(lastname)
      fill_in(Selector.complain_lastname1, lastname)
    end

    def fill_in_lastname2(lastname)
      fill_in(Selector.complain_lastname2, lastname)
    end

    def fill_in_name1(name)
      fill_in(Selector.complain_name, name)
    end

    def fill_in_nationality(nationality)
      fill_in(Selector.complain_nationality, nationality)
    end

    def fill_in_id(id)
      fill_in(Selector.complain_id, id)
    end

    def fill_in_job_title(job)
      fill_in(Selector.complain_job_title, job)
    end

    def fill_in_email(email)
      fill_in(Selector.complain_email, email)
    end

    def fill_in_notification_detail(detail)
      fill_in(Selector.complain_notification_detail, detail)
    end

    def fill_in_operator_name(name)
      fill_in(Selector.complain_operator_name, name)
    end

    def fill_in_tel_number_affected(number)
      fill_in(Selector.complain_tel_number_affected, number)
    end

    def fill_in_voucher_code(code)
      fill_in(Selector.complain_voucher_code, code)
    end

    def select_state(state)
      bot.select_from(state, Selector.complain_state, :first)
    end

    def select_email_notification
      bot.click_by_id(Selector.complain_email_rdo)
    end
  end
end
