# frozen_string_literal: true

# As instructions says from bundler website:
# See #How to use Bundler with Sinatra

require 'bundler'

Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require_relative 'app'

run App
