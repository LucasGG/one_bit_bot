# frozen_string_literal: true

require 'sinatra'

# TODO: require 'sinatra/base'
require 'sinatra/activerecord'

require_relative 'config/database'

Dir['./app/models/*.rb'].sort.each { |file| require file }
Dir['./app/services/**/*.rb'].sort.each { |file| require file }

# Base class for a Web App, see Sinatra documentation.
class App < Sinatra::Base
  configure(:development) { enable :logging }

  get '/' do
    'Olá Mundo!'
  end

  post '/webhook' do
    request.body.rewind
    result = JSON.parse(request.body.read)['queryResult']

    if result['contexts'].present?
      response = InterpretService.call(result['action'],
                                       result['contexts'][0]['parameters'])
    else
      response = InterpretService.call(result['action'], result['parameters'])
    end

    content_type :json, :charset => 'utf-8'
    {
      :fulfillmentText => response,
      :payload => {
        :telegram => {
          :text => response,
          :parse_mode => 'Markdown'
        }
      }
    }.to_json
  end
end
