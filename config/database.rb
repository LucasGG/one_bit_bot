# frozen_string_literal: true

configure(:test) do
  set :database,
      :adapter => 'postgresql',
      :encoding => 'unicode',
      :database => 'one_bit_bot_test',
      :pool => 5,
      :username => ENV.fetch('POSTGRES_USER') { 'postgres' },
      :host => ENV.fetch('POSTGRES_HOST') { 'localhost' }
end

configure(:development) do
  set :database,
      :adapter => 'postgresql',
      :encoding => 'unicode',
      :database => 'one_bit_bot_dev',
      :pool => 5,
      :username => ENV.fetch('POSTGRES_USER') { 'postgres' },
      :host => ENV.fetch('POSTGRES_HOST') { 'localhost' }
end
