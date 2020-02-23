# frozen_string_literal: true

describe FaqModule::CreateService do
  subject(:service) { described_class }

  let(:question) { Faker::Lorem.question }
  let(:answer) { Faker::Lorem.sentence }
  let(:hashtags) { "#{Faker::Lorem.word}, #{Faker::Lorem.word}" }

  context 'without valid parameters' do
    it 'will receive an error' do
      response = service.new('question' => question, 'answer' => answer).call
      expect(response).to match('Hashtag Obrigatória')
    end
  end

  context 'with valid parameters' do
    let(:creation_parameters) do
      { 'question' => question, 'answer' => answer, 'hashtags' => hashtags }
    end

    def create_service
      service.new(creation_parameters).call
    end

    it 'receive success message' do
      expect(create_service).to match('Criado com sucesso')
    end

    it 'question is present in database' do
      create_service
      expect(Faq.last.question).to match(question)
    end

    it 'answer is present in database' do
      create_service
      expect(Faq.last.answer).to match(answer)
    end

    it 'validate the first hashtag creation with database' do
      create_service
      expect(hashtags.split(/[\s,]+/).first).to match(Hashtag.first.name)
    end

    it 'validate the last hashtag creation with database' do
      create_service
      expect(hashtags.split(/[\s,]+/).last).to match(Hashtag.last.name)
    end
  end
end
