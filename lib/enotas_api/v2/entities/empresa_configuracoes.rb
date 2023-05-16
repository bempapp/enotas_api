# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V2
    class EmpresaConfiguracoes < EnotasApi::Entity
      attributes sequencialNFe: :integer,
                 serieNFe: :string,
                 sequencialLoteNFe: :integer
    end
  end
end
