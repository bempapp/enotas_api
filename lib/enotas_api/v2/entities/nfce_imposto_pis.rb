# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfce_imposto_por_aliquota'
require_relative 'nfce_imposto_por_valor'

module EnotasApi
  module V2
    class NfceImpostoPis < EnotasApi::Entity
      attributes situacaoTributaria: :string,
                 porAliquota: NfceImpostoPorAliquota,
                 porValor: NfceImpostoPorValor
    end
  end
end
