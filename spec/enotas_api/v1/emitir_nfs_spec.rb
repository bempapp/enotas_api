# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::EmitirNfs do
  let(:empresa_id) { 123 }
  let(:nfs) { EnotasApi::V1::Nfs.new({ idExterno: 'idExterno' }) }
  let(:instance) { described_class.new(empresa_id, nfs) }

  it 'have expected uri' do
    expect(instance.uri).to eq("/v1/empresas/#{empresa_id}/nfes")
  end

  it 'have expected method' do
    expect(instance.method).to eq(:POST)
  end

  it 'have expected content' do
    expect(instance.content).to eq(nfs.to_json)
  end
end
