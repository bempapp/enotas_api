# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfce_imposto_ibs_uf'
require_relative 'nfce_imposto_ibs_municipio'

module EnotasApi
  module V2
    class NfceImpostoIbs < EnotasApi::Entity
      attributes uf: NfceImpostoIbsUf,
                 municipio: NfceImpostoIbsMunicipio
    end
  end
end
