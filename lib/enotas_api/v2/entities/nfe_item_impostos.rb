# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfe_imposto_percentual_aproximado_tributos'
require_relative 'nfe_imposto_icms'
require_relative 'nfe_imposto_pis'
require_relative 'nfe_imposto_cofins'
require_relative 'nfe_imposto_ipi'

module EnotasApi
  module V2
    class NfeItemImpostos < EnotasApi::Entity
      attributes percentualAproximadoTributos: NfeImpostoPercentualAproximadoTributos,
                 icms: NfeImpostoIcms,
                 pis: NfeImpostoPis,
                 cofins: NfeImpostoCofins,
                 ipi: NfeImpostoIpi
    end
  end
end
