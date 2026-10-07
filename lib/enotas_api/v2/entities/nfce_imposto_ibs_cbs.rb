# frozen_string_literal: true

require_relative '../../common/entity'
require_relative 'nfce_imposto_ibs'
require_relative 'nfce_imposto_cbs'

module EnotasApi
  module V2
    class NfceImpostoIbsCbs < EnotasApi::Entity
      attributes situacaoTributaria: :string,
                 classificacaoTributaria: :string,
                 ibs: NfceImpostoIbs,
                 cbs: NfceImpostoCbs
    end
  end
end
