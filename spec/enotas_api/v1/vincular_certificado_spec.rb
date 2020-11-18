# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::VincularCertificado do
  let(:empresa_id) { 123 }
  let(:nome_arquivo) { 'certificado.pfx' }
  let(:arquivo) { 'file' }
  let(:senha) { 'senha' }
  let(:instance) { described_class.new(empresa_id, nome_arquivo, arquivo, senha) }

  it 'implements uri' do
    expect(instance.uri).to eq("/v1/empresas/#{empresa_id}/certificadoDigital")
  end

  it 'have expected method' do
    expect(instance.method).to eq(:POST_FORM)
  end

  it 'have expected content' do
    expect(instance.content).to eq({ 'FileName' => nome_arquivo, 'arquivo' => arquivo, 'senha' => senha })
  end
end
