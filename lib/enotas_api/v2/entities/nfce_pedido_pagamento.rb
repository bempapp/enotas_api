# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V2
    class NfcePedidoPagamento < EnotasApi::Entity
      attributes tipo: :string,
                 formas: :array
    end
  end
end
