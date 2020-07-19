source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bootsnap'
gem 'bootstrap'
gem 'carrierwave'
gem 'devise'
gem 'fog-aws'
gem 'listen'
gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
gem 'rails-i18n'
gem 'rmagick'
gem 'therubyracer'
gem 'uglifier'
gem 'webpacker', github: 'rails/webpacker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3', '~> 1.4'
end

group :production do
  gem 'pg'
end
