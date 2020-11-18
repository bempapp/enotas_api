# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V1
    class NfsServico < EnotasApi::Entity
      attribute :descricao, :string
      attribute :aliquotaIss, :decimal
      attribute :issRetidoFonte, :boolean
      attribute :cnae, :string
      attribute :codigoServicoMunicipio, :string
      attribute :valorPis, :decimal
      attribute :valorCofins, :decimal
      attribute :valorCsll, :decimal
      attribute :valorInss, :decimal
      attribute :valorIr, :decimal
    end
  end
end
