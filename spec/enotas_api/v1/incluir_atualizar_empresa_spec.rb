# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::IncluirAtualizarEmpresa do
  let(:empresa) { EnotasApi::Empresa.new({ id: '123' }) }
  let(:instance) { described_class.new(empresa) }

  it 'have expected uri' do
    expect(instance.uri).to eq('/v1/empresas')
  end

  it 'have expected method' do
    expect(instance.method).to eq(:POST)
  end

  it 'have expected body' do
    expect(instance.body).to eq(empresa.to_json)
  end
end
