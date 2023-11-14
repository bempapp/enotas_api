# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V2
    class EmpresaEmissaoNfeConsumidorConfiguracoesCsc < EnotasApi::Entity
      attributes id: :string,
                 codigo: :string
    end
  end
end
