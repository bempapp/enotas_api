# frozen_string_literal: true

require_relative '../../common/entity'

module EnotasApi
  module V1
    class NfsServico < EnotasApi::Entity
      attributes ufPrestacaoServico: :string,
                 municipioPrestacaoServico: :string,
                 descricao: :string,
                 aliquotaIss: :decimal,
                 issRetidoFonte: :boolean,
                 cnae: :string,
                 codigoServicoMunicipio: :string,
                 descricaoServicoMunicipio: :string,
                 itemListaServicoLC116: :string,
                 valorPis: :decimal,
                 valorCofins: :decimal,
                 valorCsll: :decimal,
                 valorInss: :decimal,
                 valorIr: :decimal,
                 codigoInternoServicoMunicipal: :string
    end
  end
end
