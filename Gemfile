source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "awesome_print"
gem "bootsnap", require: false
gem "date_by_example"
gem "devise"
gem "jbuilder"
gem "puma"
gem "rails"
gem "simple_form"
gem "sqlite3"
gem "table_print"
gem "turbolinks"
gem "webpacker"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "faker"
  gem "pry-rails"
  gem "pry-rescue"
  gem "rspec-rails", "~> 4.0.0.beta2"
  gem "rubocop"
  gem "rubocop-performance"
  gem "rubocop-rails"
end

group :development do
  gem "annotate"
  gem "erb_lint", require: false
  gem "htmlbeautifier"
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "spring-watcher-listen"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "factory_bot_rails"
  gem "fuubar"
  gem "selenium-webdriver"
  gem "test-prof"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
