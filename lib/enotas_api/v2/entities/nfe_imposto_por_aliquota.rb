# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V2
    class NfeImpostoPorAliquota < EnotasApi::Entity
      attributes aliquota: :decimal
    end
  end
end
