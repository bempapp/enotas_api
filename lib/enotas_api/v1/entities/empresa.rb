# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'empresa_endereco'
require_relative 'empresa_configuracoes'

module EnotasApi
  module V1
    class Empresa < EnotasApi::Entity
      attributes id: :string,
                 cnpj: :string,
                 inscricaoMunicipal: :string,
                 inscricaoEstadual: :string,
                 razaoSocial: :string,
                 nomeFantasia: :string,
                 optanteSimplesNacional: :boolean,
                 email: :string,
                 telefoneComercial: :string,
                 incentivadorCultural: :boolean,
                 regimeEspecialTributacao: :string,
                 codigoServicoMunicipal: :string,
                 cnae: :string,
                 aliquotaIss: :decimal,
                 descricaoServico: :string,
                 itemListaServicoLC116: :string,
                 endereco: EmpresaEndereco,
                 configuracoesNFSeHomologacao: EmpresaConfiguracoes,
                 configuracoesNFSeProducao: EmpresaConfiguracoes
    end
  end
end
