# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class ConsultarEmpresa < EnotasApi::Request
      def initialize(id)
        super(uri: "/v1/empresas/#{url_encode(id)}")
      end
    end
  end
end
