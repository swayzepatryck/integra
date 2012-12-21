source 'https://rubygems.org'
gem 'rails', '3.2.7'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg', '0.14.0'
gem 'devise', '2.1.2'
gem 'json', '1.7.4'
gem 'active_link_to', '1.0.0'
gem 'rolify', '3.1.0'
gem 'cancan', '1.6.8'
gem 'omniauth-ldap', '1.0.2'
gem 'client_side_validations', '3.1.4'
gem 'chosen-rails', '0.9.9'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'    
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'twitter-bootstrap-rails', '2.0.9'
  gem 'font-awesome-rails', '0.3.0'

  gem 'uglifier', '>= 1.0.3'
  gem 'jquery-datatables-rails', :github => 'rweng/jquery-datatables-rails'
  
end

gem 'jquery-rails', '2.0.2'
gem 'bootstrap-will_paginate', '0.0.7'
gem 'galetahub-simple_captcha', '0.1.3', :require => 'simple_captcha'
gem "select2-rails", '3.2.1'
gem 'jQuery-Validation-Engine-rails', '0.0.1'
gem 'modern-pictograms-rails', '0.0.5'
gem "paperclip", "2.8.0"
gem 'fastercsv', '1.5.5'
  
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

### Adicionando Integra Engines <<NÃO EDITAR>>###
Dir.glob("engines/*").each do |e| 
	eval "gem '#{e.split('/')[1]}', :path => 'engines/#{e.split('/')[1]}'"
end 
