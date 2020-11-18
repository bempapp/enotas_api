# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::CancelarNfsIdExterno do
  let(:empresa_id) { '123' }
  let(:id_externo) { '123' }
  let(:instance) { described_class.new(empresa_id, id_externo) }

  it 'have expected uri' do
    expect(instance.uri).to eq("/v1/empresas/#{empresa_id}/nfes/porIdExterno/#{id_externo}")
  end

  it 'have expected method' do
    expect(instance.method).to eq(:DELETE)
  end
end
