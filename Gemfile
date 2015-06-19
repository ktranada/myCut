source 'https://rubygems.org'


gem 'rails', '4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'backbone-on-rails'
gem 'jquery-rails'
gem 'acts-as-taggable-on', '~> 3.4'
gem 'ratyrate'
gem 'geocoder'

gem 'figaro'
# Will allow app to access secret information, private keyes, in production.
# IE heroku. It will parse a Git ignored YAML

gem 'aws-sdk', '< 2.0'
# Amazon's S3 service

gem 'filepicker-rails'
# handles s3 work and is applicable for backbone views

gem 'newrelic_rpm'
# Will constantly send requests to site so it doesn't go to sleep.


group :development do
  gem 'annotate'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'better_errors'
  gem 'pry-rails'
  gem 'spring'
end

group :staging, :production do
  gem 'rails_12factor'
  # enables serving assets in production and setting your logger to standard out
end
