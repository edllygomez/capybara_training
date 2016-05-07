module Bot
  class Browser
    extend Capybara::DSL
    include Capybara::DSL

    def execute(script)
      page.execute_script(script)
    end

    def evaluate(script)
      page.evaluate_script(script)
    end

    def coordinates(web_element)
      location = web_element.native.location
      {
        x: location.x.to_i,
        y: location.y.to_i
      }
    end

    def scroll_to(element, pixels = 300)
      coordinates = coordinates(element)
      execute("window.scrollBy(0, #{coordinates[:y] - pixels})")
    end
  end
end
