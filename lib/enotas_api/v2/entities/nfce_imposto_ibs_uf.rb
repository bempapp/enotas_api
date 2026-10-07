# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V2
    class NfceImpostoIbsUf < EnotasApi::Entity
      attributes aliquota: :decimal,
                 percentualDiferimento: :decimal,
                 percentualReducaoAliquota: :decimal
    end
  end
end
