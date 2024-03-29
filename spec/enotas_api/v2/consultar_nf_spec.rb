# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::ConsultarNfc do
  let(:empresa_id) { 123 }
  let(:nf_id) { 456 }
  let(:instance) { described_class.new(empresa_id, nf_id) }

  it 'implements uri' do
    expect(instance.uri).to eq("/v2/empresas/#{empresa_id}/nfc-e/#{nf_id}")
  end
end
