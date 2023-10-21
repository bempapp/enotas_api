# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::NfceImpostoIcms do
  let(:data) do
    { situacaoTributaria: 'string',
      origem: 0,
      aliquota: 0,
      baseCalculo: 0,
      modalidadeBaseCalculo: 0,
      percentualReducaoBaseCalculo: 0,
      baseCalculoST: 0,
      aliquotaST: 0,
      modalidadeBaseCalculoST: 0,
      percentualReducaoBaseCalculoST: 0,
      percentualMargemValorAdicionadoST: 0 }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
