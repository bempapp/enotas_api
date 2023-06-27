# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfe_referenciada'
require_relative 'nfe_cliente'

module EnotasApi
  module V2
    class Nfe < EnotasApi::Entity
      attributes id: :string,
                 ambienteEmissao: :string,
                 naturezaOperacao: :string,
                 tipoOperacao: :string,
                 finalidade: :string,
                 consumidorFinal: :boolean,
                 enviarPorEmail: :boolean,
                 nfeReferenciada: NfeReferenciada,
                 dataEmissao: :string,
                 cliente: NfeCliente,
                 itens: :array,
                 informacoesAdicionais: :string
    end
  end
end
