# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V2::VincularLogotipo do
  let(:empresa_id) { 123 }
  let(:nome_arquivo) { 'logo.png' }
  let(:arquivo) { 'file' }
  let(:instance) { described_class.new(empresa_id, nome_arquivo, arquivo) }

  it 'implements uri' do
    expect(instance.uri).to eq("/v2/empresas/#{empresa_id}/logo")
  end

  it 'have expected method' do
    expect(instance.method).to eq(:POST_FORM)
  end

  it 'have expected content' do
    expect(instance.content).to eq({ 'FileName' => nome_arquivo, 'logotipo' => arquivo })
  end
end
