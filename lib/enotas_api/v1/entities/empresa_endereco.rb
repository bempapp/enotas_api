# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V1
    class EmpresaEndereco < EnotasApi::Entity
      attributes codigoIbgeUf: :integer,
                 codigoIbgeCidade: :integer,
                 pais: :string,
                 uf: :string,
                 cidade: :string,
                 logradouro: :string,
                 numero: :string,
                 complemento: :string,
                 bairro: :string,
                 cep: :string
    end
  end
end
