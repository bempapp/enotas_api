# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfce_pedido_pagamento_forma_credenciadora'

module EnotasApi
  module V2
    class NfcePedidoPagamentoForma < EnotasApi::Entity
      attributes tipo: :string,
                 valor: :decimal,
                 credenciadoraCartao: NfcePedidoPagamentoFormaCredenciadora
    end
  end
end
