# frozen_string_literal: true

require 'sinatra'

# TODO: require 'sinatra/base'

require 'sinatra/activerecord'

require_relative 'config/database'

Dir['./app/models/*.rb'].sort.each { |file| require file }

# Base class for a Web App, see Sinatra documentation.
class App < Sinatra::Base
  configure(:development) { enable :logging }

  get '/' do
    'Olá Mundo!'
  end
end
