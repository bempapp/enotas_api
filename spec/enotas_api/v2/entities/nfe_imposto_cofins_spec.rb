# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::NfeImpostoCofins do
  let(:data) do
    { situacaoTributaria: 'string',
      porAliquota: { aliquota: 0 },
      porValor: { valorPorUnidade: 0 } }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
