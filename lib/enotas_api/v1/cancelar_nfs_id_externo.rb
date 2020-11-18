# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class CancelarNfsIdExterno < EnotasApi::Request
      def initialize(empresa_id, id_externo)
        super(method: :DELETE, uri: "/v1/empresas/#{url_encode(empresa_id)}/nfes/porIdExterno/#{url_encode(id_externo)}")
      end
    end
  end
end
