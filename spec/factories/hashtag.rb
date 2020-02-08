# frozen_string_literal: true

FactoryBot.define do
  factory :hashtag do
    name { Faker::Lorem.word }
  end
end
