# frozen_string_literal: true

describe FaqModule::RemoveService do
  subject(:service) { described_class }

  context 'with valid id' do
    let(:faq) { create(:faq) }
    let(:service_init_parameters) { { 'id' => faq.id } }

    it 'return success message' do
      response = service.new(service_init_parameters).call
      expect(response).to match('Deletado com sucesso')
    end

    it 'remove faq from database' do
      service.new(service_init_parameters).call
      expect(Faq.all.count).to eq(0)
    end
  end

  context 'with invalid id' do
    it 'return error message' do
      response = service.new('id' => rand(1..9999)).call
      expect(response).to match('Questão inválida, verifique o Id')
    end
  end
end
