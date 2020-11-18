# frozen_string_literal: true

require_relative '../common/request'
require_relative '../common/raw_result'

module EnotasApi
  module V1
    class BaixarPdfNfsIdExterno < EnotasApi::Request
      def initialize(empresa_id, id_externo)
        uri = "/v1/empresas/#{url_encode(empresa_id)}/nfes/porIdExterno/#{url_encode(id_externo)}/pdf"
        super(uri: uri, result_object: EnotasApi::RawResult)
      end
    end
  end
end
