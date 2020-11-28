# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfs_cliente'
require_relative 'nfs_servico'
require_relative 'nfs_dados_adicionais_email'

module EnotasApi
  module V1
    class Nfs < EnotasApi::Entity
      attributes idExterno: :string,
                 ambienteEmissao: :string,
                 numeroRps: :integer,
                 serieRps: :string,
                 tipo: :string,
                 dataCompetencia: :datetime,
                 enviarPorEmail: :boolean,
                 dadosAdicionaisEmail: NfsDadosAdicionaisEmail,
                 cliente: NfsCliente,
                 servico: NfsServico,
                 naturezaOperacao: :string,
                 deducoes: :decimal,
                 descontos: :decimal,
                 valorTotal: :decimal,
                 observacoes: :string
    end
  end
end
