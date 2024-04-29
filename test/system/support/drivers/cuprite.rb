require "capybara/cuprite"

Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(
    app,
    window_size: [1200, 800],
    browser_options: {
      'no-sandbox': nil
    },
    inspector: true,
    url: ENV['CHROME_URL']
  )
end
