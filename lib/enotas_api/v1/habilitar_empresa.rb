# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class HabilitarEmpresa < EnotasApi::Request
      def initialize(empresa_id)
        super(method: :POST, uri: "/v1/empresas/#{url_encode(empresa_id)}/habilitar")
      end
    end
  end
end
