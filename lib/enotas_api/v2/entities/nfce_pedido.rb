# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfce_pedido_pagamento'

module EnotasApi
  module V2
    class NfcePedido < EnotasApi::Entity
      attributes presencaConsumidor: :string,
                 pagamento: NfcePedidoPagamento
    end
  end
end
