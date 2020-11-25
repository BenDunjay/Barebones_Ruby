# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

group :development do
  gem "byebug"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
end

group :development, :test do
  gem "rspec-rails"
  gem "factory_girl_rails"
end
