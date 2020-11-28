# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfs_cliente'
require_relative 'nfs_servico'

module EnotasApi
  module V1
    class NfsDadosAdicionaisEmail < EnotasApi::Entity
      attributes outrosDestinatarios: :string
    end
  end
end
