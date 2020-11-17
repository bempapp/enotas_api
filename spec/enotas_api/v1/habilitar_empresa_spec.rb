# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::HabilitarEmpresa do
  let(:empresa_id) { 123 }
  let(:instance) { described_class.new(empresa_id) }

  it 'have expected uri' do
    expect(instance.uri).to eq("/v1/empresas/#{empresa_id}/habilitar")
  end

  it 'have expected method' do
    expect(instance.method).to eq(:POST)
  end
end
