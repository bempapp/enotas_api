# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'empresa_endereco'
require_relative 'empresa_emissao_nfe_produto'

module EnotasApi
  module V2
    class NfeReferenciada < EnotasApi::Entity
      attributes chaveAcesso: :string
    end
  end
end
