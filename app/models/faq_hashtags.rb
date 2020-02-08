# frozen_string_literal: true

# Faq/Hashtag link.
class FaqHashtag < ActiveRecord::Base
  belongs_to :faq
  belongs_to :hashtag
end
