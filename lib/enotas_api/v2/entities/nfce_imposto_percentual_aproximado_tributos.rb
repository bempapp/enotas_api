# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfce_imposto_tributos_simplificado'
require_relative 'nfce_imposto_tributos_detalhado'

module EnotasApi
  module V2
    class NfceImpostoPercentualAproximadoTributos < EnotasApi::Entity
      attributes simplificado: NfceImpostoTributosSimplificado,
                 detalhado: NfceImpostoTributosDetalhado,
                 fonte: :string
    end
  end
end
