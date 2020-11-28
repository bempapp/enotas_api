# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V1
    class EmpresaConfiguracoes < EnotasApi::Entity
      attributes sequencialNFe: :integer,
                 serieNFe: :string,
                 sequencialLoteNFe: :integer,
                 usuarioAcessoProvedor: :string,
                 senhaAcessoProvedor: :string,
                 tokenAcessoProvedor: :string
    end
  end
end
