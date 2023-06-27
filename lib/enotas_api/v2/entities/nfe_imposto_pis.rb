# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfe_imposto_por_aliquota'
require_relative 'nfe_imposto_por_valor'

module EnotasApi
  module V2
    class NfeImpostoPis < EnotasApi::Entity
      attributes situacaoTributaria: :string,
                 porAliquota: NfeImpostoPorAliquota,
                 porValor: NfeImpostoPorValor
    end
  end
end
