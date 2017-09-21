source 'https://rubygems.org/'

ruby '2.3.3'

gem 'rails', '5.0.0.1'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'listen'
#add deviser for user auth
gem 'devise'

group :development, :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'pry-rails'
  gem 'shoulda'
  gem 'valid_attribute'
  gem 'factory_girl'
  gem 'shoulda-matchers', require: false
  gem 'selenium-webdriver'
  gem 'faker'
end

group :test do
  gem 'launchy', require: false
end

group :production do
  gem 'rails_12factor'
end
