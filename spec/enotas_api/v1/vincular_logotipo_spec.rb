# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::VincularLogotipo do
  let(:empresa_id) { 123 }
  let(:file_name) { 'logo.png' }
  let(:file) { 'file' }
  let(:instance) { described_class.new(empresa_id, file_name, file) }

  it 'implements uri' do
    expect(instance.uri).to eq("/v1/empresas/#{empresa_id}/logo")
  end

  it 'have expected method' do
    expect(instance.method).to eq(:POST_FORM)
  end

  it 'have expected content' do
    expect(instance.content).to eq({ 'FileName' => file_name, 'logotipo' => file })
  end
end
