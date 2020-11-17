# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class ConsultarServicosMunicipais < EnotasApi::Request
      paginable
      filterable :descricao, :contains

      def initialize(uf, nome_cidade)
        super(uri: "/v1/estados/#{url_encode(uf)}/cidades/#{url_encode(nome_cidade)}/servicos")
      end
    end
  end
end
