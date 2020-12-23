source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# rails
gem 'rails', '~> 6.1.0'

# server
gem 'puma', '~> 5.0'

# add ons
gem 'attr_encrypted', '~> 3.1.0'
gem 'graphiql-rails'
gem 'graphql', '~> 1'
gem 'nanoid', '~> 2'
gem 'paper_trail', '~> 10'
gem 'pg', '~> 1'
gem 'rack-cors', '~> 1'

# Cloud
gem 'aws-sdk-secretsmanager', '~> 1'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'net-ssh-gateway'
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
