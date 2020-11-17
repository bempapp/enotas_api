# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class ConsultarCaracteristicasPrefeitura < EnotasApi::Request
      def initialize(codigo_ibge_cidade)
        super(uri: "/v1/estados/cidades/#{url_encode(codigo_ibge_cidade)}/provedor")
      end
    end
  end
end
