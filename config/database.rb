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

configure :production do
  db = URI.parse(
    ENV.fetch('DATABASE_URL') { 'postgres:///postgres/onebitbot_production' }
  )

  set :database, {
    :adapter => 'postgresql',
    :host => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  }
end
