# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfe_item_impostos'

module EnotasApi
  module V2
    class NfeItem < EnotasApi::Entity
      attributes cfop: :string,
                 codigo: :string,
                 descricao: :string,
                 descontos: :decimal,
                 sku: :string,
                 ncm: :string,
                 cest: :string,
                 quantidade: :integer,
                 unidadeMedida: :string,
                 valorUnitario: :decimal,
                 frete: :decimal,
                 impostos: NfeItemImpostos,
                 informacoesAdicionais: :string,
                 ean: :string,
                 eanTributavel: :string
    end
  end
end
