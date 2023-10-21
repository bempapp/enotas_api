# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V2
    class NfceImpostoTributosDetalhado < EnotasApi::Entity
      attributes percentualFederal: :decimal,
                 percentualEstadual: :decimal,
                 percentualMunicipal: :decimal
    end
  end
end
