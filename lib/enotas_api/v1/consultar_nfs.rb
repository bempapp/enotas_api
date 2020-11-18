# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class ConsultarNfs < EnotasApi::Request
      def initialize(empresa_id, nfe_id)
        super(uri: "/v1/empresas/#{url_encode(empresa_id)}/nfes/#{url_encode(nfe_id)}")
      end
    end
  end
end
