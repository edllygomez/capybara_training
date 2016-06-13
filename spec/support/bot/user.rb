module Bot
  class User
    extend Capybara::DSL
    include Capybara::DSL

    def open(url)
      visit(url)
    end

    def fill_txt(locator, text)
      fill_in(locator, with: text)
    end

    def sent_text_by(by, locator, text)
      find_by(by, locator).native.tap { |item| clear_txt(item) }.send_keys(text)
    end

    def click_by_id(locator)
      click_by(:id, locator)
    end

    def click_by_css(locator)
      click_by(:css, locator)
    end

    def click_by(by, locator)
      click(find_by(by, locator))
    end

    def click(web_element)
      web_element.click
    end

    def click_lnk(link_name)
      click_link(link_name)
    end

    def find_all(locator, by=:css)
      all(by, locator, visible: true)
    end

    def find_all_within(web_element, locator)
      web_element.all(locator)
    end

    def find_within(web_element, by, locator)
      web_element.find(by, locator)
    end

    def text_by(by, locator)
      text(find_by(by, locator))
    end

    def text(web_element)
      web_element.native.text
    end

    def find_by(by, locator)
      find(by, locator)
    end

    def close_popup(popup_selector, btn_selector)
      within(:css, popup_selector) { click_by_css(btn_selector) } if exists?(popup_selector)
    end

    def exists?(css_selector, element = page)
      element.has_css?(css_selector)
    end

    def wait_for(locator)
      page.document.synchronize { find_all(locator) }
    end

    def select_from(option, locator, match)
      page.select(option, from: locator, match: match)
    end

    def open_window(window_title)
      switch_to_window { title == window_title }
    end

    def open_last_window
      window = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.window(window)
    end

    private

    def clear_txt(web_element)
      web_element.clear
    end
  end
end
