# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::NfceImpostoPorValor do
  let(:data) do
    { valorPorUnidade: 0 }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
