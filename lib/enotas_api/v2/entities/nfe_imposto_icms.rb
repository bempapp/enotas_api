# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfe_imposto_ipi'

module EnotasApi
  module V2
    class NfeImpostoIcms < EnotasApi::Entity
      attributes situacaoTributaria: :string,
                 origem: :integer,
                 aliquota: :decimal,
                 baseCalculo: :decimal,
                 modalidadeBaseCalculo: :integer,
                 percentualReducaoBaseCalculo: :decimal,
                 baseCalculoST: :decimal,
                 aliquotaST: :decimal,
                 modalidadeBaseCalculoST: :decimal,
                 percentualReducaoBaseCalculoST: :decimal,
                 percentualMargemValorAdicionadoST: :decimal
    end
  end
end
