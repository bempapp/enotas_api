# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::EmitirNf do
  let(:empresa_id) { 123 }
  let(:nf) { EnotasApi::V2::Nfe.new({ id: 'id' }) }
  let(:instance) { described_class.new(empresa_id, nf) }

  it 'have expected uri' do
    expect(instance.uri).to eq("/v2/empresas/#{empresa_id}/nf-e")
  end

  it 'have expected method' do
    expect(instance.method).to eq(:POST)
  end

  it 'have expected content' do
    expect(instance.content).to eq(nf.to_json)
  end
end
