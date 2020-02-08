# frozen_string_literal: true

# Create 'hashtags' table.
class CreateHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :hashtags do |table|
      table.string :name
    end
  end
end
