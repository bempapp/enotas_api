# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'empresa_endereco'
require_relative 'empresa_configuracoes'

module EnotasApi
  module V1
    class Empresa < EnotasApi::Entity
      attribute :id, :string
      attribute :cnpj, :string
      attribute :inscricaoMunicipal, :string
      attribute :inscricaoEstadual, :string
      attribute :razaoSocial, :string
      attribute :nomeFantasia, :string
      attribute :optanteSimplesNacional, :boolean
      attribute :email, :string
      attribute :telefoneComercial, :string
      attribute :incentivadorCultural, :boolean
      attribute :regimeEspecialTributacao, :string
      attribute :codigoServicoMunicipal, :string
      attribute :cnae, :string
      attribute :aliquotaIss, :decimal
      attribute :descricaoServico, :string
      attribute :itemListaServicoLC116, :string
      attribute :endereco, EnotasApi::V1::EmpresaEndereco
      attribute :configuracoesNFSeHomologacao, EnotasApi::V1::EmpresaConfiguracoes
      attribute :configuracoesNFSeProducao, EnotasApi::V1::EmpresaConfiguracoes
    end
  end
end
