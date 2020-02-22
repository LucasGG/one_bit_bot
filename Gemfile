# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Sinatra is a DSL for quickly creating web applications in Ruby..
gem 'sinatra', :github => 'sinatra/sinatra'

# ORM (object-relational mapping).
gem 'activerecord', '~> 6.0'
gem 'sinatra-activerecord', '~> 2.0'

# Rake is a Make-like program implemented in Ruby. Tasks and dependencies are
# specified in standard Ruby syntax.
gem 'rake', '~> 13.0'

# postgresql super database
gem 'pg', '~> 1.2'
gem 'pg_search', '~> 2.3'

# pry the Universe!
gem 'pry', '~> 0.12'

group :development do
  # Holy rubocop!
  gem 'rubocop', :require => false
  gem 'rubocop-performance', :require => false
  gem 'rubocop-rspec', :require => false
end

group :test do
  # Test framework.
  gem 'rack-test', :require => 'rack/test'
  gem 'rspec', '~> 3.9'

  # Auxiliary test libs.
  gem 'database_cleaner-active_record', '~> 1.8',
      :require => 'database_cleaner/active_record'
  gem 'factory_bot', '~> 5.1'
  gem 'faker', '~> 2.10'
end
