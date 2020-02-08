# frozen_string_literal: true

# Our Faq class, that represents a question and respective answer.
# Have hashtags too.
class Faq < ActiveRecord::Base
  has_many :faq_hashtags
  has_many :hashtags, :through => :faq_hashtags

  validates :question, :answer, :presence => true
end
