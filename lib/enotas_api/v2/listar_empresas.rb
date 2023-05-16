# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V2
    class ListarEmpresas < EnotasApi::Request
      paginable
      searchable %i[nome_fantasia razao_social]
      sortable %i[nome_fantasia razao_social cidade data_criacao data_ultima_modificacao]

      def initialize
        super(uri: '/v2/empresas')
      end
    end
  end
end
