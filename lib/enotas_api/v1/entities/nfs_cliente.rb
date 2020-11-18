# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfs_cliente_endereco'

module EnotasApi
  module V1
    class NfsCliente < EnotasApi::Entity
      attribute :tipoPessoa, :string
      attribute :nome, :string
      attribute :email, :string
      attribute :cpfCnpj, :string
      attribute :endereco, EnotasApi::V1::NfsClienteEndereco
    end
  end
end
