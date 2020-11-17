# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class IncluirAtualizarEmpresa < EnotasApi::Request
      def initialize(empresa)
        super(method: :POST, uri: '/v1/empresas', body: empresa.to_json)
      end
    end
  end
end
