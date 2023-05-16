# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V2
    class VincularCertificado < EnotasApi::Request
      def initialize(empresa_id, nome_arquivo, arquivo, senha)
        form_data = { 'FileName' => nome_arquivo, 'arquivo' => arquivo, 'senha' => senha }
        super(method: :POST_FORM, uri: "/v2/empresas/#{url_encode(empresa_id)}/certificadoDigital", content: form_data)
      end
    end
  end
end
