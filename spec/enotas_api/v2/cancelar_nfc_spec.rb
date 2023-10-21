# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::CancelarNfc do
  let(:empresa_id) { '123' }
  let(:nf_id) { '123' }
  let(:instance) { described_class.new(empresa_id, nf_id) }

  it 'have expected uri' do
    expect(instance.uri).to eq("/v2/empresas/#{empresa_id}/nfc-e/#{nf_id}")
  end

  it 'have expected method' do
    expect(instance.method).to eq(:DELETE)
  end
end
