# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class ListarNotasFiscais < EnotasApi::Request
      paginable
      filterable :status, :eq
      sortable %i[data_criacao]

      def initialize(empresa_id)
        super(uri: "/v1/empresas/#{url_encode(empresa_id)}/nfes")
      end
    end
  end
end
