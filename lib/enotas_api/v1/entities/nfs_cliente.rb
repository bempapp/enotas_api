# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V1
    class NfsCliente < EnotasApi::Entity
      attribute :tipoPessoa, :string
      attribute :nome, :string
      attribute :email, :string
      attribute :cpfCnpj, :string
    end
  end
end
