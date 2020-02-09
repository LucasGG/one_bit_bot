# frozen_string_literal: true

FactoryBot.define do
  factory :faq do
    question { Faker::Lorem.question }
    answer { Faker::Lorem.sentence }
  end
end
