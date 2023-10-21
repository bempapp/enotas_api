# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V2
    class NfceImpostoPorValor < EnotasApi::Entity
      attributes valorPorUnidade: :decimal
    end
  end
end
