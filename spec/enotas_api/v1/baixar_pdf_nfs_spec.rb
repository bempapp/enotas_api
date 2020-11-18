# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::BaixarPdfNfs do
  let(:empresa_id) { '123' }
  let(:nfs_id) { '123' }
  let(:instance) { described_class.new(empresa_id, nfs_id) }

  it 'have expected uri' do
    expect(instance.uri).to eq("/v1/empresas/#{empresa_id}/nfes/#{nfs_id}/pdf")
  end

  it 'have expected result' do
    expect(instance.result_object).to eq(EnotasApi::RawResult)
  end
end
