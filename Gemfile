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

group :development do
  # Holy rubocop!
  gem 'rubocop', :require => false
end
