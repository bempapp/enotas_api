# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V1
    class EmpresaEndereco < EnotasApi::Entity
      attribute :codigoIbgeUf, :integer
      attribute :codigoIbgeCidade, :integer
      attribute :pais, :string
      attribute :uf, :string
      attribute :cidade, :string
      attribute :logradouro, :string
      attribute :numero, :string
      attribute :complemento, :string
      attribute :bairro, :string
      attribute :cep, :string
    end
  end
end