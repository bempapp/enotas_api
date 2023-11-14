# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'empresa_emissao_nfe_consumidor_configuracoes'

module EnotasApi
  module V2
    class EmpresaEmissaoNfeConsumidor < EnotasApi::Entity
      attributes ambienteProducao: EmpresaEmissaoNfeConsumidorConfiguracoes,
                 ambienteHomologacao: EmpresaEmissaoNfeConsumidorConfiguracoes
    end
  end
end
