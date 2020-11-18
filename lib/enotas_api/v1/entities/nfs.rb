# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfs_cliente'
require_relative 'nfs_endereco'
require_relative 'nfs_servico'

module EnotasApi
  module V1
    class Nfs < EnotasApi::Entity
      attribute :idExterno, :string
      attribute :ambienteEmissao, :string
      attribute :enviarPorEmail, :boolean
      attribute :cliente, EnotasApi::V1::NfsCliente
      attribute :endereco, EnotasApi::V1::NfsEndereco
      attribute :servico, EnotasApi::V1::NfsServico
      attribute :valorTotal, :decimal
    end
  end
end
