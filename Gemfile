source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# FUNDAMENTAL
gem 'rails', '~> 5.1.1'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.7'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'dotenv-rails'

# TAG
gem 'acts-as-taggable-on'

# HAML
gem 'erb2haml'
gem 'haml-rails'

# SCSS
gem 'bootstrap-sass'
gem 'sass-rails', '~> 5.0'

# JAVASCRIPT
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jquery-rails'

# DEVISE
gem 'devise'

# PAGINATION
gem 'will_paginate'
gem 'will_paginate-bootstrap'

# DECORATOR
gem 'draper'

# IMAGE UPLOAD
gem 'carrierwave'
gem 'fog'

# DEBUG
gem 'pry-rails'
gem 'pry'
gem 'pry-remote'
gem 'pry-nav'

# Annotation of SCHEMA
gem 'annotate', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'poltergeist'

  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'database_cleaner'
  gem 'launchy'
end

group :development do
  # N+1 MINOTOR
  gem 'bullet'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
