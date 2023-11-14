# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'empresa_emissao_nfe_consumidor_configuracoes_csc'

module EnotasApi
  module V2
    class EmpresaEmissaoNfeConsumidorConfiguracoes < EnotasApi::Entity
      attributes sequencialNFe: :integer,
                 serieNFe: :string,
                 csc: EmpresaEmissaoNfeConsumidorConfiguracoesCsc
    end
  end
end
