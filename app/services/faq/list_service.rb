# frozen_string_literal: true

module FaqModule
  # Lists faqs.
  class ListService
    def initialize(params, action)
      @action = action
      @query = params['query']
    end

    def call
      faqs = search_faqs
      response = "*Perguntas e Respostas* \n\n"
      faqs.each do |faq|
        response += "*#{faq.id}* - *#{faq.question}*\n`#{faq.answer}` \n"
        faq.hashtags.each { |hashtag| response += "_##{hashtag.name}_ " }
        response += "\n\n"
      end
      faqs.count.positive? ? response : 'Nada encontrado'
    end

    private

    # rubocop:disable Metrics/MethodLength
    def search_faqs
      if @action == 'search'
        Faq.search(@query)
      elsif @action == 'search_by_hashtag'
        faqs = []
        Faq.all.select do |faq|
          faq.hashtags.each do |hashtag|
            faqs << faq if hashtag.name == @query
          end
        end
        faqs
      else
        Faq.all
      end
    end
    # rubocop:enable Metrics/MethodLength
  end
end
