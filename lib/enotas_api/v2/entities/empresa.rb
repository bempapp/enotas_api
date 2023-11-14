# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'empresa_endereco'
require_relative 'empresa_emissao_nfe_produto'
require_relative 'empresa_emissao_nfe_consumidor'

module EnotasApi
  module V2
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
                 endereco: EmpresaEndereco,
                 emissaoNFeProduto: EmpresaEmissaoNfeProduto,
                 emissaoNFeConsumidor: EmpresaEmissaoNfeConsumidor
    end
  end
end
