# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'empresa_configuracoes'

module EnotasApi
  module V2
    class EmpresaEmissaoNfeProduto < EnotasApi::Entity
      attributes ambienteProducao: EmpresaConfiguracoes,
                 ambienteHomologacao: EmpresaConfiguracoes
    end
  end
end
