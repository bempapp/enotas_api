# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::NfceImpostoIbsCbs do
  let(:data) do
    { situacaoTributaria: '000',
      classificacaoTributaria: '000001',
      ibs: { uf: { aliquota: 0.1,
                   percentualDiferimento: 0,
                   percentualReducaoAliquota: 60 },
             municipio: { aliquota: 0 } },
      cbs: { aliquota: 0.9,
             percentualDiferimento: 0,
             percentualReducaoAliquota: 60 } }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
