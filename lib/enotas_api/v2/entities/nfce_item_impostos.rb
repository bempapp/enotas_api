# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfce_imposto_percentual_aproximado_tributos'
require_relative 'nfce_imposto_icms'
require_relative 'nfce_imposto_pis'
require_relative 'nfce_imposto_cofins'
require_relative 'nfce_imposto_ipi'

module EnotasApi
  module V2
    class NfceItemImpostos < EnotasApi::Entity
      attributes percentualAproximadoTributos: NfceImpostoPercentualAproximadoTributos,
                 icms: NfceImpostoIcms,
                 pis: NfceImpostoPis,
                 cofins: NfceImpostoCofins,
                 ipi: NfceImpostoIpi
    end
  end
end
