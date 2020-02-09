# frozen_string_literal: true

require 'pg_search'

# Our Faq class, that represents a question and respective answer.
# Have hashtags too.
class Faq < ActiveRecord::Base
  include PgSearch::Model

  has_many :faq_hashtags
  has_many :hashtags, :through => :faq_hashtags

  validates :question, :answer, :presence => true

  pg_search_scope :search, :against => %i[question answer]
end
