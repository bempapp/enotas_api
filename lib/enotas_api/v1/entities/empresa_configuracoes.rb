# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V1
    class EmpresaConfiguracoes < EnotasApi::Entity
      attribute :sequencialNFe, :integer
      attribute :serieNFe, :string
      attribute :sequencialLoteNFe, :integer
      attribute :usuarioAcessoProvedor, :string
      attribute :senhaAcessoProvedor, :string
      attribute :tokenAcessoProvedor, :string
    end
  end
end
