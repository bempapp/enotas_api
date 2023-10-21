# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V2
    class NfcePedidoPagamentoFormaCredenciadora < EnotasApi::Entity
      attributes tipoIntegracaoPagamento: :string,
                 cnpjCredenciadoraCartao: :string,
                 bandeira: :string,
                 autorizacao: :string
    end
  end
end
