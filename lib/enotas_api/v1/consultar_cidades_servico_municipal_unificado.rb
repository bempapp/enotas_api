# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class ConsultarCidadesServicioMunicipalUnificado < EnotasApi::Request
      paginable

      def uri
        '/v1/servicos/cidades'
      end
    end
  end
end
