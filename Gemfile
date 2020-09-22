source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'bootsnap'
gem 'bootstrap'
gem 'carrierwave'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'devise-i18n'
gem 'figaro'
gem 'fog-aws'
gem 'listen'
gem 'mailgun-ruby', '~>1.1.6'
gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
gem 'rails-i18n'
gem 'rmagick'
gem 'therubyracer'
gem 'uglifier'
gem 'webpacker', github: 'rails/webpacker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3', '~> 1.4'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-webpacker-precompile', require: false
end

group :production do
  gem 'pg'
end
