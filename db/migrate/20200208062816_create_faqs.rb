# frozen_string_literal: true

# Create 'faqs' table.
class CreateFaqs < ActiveRecord::Migration[6.0]
  def change
    create_table(:faqs) do |table|
      table.string :question
      table.string :answer
    end
  end
end
