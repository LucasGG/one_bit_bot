# frozen_string_literal: true

# Create 'faq_hashtags' table.
class CreateFaqHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :faq_hashtags do |table|
      table.references :faq
      table.references :hashtag

      table.timestamps
    end
  end
end
