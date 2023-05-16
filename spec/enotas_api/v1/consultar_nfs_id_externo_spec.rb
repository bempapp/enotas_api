# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::ConsultarNfsIdExterno do
  let(:empresa_id) { 123 }
  let(:id_externo) { 456 }
  let(:instance) { described_class.new(empresa_id, id_externo) }

  it 'implements uri' do
    expect(instance.uri).to eq("/v1/empresas/#{empresa_id}/nfes/porIdExterno/#{id_externo}")
  end
end
