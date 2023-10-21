# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfce_cliente_endereco'

module EnotasApi
  module V2
    class NfceCliente < EnotasApi::Entity
      attributes endereco: NfceClienteEndereco,
                 tipoPessoa: :string,
                 nome: :string,
                 email: :string,
                 cpfCnpj: :string,
                 inscricaoMunicipal: :string,
                 inscricaoEstadual: :string,
                 indicadorContribuinteICMS: :string,
                 telefone: :string
    end
  end
end
