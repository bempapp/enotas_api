# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V2
    class VincularLogotipo < EnotasApi::Request
      def initialize(empresa_id, nome_arquivo, arquivo)
        form_data = { 'FileName' => nome_arquivo, 'logotipo' => arquivo }
        super(method: :POST_FORM, uri: "/v2/empresas/#{url_encode(empresa_id)}/logo", content: form_data)
      end
    end
  end
end
