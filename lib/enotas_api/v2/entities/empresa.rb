# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'empresa_endereco'
require_relative 'empresa_emissao_nfe_produto'

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
                 emissaoNFeProduto: EmpresaEmissaoNfeProduto
    end
  end
end
