# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'endereco'
require_relative 'empresa_configuracoes'

module EnotasApi
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
    attribute :endereco, EnotasApi::Endereco
    attribute :configuracoesNFSeHomologacao, EnotasApi::EmpresaConfiguracoes
    attribute :configuracoesNFSeProducao, EnotasApi::EmpresaConfiguracoes
  end
end
