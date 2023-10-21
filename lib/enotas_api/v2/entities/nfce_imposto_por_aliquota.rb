# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V2
    class NfceImpostoPorAliquota < EnotasApi::Entity
      attributes aliquota: :decimal
    end
  end
end
