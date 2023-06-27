# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V2
    class NfeImpostoPorValor < EnotasApi::Entity
      attributes valorPorUnidade: :decimal
    end
  end
end
