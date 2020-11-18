# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V1
    class NfsEndereco < EnotasApi::Entity
      attribute :logradouro, :string
      attribute :numero, :string
      attribute :complemento, :string
      attribute :bairro, :string
      attribute :cep, :string
      attribute :uf, :string
      attribute :cidade, :string
    end
  end
end
