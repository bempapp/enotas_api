# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V2
    class NfceImpostoTributosSimplificado < EnotasApi::Entity
      attributes percentual: :decimal
    end
  end
end
