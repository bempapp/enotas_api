# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::NfceImpostoIbs do
  let(:data) do
    { uf: { aliquota: 0.1,
            percentualDiferimento: 0,
            percentualReducaoAliquota: 60 },
      municipio: { aliquota: 0 } }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
