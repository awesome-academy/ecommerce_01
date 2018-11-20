source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.5.1"

gem "bcrypt", "~>3.1.12"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap", "~> 4.1.3"
gem "cancancan", "~> 2.0"
gem "carrierwave", "~>1.2.2"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "devise"
gem "faker", "~>1.7.3"
gem "figaro"
gem "i18n-js"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", "~>4.3.1"
gem "mini_magick", "~>4.7.0"
gem "omniauth-google-oauth2"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.1"
gem "rails_admin", "~> 1.4"
gem "rails_admin_import", "~> 2.1"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "will_paginate-bootstrap4"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "mysql2", ">=0.4.10"
  gem "rubocop", "~> 0.54.0", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "chromedriver-helper"
  gem "minitest", ">=5.10.3"
  gem "minitest-reporters", ">=1.1.14"
  gem "rails-controller-testing", "1.0.2"
  gem "selenium-webdriver"
end

group :production do
  gem "fog", ">=1.42"
  gem "pg", "0.20.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
