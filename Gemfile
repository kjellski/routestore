source 'https://rubygems.org'
gem 'rails', '3.2.11'
gem 'sqlite3'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass', '>= 2.3.1.0'

  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'rspec-rails', '~>2.12', :group => [:development, :test]
gem 'factory_girl_rails', '>= 4.2.0', :group => [:development, :test]

group :development do
  gem 'guard-bundler', '>= 1.0.0'
  gem 'guard-cucumber', '>= 1.4.0'
  gem 'guard-rails', '>= 0.4.0'
  gem 'guard-rspec', '>= 2.5.2'
  gem 'rb-inotify', '>= 0.9.0', :require => false
  gem 'rb-fsevent', '>= 0.9.3', :require => false
  gem 'rb-fchange', '>= 0.0.6', :require => false
  gem 'quiet_assets', '>= 1.0.2'
  gem 'better_errors', '>= 0.7.2'
  gem 'hub', '>= 1.10.2', :require => nil
  gem 'binding_of_caller', '>= 0.7.1', :platforms => [:mri_19, :rbx]
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner', '>= 1.0.0.RC1'
  gem 'email_spec', '>= 1.4.0'
  gem 'cucumber-rails', '>= 1.3.1', :require => false
  gem 'launchy', '>= 2.2.0'
  gem 'capybara', '>= 2.0.3'
end

group :production do
  gem 'puma', '>= 1.6.3'
end

gem 'geocoder'
gem 'jquery-rails'
gem 'devise', '>= 2.2.3'
gem 'figaro', '>= 0.6.3'
