source 'http://rubygems.org'

gem 'rails', '3.1.3'
gem "rake", "0.8.7"
gem "devise", ">= 1.5.0"
gem 'omniauth'
gem 'omniauth-facebook'


# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end
group :development, :test do
  gem 'sqlite3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  #gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'sass-rails',   '~> 3.1.5'
gem 'jquery-rails', '> 1.0.12'
gem "activeadmin"

gem 'kaminari'

# For meta update
gem 'meta-tags', :require => 'meta_tags'

# Annotate models
gem 'annotate'

# Cloud Storage for files
gem 'aws-s3'
gem 'aws-sdk'

# File Handling
gem 'paperclip'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end
