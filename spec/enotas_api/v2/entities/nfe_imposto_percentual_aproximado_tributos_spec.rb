# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::NfeImpostoPercentualAproximadoTributos do
  let(:data) do
    { simplificado: { percentual: 0 },
      detalhado: { percentualFederal: 0,
                   percentualEstadual: 0,
                   percentualMunicipal: 0 },
      fonte: 'string' }
  end
  let(:instance) { described_class.new(data) }

  it 'have expected attributes' do
    expect(instance.to_json).to eq(data.to_json)
  end
end
