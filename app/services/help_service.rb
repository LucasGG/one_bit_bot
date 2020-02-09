# frozen_string_literal: true

# Helper.
class HelpService
  def self.call
    response  = "*Meus comandos* \n\n"
    response += "help => `Lista de comandos que eu conheço`\n\n"
    response += "Adicione ao Faq => `Adiciona uma nova questão ao Faq`\n\n"
    response += "Remova ID => `Remove uma questão baseada no ID dela`\n\n"
    response += 'O que você sabe sobre X => `Pesquisa por palavra na lista ' \
                "de perguntas e respostas`\n\n"
    response += 'Pesquise a hashtag X => `Lista as perguntas e respostas com ' \
                "aquela hashtag`\n\n"
    response + 'Perguntas e Respostas => `Mostra a lista de perguntas e ' \
               "respostas`\n\n"
  end
end
