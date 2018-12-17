source "https://rubygems.org"
<<<<<<< HEAD

=======
>>>>>>> 3f9b0a35f7360db1e71173ae2c892e80bc0ccb4f
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.1.6"
# Use sqlite3 as the database for Active Record
group :development, :test do
  gem 'sqlite3', '1.3.13'
end

gem "bcrypt", "3.1.12"
gem "bootstrap-will_paginate", "1.0.0"
gem "carrierwave", "1.2.2"
gem "faker", "1.7.3"
gem "jquery-rails"
gem "mini_magick", "4.7.0"
gem "minitest"
gem "rails", "~> 5.1.6"
gem "rails-controller-testing"
gem "will_paginate", "3.1.6"
# Use sqlite3 as the database for Active Record
gem "bootstrap-sass", "3.3.7"
# Use Puma as the app server
gem "puma", "~> 3.7"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"
# Use Uglifier as compressor for JavaScript assets
gem "uglifier", ">= 1.3.0"
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem "coffee-rails", "~> 4.2"
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"
# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"
# Use Capistrano for deployment
# gem "capistrano-rails", group: :development
gem "rubocop", "~> 0.54.0", require: false
group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end
group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
group :test do
  gem "guard-minitest", "2.3.1"
  gem "mini_backtrace", "0.1.3"
  gem "minitest-reporters", "1.0.5"
end

group :production do
  gem "fog", "1.42"
  gem "pg",  "0.20.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
