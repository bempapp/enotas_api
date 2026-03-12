# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V1
    class NfsServicoIbsCbs < EnotasApi::Entity
      attributes classificacaoTributaria: :string,
                 codigoIndicadorOperacao: :string
    end
  end
end
