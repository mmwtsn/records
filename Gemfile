# Use secure gem source
source 'https://rubygems.org'

# Latest stable Rails
gem 'rails', '4.1.0'
gem 'turbolinks'

# Database adapter and depdencies
gem 'mysql2'
gem 'therubyracer'

# Front-end libraries
gem 'sass-rails', '~> 4.0.3'
gem 'jquery-rails'
gem 'bourbon'

# Authentication
gem 'devise'

# Gems available in development
group :development do
  gem 'pry-rails'
  gem 'spring'
end

# Gems available for testing
group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'factory_girl_rails', "~> 4.0"
  gem 'database_cleaner'
  gem 'launchy'
end

# Gems shared across environments
group :test, :development do
  gem 'rspec-rails'
end
