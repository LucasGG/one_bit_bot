# frozen_string_literal: true

# As instructions says from bundler website:
# See #How to use Bundler with Sinatra

require 'rubygems'
require 'bundler'
Bundler.setup(:default, ENV['RACK_ENV'])

require_relative 'app'

run App
