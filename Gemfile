source 'https://rubygems.org'
ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use OmniAuth to set up the LinkedIn authentication
gem 'omniauth', '~> 1.1.4'
gem 'omniauth-linkedin-oauth2', '~> 0.1.1'

# Use Figaro to manage secret keys and env variables
gem 'figaro'

# Use Gibbon to connect user signups to MailChimp
# Must use the github version to use 0.0.5
gem 'gibbon', git: 'git://github.com/amro/gibbon.git'

# Set up New Relic application monitoring
gem 'newrelic_rpm'

# Make GA actually register pages [fixing Turbolinks issue with that]
gem 'google-analytics-turbolinks'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'therubyracer', :require => 'v8'

group :production do
  # Prepare the app for deployment to Heroku
  gem 'rails_12factor'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
  gem 'pg'
end

group :development do
  gem 'better_errors' # muuuuuch better error messages in browser
  gem 'binding_of_caller' # for an interactive error shell
  gem 'letter_opener' # to send emails in dev to the browser
end

group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'debugger', group: [:development, :test]
