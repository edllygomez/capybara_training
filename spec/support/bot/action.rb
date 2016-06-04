module Bot
  class Action
    extend Capybara::DSL
    include Capybara::DSL

    def move_to(element)
      move_to_element(element).perform
    end

    def move_to_and_click(element)
      move_to_element(element).click.perform
    end

    def move_by_click(x, y)
      move(x, y).click.perform
    end

    def move_by(x, y)
      move(x, y).perform
    end

    private

    def move(x, y)
      page.driver.browser.action.move_by(x, y)
    end

    def move_to_element(element)
      page.driver.browser.action.move_to(element.native)
    end
  end
end
