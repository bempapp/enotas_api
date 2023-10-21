# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V2
    class CancelarNfc < EnotasApi::Request
      def initialize(empresa_id, nf_id)
        super(method: :DELETE, uri: "/v2/empresas/#{url_encode(empresa_id)}/nfc-e/#{url_encode(nf_id)}")
      end
    end
  end
end
