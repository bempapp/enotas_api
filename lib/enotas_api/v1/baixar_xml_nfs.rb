# frozen_string_literal: true

require_relative '../common/request'
require_relative '../common/raw_result'

module EnotasApi
  module V1
    class BaixarXmlNfs < EnotasApi::Request
      def initialize(empresa_id, nfs_id)
        uri = "/v1/empresas/#{url_encode(empresa_id)}/nfes/#{url_encode(nfs_id)}/xml"
        super(uri:)
      end
    end
  end
end
