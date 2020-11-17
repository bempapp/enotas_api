# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class ConsultarNotaFiscal < EnotasApi::Request
      def initialize(empresa_id, nfe_id)
        @empresa_id = empresa_id
        @nfe_id = nfe_id
        super()
      end

      def uri
        "/v1/empresas/#{url_encode(@empresa_id)}/nfes/#{url_encode(@nfe_id)}"
      end
    end
  end
end
