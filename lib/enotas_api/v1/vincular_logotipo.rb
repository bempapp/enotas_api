# frozen_string_literal: true

require_relative '../common/request'

module EnotasApi
  module V1
    class VincularLogotipo < EnotasApi::Request
      def initialize(empresa_id, file_name, file)
        form_data = { 'FileName' => file_name, 'logotipo' => file }
        super(method: :POST_FORM, uri: "/v1/empresas/#{url_encode(empresa_id)}/logo", content: form_data)
      end
    end
  end
end
