# frozen_string_literal: true

require "capybara/rspec"
require "selenium/webdriver"

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    if ENV["SELENIUM_DRIVER_URL"].present?
      driven_by(:selenium, using: :chrome,
                           options: {
                             browser: :remote,
                             url: ENV.fetch("SELENIUM_DRIVER_URL"),
                             desired_capabilities: :chrome,
                           })
      Capybara.default_max_wait_time = 10
    else
      driven_by(:selenium_chrome_headless)
    end
  end

  config.after(:all) do
    FileUtils.rm_rf(Rails.root.join("tmp", "storage"))
  end
end
