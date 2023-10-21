# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfce_cliente'
require_relative 'nfce_pedido'

module EnotasApi
  module V2
    class Nfce < EnotasApi::Entity
      attributes id: :string,
                 ambienteEmissao: :string,
                 naturezaOperacao: :string,
                 enviarPorEmail: :boolean,
                 pedido: NfcePedido,
                 cliente: NfceCliente,
                 itens: :array,
                 informacoesAdicionais: :string
    end
  end
end
