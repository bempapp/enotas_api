# frozen_string_literal: true

require 'spec_helper'

RSpec.describe EnotasApi::V1::ConsultarServicosMunicipais do
  let(:uf) { 'UF' }
  let(:nome_cidade) { 'CIDADE' }
  let(:instance) { described_class.new(uf, cidade) }

  it 'implements uri' do
    expect(instance.uri).to eq("/v1/estados/#{uf}/cidades/#{nome_cidade}/servicos")
  end

  it 'allow pagination' do
    expect(instance.respond_to?(:page)).to eq true
  end

  it 'allow filter by description' do
    expect(instance.respond_to?(:description_contains)).to eq true
  end
end
