# frozen_string_literal: true

require_relative '../app.rb'

Dir['./spec/support/**/*.rb'].sort.each { |file| require file }
Dir['./app/services/**/*.rb'].sort.each { |file| require file }

set :environment, :test

module RSpecMixin
  include Rack::Test::Methods

  def app
    App
  end
end

RSpec.configure do |c|
  c.include RSpecMixin
end
