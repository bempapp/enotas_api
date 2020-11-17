# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class ConsultarCidadesServicoMunicipalUnificado < EnotasApi::Request
      paginable

      def initialize
        super(uri: '/v1/servicos/cidades')
      end
    end
  end
end
