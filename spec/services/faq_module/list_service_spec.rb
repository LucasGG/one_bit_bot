# frozen_string_literal: true

require 'spec_helper'

describe FaqModule::ListService do
  subject(:service) { described_class }

  describe 'list command' do
    context 'with zero faqs in database' do
      it "don't find message" do
        response = service.new({}, 'list').call
        expect(response).to match('Nada encontrado')
      end
    end

    context 'with two faqs in database' do
      let(:faqs) { create_list(:faq, 2) }

      before { faqs }

      it 'find questions and answer in response' do
        response = service.new({}, 'list').call
        expect(response).to faq_list.reduce(true) do |memo, faq|
          memo && match(faq.question) && match(faq.answer)
        end
      end
    end
  end

  describe 'search command' do
    context 'with empty query' do
      it "don't find message" do
        response = service.new({ 'query' => '' }, 'search').call
        expect(response).to match('Nada encontrado')
      end
    end

    context 'with valid query' do
      it 'find question and answer in response' do
        faq = create(:faq)
        response = service.new({ 'query' => faq.question.split(' ').sample },
                               'search')
        expect(response.call).to(match(faq.question) && match(faq.answer))
      end
    end
  end

  describe 'search_by_hashtag command' do
    context 'with invalid hashtag' do
      it "don't find message" do
        response = service.new({ 'query' => '' }, 'search_by_hashtag').call
        expect(response).to match('Nada encontrado')
      end
    end

    context 'with valid hashtag' do
      it 'find question and answer in response' do
        faq = create(:faq)
        hashtag = create(:hashtag, :faqs => [faq])
        response = service.new({ 'query' => hashtag.name },
                               'search_by_hashtag')
        expect(response.call).to match(faq.question) && match(faq.answer)
      end
    end
  end
end
