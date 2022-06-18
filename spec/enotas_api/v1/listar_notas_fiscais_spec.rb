# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::ListarNotasFiscais do
  let(:empresa_id) { 123 }
  let(:instance) { described_class.new(empresa_id) }

  it 'implements uri' do
    expect(instance.uri).to eq("/v1/empresas/#{empresa_id}/nfes")
  end

  it 'allow pagination' do
    expect(instance.respond_to?(:page)).to be true
  end

  it 'allow sort by expected fields' do
    expect(instance.respond_to?(:sort)).to be true
    expect(instance.respond_to?(:sort_by_data_criacao)).to be true
  end
end
