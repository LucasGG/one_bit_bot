# frozen_string_literal: true

describe HelpService do
  let(:response) { described_class.call }

  it('match help') { expect(response).to match('help') }
  it('match Adicione ao Faq') { expect(response).to match('Adicione ao Faq') }
  it('match Remova ID') { expect(response).to match('Remova ID') }

  it('match O que você sabe sobre X') do
    expect(response).to match('O que você sabe sobre X')
  end

  it('match Pesquise a hashtag X') do
    expect(response).to match('Pesquise a hashtag X')
  end

  it('match Perguntas e Respostas') do
    expect(response).to match('Perguntas e Respostas')
  end
end
