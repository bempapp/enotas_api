# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V1
    class NfsClienteEndereco < EnotasApi::Entity
      attributes logradouro: :string,
                 numero: :string,
                 complemento: :string,
                 bairro: :string,
                 cep: :string,
                 uf: :string,
                 cidade: :string
    end
  end
end
