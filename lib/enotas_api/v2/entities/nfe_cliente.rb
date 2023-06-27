# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfe_cliente_endereco'

module EnotasApi
  module V2
    class NfeCliente < EnotasApi::Entity
      attributes endereco: NfeClienteEndereco,
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
