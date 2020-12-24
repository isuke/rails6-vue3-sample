Capybara.register_driver :headless_chrome do |app|
  args = %w[disable-gpu mute-audio window-size=1280,800 lang=ja headless]
  Capybara::Selenium::Driver.new(
    app,
    browser:              :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chrome_options: {
        args: args,
        w3c:  false,
      },
    ),
  )
end
RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :headless_chrome
  end
end
