# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfe_imposto_tributos_simplificado'
require_relative 'nfe_imposto_tributos_detalhado'

module EnotasApi
  module V2
    class NfeImpostoPercentualAproximadoTributos < EnotasApi::Entity
      attributes simplificado: NfeImpostoTributosSimplificado,
                 detalhado: NfeImpostoTributosDetalhado,
                 fonte: :string
    end
  end
end
