# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::ConsultarNfs do
  let(:empresa_id) { 123 }
  let(:nfe_id) { 456 }
  let(:instance) { described_class.new(empresa_id, nfe_id) }

  it 'implements uri' do
    expect(instance.uri).to eq("/v1/empresas/#{empresa_id}/nfes/#{nfe_id}")
  end
end
