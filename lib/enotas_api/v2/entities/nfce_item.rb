# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfce_item_impostos'

module EnotasApi
  module V2
    class NfceItem < EnotasApi::Entity
      attributes cfop: :string,
                 codigo: :string,
                 descricao: :string,
                 sku: :string,
                 ncm: :string,
                 cest: :string,
                 quantidade: :integer,
                 unidadeMedida: :string,
                 valorUnitario: :decimal,
                 impostos: NfceItemImpostos,
                 informacoesAdicionais: :string,
                 ean: :string,
                 eanTributavel: :string
    end
  end
end
