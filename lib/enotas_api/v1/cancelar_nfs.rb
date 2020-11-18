# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class CancelarNfs < EnotasApi::Request
      def initialize(empresa_id, nfs_id)
        super(method: :DELETE, uri: "/v1/empresas/#{url_encode(empresa_id)}/nfes/#{url_encode(nfs_id)}")
      end
    end
  end
end
