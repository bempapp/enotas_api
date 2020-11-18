# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class EmitirNfs < EnotasApi::Request
      def initialize(empresa_id, nfs)
        super(method: :POST, uri: "/v1/empresas/#{url_encode(empresa_id)}/nfes", content: nfs.to_json)
      end
    end
  end
end
