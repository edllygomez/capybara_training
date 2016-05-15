module Bot
  class Action
    extend Capybara::DSL
    include Capybara::DSL

    def move_to(element)
      page.driver.browser.action.move_to(element.native).perform
    end

    def move_by_click(x, y)
      page.driver.browser.action.move_by(x, y).click.perform
    end

    def move_by(x, y)
      page.driver.browser.action.move_by(x, y).perform
    end
  end
end
