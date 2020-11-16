# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::ConsultarCaracteristicasPrefeitura do
  let(:codigo_ibge_cidade) { 123 }
  let(:instance) { described_class.new(codigo_ibge_cidade) }

  it 'implements uri' do
    expect(instance.uri).to eq("/v1/estados/cidades/#{codigo_ibge_cidade}/provedor")
  end
end
