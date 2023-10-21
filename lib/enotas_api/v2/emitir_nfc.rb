# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V2
    class EmitirNfc < EnotasApi::Request
      def initialize(empresa_id, nf)
        super(method: :POST, uri: "/v2/empresas/#{url_encode(empresa_id)}/nfc-e", content: nf.to_json)
      end
    end
  end
end
