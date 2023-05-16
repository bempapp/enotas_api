# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V2
    class EmpresaEndereco < EnotasApi::Entity
      attributes uf: :string,
                 cidade: :string,
                 logradouro: :string,
                 numero: :string,
                 complemento: :string,
                 bairro: :string,
                 cep: :string
    end
  end
end
