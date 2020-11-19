# frozen_string_literal: true

require_relative '../common/request'
require_relative '../common/raw_result'

module EnotasApi
  module V1
    class BaixarXmlNfsIdExterno < EnotasApi::Request
      def initialize(empresa_id, id_externo)
        uri = "/v1/empresas/#{url_encode(empresa_id)}/nfes/porIdExterno/#{url_encode(id_externo)}/xml"
        super(uri: uri)
      end
    end
  end
end
