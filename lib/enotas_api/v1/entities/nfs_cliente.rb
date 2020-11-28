# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfs_cliente_endereco'

module EnotasApi
  module V1
    class NfsCliente < EnotasApi::Entity
      attributes tipoPessoa: :string,
                 nome: :string,
                 email: :string,
                 cpfCnpj: :string,
                 inscricaoMunicipal: :string,
                 inscricaoEstadual: :string,
                 telefone: :string,
                 endereco: NfsClienteEndereco
    end
  end
end
