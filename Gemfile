source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.8"

gem "sprockets-rails"

gem "sqlite3", "~> 1.4"

gem "puma", "~> 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem "redis", "~> 4.0"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

gem 'faraday'

gem 'will_paginate', '~> 4.0'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 5.0'
  gem 'factory_bot_rails'
end

group :development do
  gem "web-console"
end

group :test do
  gem "vcr"
  gem "webmock"
  gem "capybara"
  gem "selenium-webdriver"
  gem 'rails-controller-testing', '~> 0.0.3'
end
